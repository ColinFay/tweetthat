context("init")

test_that("error handling", {
  expect_error(tweet_that(12))
  expect_error(tweet_that(mean))
})
