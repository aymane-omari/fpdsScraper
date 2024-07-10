# tests/testthat/test-scrape_fpds_data.R

library(testthat)
library(fpdsScraper)

# Test case for scrape_fpds_data function
test_that("scrape_fpds_data works", {
  # URL for testing
  test_url <- "https://www.fpds.gov/ezsearch/fpdsportal?indexName=awardfull&templateName=1.5.3&s=FPDS.GOV&q=tote+bag"

  # Run the function
  result <- scrape_fpds_data(test_url)

  # Check if the result is a data frame
  expect_s3_class(result, "data.frame")

  # Add more specific expectations based on the structure or content of the result
  expect_true(nrow(result) > 0, "The result should not be an empty data frame.")
  # Add more expectations based on your specific requirements.
})
