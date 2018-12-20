#' Does the input contain a Markdown header level?
#'
#' Markdown supports header levels `1`-`7` (`<H1>`-`<H7>`).
#'
#' @export
#' @inherit params
#'
#' @examples
#' ## Pass ====
#' isHeaderLevel(1)
#'
#' ## Fail ====
#' isHeaderLevel(0)
isHeaderLevel <- function(x, .xname = getNameInParent(x)) {
    ok <- isScalarIntegerish(x)
    if (!isTRUE(ok)) return(ok)

    ok <- x %in% seq_len(7L)
    if (!isTRUE(ok)) {
        return(false(
            paste0(
                "%s is not a valid Markdown header.\n",
                "Markdown supports header levels 1-7."
            ),
            .xname
        ))
    }

    TRUE
}