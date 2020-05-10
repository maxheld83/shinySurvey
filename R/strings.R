#' Retrieve paths to longer strings
#' Returns paths to (markdown) files containing longer string parameters.
#'
#' @param filenames `[character()]` giving the filenames of longer strings expected at `path`, *without extension*.
#' Defaults to `NULL`, in which case all `*.md`s at `path` are returned.
#' @param path `[character(1)]` giving the path to a directory including `*.md`s with longer strings.
#'
#' @section Storing longer strings:
#' Longer strings, such as for survey questions or user interface are often best edited in separate files with proper markup (markdown) support.
#' In the context of a package, they are best saved in`inst/`, which can be conveniently accessed with [system.file()].
#'
#' @return `[character()]` giving absolute paths to files, named by `filenames` without extension.
#' @export
strings_from_mdfile <- function(filenames = NULL, path) {
  checkmate::assert_character(
    x = filenames,
    unique = TRUE,
    any.missing = FALSE,
    null.ok = TRUE
  )
  checkmate::assert_directory_exists(x = path)
  if (is.null(filenames)) {
    res <- fs::dir_ls(
      path = path,
      recurse = FALSE,
      type = "file",
      glob = "*.md"
    )
  } else {
    res <- fs::path_abs(path = fs::path(path, filenames, ext = "md"))
    checkmate::assert_file_exists(x = res)
  }
  names(res) <- fs::path_ext_remove(fs::path_file(path = res))
  res
}
