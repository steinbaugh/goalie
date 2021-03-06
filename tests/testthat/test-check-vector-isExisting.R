## Note that these checks don't inherit by default, so place the variables to
## check inside the `test_that()` call.



context("check : vector : isExisting")

test_that("TRUE", {
    a <- 1L
    b <- 2L
    ok <- isExisting(c("a", "b"))
    expect_identical(ok, c(a = TRUE, b = TRUE))
})

test_that("FALSE", {
    ok <- isExisting(c("x", "y"))
    expect_s4_class(ok, "goalie")
    expect_identical(nocause(ok), c(x = FALSE, y = FALSE))
    expect_identical(
        cause(ok),
        c(x = "non-existing", y = "non-existing")
    )
})



context("check : scalar : allAreExisting")

test_that("TRUE", {
    a <- 1L
    b <- 2L
    expect_true(allAreExisting(c("a", "b")))
})

test_that("FALSE", {
    ok <- allAreExisting(c("x", "y"))
    expect_false(ok)
    expect_s4_class(ok, "goalie")
})



context("check : scalar : allAreNonExisting")

test_that("TRUE", {
    ok <- allAreNonExisting(c("x", "y"))
    expect_true(ok)
})

test_that("FALSE", {
    a <- 1L
    b <- 2L
    ok <- allAreNonExisting(c("a", "b"))
    expect_false(ok)
    expect_s4_class(ok, "goalie")
})
