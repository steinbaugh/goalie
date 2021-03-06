context("check : scalar : formalCompress")

test_that("TRUE", {
    expect_true(formalCompress("gzip"))
    expect_true(formalCompress(TRUE))
})

test_that("FALSE : unsupported string", {
    ok <- formalCompress("xxx")
    expect_false(ok)
    expect_s4_class(ok, "goalie")
    expect_identical(
        cause(ok),
        paste0(
            "'compress' has elements not in ",
            "'c(\"bzip2\", \"gzip\", \"xz\")': xxx"
        )
    )
})

test_that("FALSE : not character", {
    ok <- formalCompress(NULL)
    expect_false(ok)
    expect_s4_class(ok, "goalie")
    expect_identical(
        cause(ok),
        "'compress' is not any of: character, logical."
    )
})

test_that("FALSE : logical NA is not boolean", {
    ok <- formalCompress(NA)
    expect_false(ok)
    expect_s4_class(ok, "goalie")
    expect_identical(
        cause(ok),
        "'compress' is NA."
    )
})
