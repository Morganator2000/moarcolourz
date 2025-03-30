# This file is part of the standard setup for testthat.
# It is recommended that you do not modify it.
#
# Where should you do additional test configuration?
# Learn more about the roles of various files in:
# * https://r-pkgs.org/testing-design.html#sec-tests-files-overview
# * https://testthat.r-lib.org/articles/special-files.html

library(testthat)
library(moarcolourz)

test_that("moarcolourz returns correct number of colours", {
  expect_length(moarcolourz(10), 10)
  expect_length(moarcolourz(100), 100)
})

test_that("moarcolourz throws an error for invalid input", {
  expect_error(moarcolourz(0))
  expect_error(moarcolourz(-5))
  expect_error(moarcolourz("blue"))
})
