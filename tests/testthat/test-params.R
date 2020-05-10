test_that("downloading from gs works", {
  expect_equal(
    object = {
      params_from_gs(
        ss = "1AnoTL0vYroE375lOGx1KHPSBuryfSotPLNYpIVgFs1s",
        sheet = "groups",
        dir = test_path()
      )
    },
    expected = {
      source(file = test_path("params_groups.R"))$value
    }
  )
})

test_that("paths from all mds are found", {
  checkmate::expect_file_exists(
    x = strings_from_mdfile(
      path = system.file("markdowns", package = "shinySurvey")
    )
  )
})
