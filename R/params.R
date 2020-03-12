#' Download survey parameters from Google Spreadsheet
#'
#' When [googlesheets4::sheets_has_token()], returns updated `ss` from `sheet`, otherwise local copy from last run.
#' See [googlesheets4::read_sheet()] for details.
#'
#' @details
#' On the one hand, it is best to keep all survey application parameters (such as response options) under source control management (SCM).
#' On the other hand, some study collaborators may want to frequently and easily change parameters, and be unable or unwilling to use SCM.
#'
#' This function allows such "non-tech" collaborators to edit survey parameters in a Google Spreadsheet online, while regularly commiting their contributions to the source.
#'
#' To use this function:
#' 1. Set up a Google Spreadsheet; authorise collaborators and optionally add write protections and notifications for the developer where appropriate.
#' 2. Let collaborators edit the Google Spreadsheet.
#' 3. Whenever an edit has been made, the developing collaborator can pull updates from Google Spreadsheets using this function from her local development machine (or wherever ([googlesheets4::sheets_has_token()]) and commit the result as a deparsed tibble.
#'
#' Ensure that changing entry parameters will not compromise data collection, the database schema or analysis.
#'
#' @inheritDotParams googlesheets4::read_sheet
#' @inheritParams googlesheets4::read_sheet
#' @param dir `[character(1)]`
#' giving the directory to store serialised `sheet`.
#' Should be under version control.
#' @inherit googlesheets4::read_sheet return
#' @export
get_params_from_gs <- function(sheet,
                               ss = getOption("shinySurvey.ss"),
                               dir = getOption("shinySurvey.dir"),
                               ...) {
  requireNamespace2(x = "googlesheets4")
  file <- fs::path(dir, paste0("params_", sheet), ext = "R")
  if (googlesheets4::sheets_has_token()) {
    requireNamespace2(x = "datapasta")
    res <- googlesheets4::read_sheet(
      ss = ss,
      sheet = sheet,
      ...
    )
    res <- datapasta::tribble_construct(input_table = res)
    write(x = res, file = file)
  }
  checkmate::assert_file_exists(x = file)
  source(file = file)$value
}
