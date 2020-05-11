test_that("paths from all mds are found", {
  checkmate::expect_file_exists(
    x = strings_from_mdfile(
      path = system.file("markdowns", package = "shinySurvey")
    )
  )
})
