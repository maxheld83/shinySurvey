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

test_that("named vectors are created", {
  df_wrong <- tibble::tibble(
    short = c("f", "b"),
    long = c("foo", "bar")
  )
  expect_equal(
    object = deframe2(df_wrong),
    expected = c(foo = "f", bar = "b")
  )
})
