test_that("Test snomed_usage column names", {
  test_names <- names(snomed_usage)
  expect_equal(
    test_names,
    c(
      "start_date",
      "end_date",
      "snomed_concept_id",
      "usage",
      "active_at_start",
      "active_at_end"
    )
  )
})

test_that("Test snomed_dict column names", {
  test_names <- names(snomed_dict)
  expect_equal(
    test_names,
    c(
      "start_date",
      "end_date",
      "snomed_concept_id",
      "description"
    )
  )
})

test_that("Test snomed_usage rows", {
  test_nrow <- nrow(snomed_usage)
  expect_equal(test_nrow, 1366513L)
})

test_that("Test snomed_dict rows", {
  test_nrow <- nrow(snomed_dict)
  expect_equal(test_nrow, 1366513L)
})

test_that("Test snomed_usage date range", {
  test_range_start_date <- range(snomed_usage$start_date)
  test_range_end_date <- range(snomed_usage$end_date)

  expect_equal(
    test_range_start_date,
    c(as.Date("2011-08-01"), as.Date("2022-08-01"))
  )
  expect_equal(
    test_range_end_date,
    c(as.Date("2012-07-31"), as.Date("2023-07-31"))
  )
})

test_that("Test snomed_dict date range", {
  test_range_start_date <- range(snomed_dict$start_date)
  test_range_end_date <- range(snomed_dict$end_date)

  expect_equal(
    test_range_start_date,
    c(as.Date("2011-08-01"), as.Date("2022-08-01"))
  )
  expect_equal(
    test_range_end_date,
    c(as.Date("2012-07-31"), as.Date("2023-07-31"))
  )
})
