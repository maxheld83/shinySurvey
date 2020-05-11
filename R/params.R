#' Download tabular survey parameters from Google Spreadsheets
#'
#' When [googlesheets4::sheets_has_token()], returns updated `ss` from `sheet`, otherwise local copy from last run.
#' See [googlesheets4::read_sheet()] for details.
#'
#' @param dir `[character(1)]`
#' giving the directory to store serialised `sheet`.
#' Should be under version control.
#' @param update `[logical(1)]`
#' giving whether the file in `dir` should be updated.
#' Under the default [googlesheets4::sheets_has_token()], the data will be updated whenever a token is available.
#' @inheritDotParams googlesheets4::read_sheet
#' @inheritParams googlesheets4::read_sheet
#'
#' @inherit googlesheets4::read_sheet return
#'
#' @section Storing parameters on goooglesheets:
#' On the one hand, it is best to keep all survey application parameters (such as response options) under source control management (SCM).
#' On the other hand, some study collaborators may want to frequently and easily change parameters, and be unable or unwilling to use SCM.
#'
#' This function allows such "non-tech" collaborators to edit survey parameters in a Google Spreadsheet online, while regularly committing their contributions to the source.
#'
#' To use this function:
#'
#' 1. Set up a Google Spreadsheet; authorize collaborators and optionally add write protections and notifications for the developer where appropriate.
#' 2. Let collaborators edit the Google Spreadsheet.
#' 3. Whenever an edit has been made, the developing collaborator can pull updates from Google Spreadsheets using this function from her local development machine (or wherever ([googlesheets4::sheets_has_token()]) and commit the result as a deparsed tibble.
#'
#' Ensure that changing entry parameters will not compromise data collection, the database schema or analysis.
#'
#' @section Best for tabular data:
#' This helper pertains only to those survey parameters best edited and represented in tabular form, such as dropdown options in different languages and the like.
#' Longer strings (several sentences), especially with markup, are awkward in spreadsheets and deparsed [tibble::tribble()]s and better served via [strings_from_mdfile()].
#'
#' @export
params_from_gs <- function(sheet,
                           ss = getOption("shinySurvey.ss"),
                           dir = getOption("shinySurvey.dir"),
                           update = googlesheets4::sheets_has_token(),
                           ...) {
  requireNamespace2(x = "googlesheets4")
  checkmate::assert_directory_exists(x = dir)
  checkmate::assert_flag(x = update, na.ok = FALSE)
  file <- fs::path(dir, paste0("params_", sheet), ext = "R")
  if (update) {
    checkmate::assert_true(x = googlesheets4::sheets_has_token())
    df <- googlesheets4::read_sheet(
      ss = ss,
      sheet = sheet,
      ...
    )
    requireNamespace2(x = "datapasta")
    readr::write_file(
      x = datapasta::tribble_construct(input_table = df),
      path = file
    )
  }
  checkmate::assert_file_exists(x = file)
  source(file = file)$value
}

#' Convert data frame to named vector
#'
#' `deframe2` converts two-column data frames to a named vector, using the first column as the value and the second column as the name.
#' *This is the opposite behavior of [tibble::deframe()]*.
#' Such named vectors are often useful for [shiny::selectInput()] and others.
#'
#' @inheritParams tibble::deframe
#'
#' @export
deframe2 <- function(x) {
  if (ncol(x)==2) {
    x <- x[, c(2, 1)]
  }
  tibble::deframe(x)
}
