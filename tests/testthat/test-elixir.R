
test_that("ex_eval works when there is no error", {
  expect_equal(ex_eval("IO.inspect({1, 2, 3})"), "{1, 2, 3}")
})

test_that("ex_run works when there is no error", {
  expect_equal(ex_run(script_path("example.exs")), c("hello world", "19981112"))
})
