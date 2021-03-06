#' Set comparisons
#'
#' @name check-scalar-sets
#' @note Updated 2019-08-10.
#'
#' @inherit check
#' @inheritParams AcidRoxygen::params
#'
#' @seealso
#' - `assertive.sets::is_subset()`.
#' - `assertive.sets::is_superset()`.
#' - `assertive.sets::are_disjoint_sets()`.
#' - `assertive.sets::are_intersecting_sets()`.
#' - `assertive.sets::are_set_equal()`.
#'
#' @examples
#' ## TRUE ====
#' isSubset(x = "a", y = c("a", "b"))
#'
#' ## This assert is particularly useful for checking required columns.
#' isSuperset(
#'     x = colnames(datasets::ChickWeight),
#'     y = c("Time", "weight", "Diet")
#' )
#'
#' areDisjointSets(x = c("a", "b"), y = c("c", "d"))
#' areIntersectingSets(x = c("a", "b"), y = c("b", "c"))
#' areSetEqual(x = c("a", "b"), y = c("b", "a"))
#'
#' ## FALSE ====
#' isSubset(x = "c", y = c("a", "b"))
#' isSuperset(
#'     x = c("Time", "weight", "Diet"),
#'     y = colnames(datasets::ChickWeight)
#' )
#'
#' areDisjointSets(x = c("a", "b"), y = c("b", "a"))
#' areIntersectingSets(x = c("a", "b"), y = c("c", "d"))
#' areSetEqual(x = c("a", "b"), y = c("b", "c"))
NULL



## Assertive has `strictly` mode, which enforces that x, y are not set equal.

#' @rdname check-scalar-sets
#' @export
isSubset <- function(
    x,
    y,
    .xname = getNameInParent(x),
    .yname = getNameInParent(y)
) {
    if (!isTRUE(ok <- hasLength(x))) return(ok)
    if (!isTRUE(ok <- hasLength(y))) return(ok)
    if (!isTRUE(all(x %in% y))) {
        setdiff <- setdiff(x, y)
        return(false(
            gettext("'%s' has elements not in '%s': %s"),
            .xname, .yname, toString(setdiff, width = 100L)
        ))
    }
    TRUE
}



## This is essentially an `isSubset()` call with x and y flipped.

#' @rdname check-scalar-sets
#' @export
isSuperset <- function(
    x,
    y,
    .xname = getNameInParent(x),
    .yname = getNameInParent(y)
) {
    isSubset(x = y, y = x, .xname = .yname, .yname = .xname)
}



#' @rdname check-scalar-sets
#' @export
areDisjointSets <- function(
    x,
    y,
    .xname = getNameInParent(x),
    .yname = getNameInParent(y)
) {
    intersect <- intersect(x, y)
    if (length(intersect) > 0L) {
        return(false(
            gettext("'%s' and '%s' have common elements: %s"),
            .xname, .yname, toString(intersect, width = 100L)
        ))
    }
    TRUE
}



#' @rdname check-scalar-sets
#' @export
areIntersectingSets <- function(
    x,
    y,
    .xname = getNameInParent(x),
    .yname = getNameInParent(y)
) {
    intersect <- intersect(x, y)
    if (identical(length(intersect), 0L)) {
        return(false(
            gettext("'%s' and '%s' have 0 common elements."),
            .xname, .yname
        ))
    }
    TRUE
}



#' @rdname check-scalar-sets
#' @export
areSetEqual <- function(
    x,
    y,
    .xname = getNameInParent(x),
    .yname = getNameInParent(y)
) {
    x <- unique(x)
    y <- unique(y)
    if (length(x) != length(y)) {
        return(false(
            gettext(paste0(
                "'%s' and '%s' have different numbers of elements ",
                "(%d versus %d)."
            )),
            .xname, .yname, length(x), length(y)
        ))
    }
    if (!isTRUE(ok <- isSubset(x, y))) return(ok)
    if (!isTRUE(ok <- isSubset(y, x))) return(ok)  # nocov
    TRUE
}
