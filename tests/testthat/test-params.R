test_that("downloading from gs works", {
  expect_equal(
    object = {
      get_params_from_gs(
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
