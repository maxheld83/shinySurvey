#' Pseudonyms
#'
#' Some random english words to be used as codewords or pseudonyms.
#' Useful to identify yourself in a survey results, but not to others.
#'
#' @export
pseudonyms <- c(
  rcorpora::corpora(which = "animals/common")$animals,
  rcorpora::corpora(which = "foods/apple_cultivars")$cultivars,
  rcorpora::corpora(which = "foods/breads_and_pastries")$breads,
  rcorpora::corpora(which = "foods/breads_and_pastries")$pastries,
  rcorpora::corpora(which = "foods/condiments")$condiments,
  rcorpora::corpora(which = "foods/herbs_n_spices")$herbs,
  rcorpora::corpora(which = "foods/herbs_n_spices")$spices,
  rcorpora::corpora(which = "foods/vegetables")$vegetables,
  rcorpora::corpora(which = "music/instruments")$instruments,
  rcorpora::corpora(which = "objects/objects")$objects
)
# remove all with spaces
pseudonyms <- pseudonyms[!grepl(pattern = " ", x = pseudonyms, fixed = TRUE)]
pseudonyms <- tolower(pseudonyms)
pseudonyms <- make.names(pseudonyms)
pseudonyms <- unique(pseudonyms)
