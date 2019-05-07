## goalie 0.2.14 (2019-04-02)

### Minor changes

- `standardizeCall`: Improved `isNonNegative` assert check by wrapping in
  `unname` call, to keep backward compatibility with R 3.4.
- Improved code coverage, getting closer to 100%.



## goalie 0.2.13 (2019-03-31)

### Minor changes

- Overhauled and improved assert checks.
- Miscellaneous bug fixes for assert checks.



## goalie 0.2.12 (2019-03-22)

### Minor changes

- Migrated domain to [Acid Genomics][].



## goalie 0.2.11 (2019-03-17)

### Minor changes

- `isDirectory`, `isFile`: Now return with `cause` attribute set on failure.
- Updated assert checks and reworked comments to pass lintr checks.



## goalie 0.2.10 (2019-03-10)

### Minor changes

- `isSubset`: Improved cause message, which would error using internal `deparse`
  call on long vectors.



## goalie 0.2.9 (2019-02-25)

### Minor changes

- Needed to tweak internal code in `assignToBody` to fix backports handling of
  `...elt` for R 3.4.
- `hasAccess`: Needed to add `uname` call internally for R 3.4 backward
  compatibility, for checks that rely upon `isTRUE` to return `TRUE`, as
  expected. The handling of this situation has changed in R 3.5.



## goalie 0.2.8 (2019-02-11)

### Minor changes

- Bioconda unit tests revealed that `...elt` approach used in `assert` isn't
  backward compatible with R 3.4. The backports package was added as a
  dependency, which provides legacy support for `...elt` in R 3.4. This is
  called internally inside `.onLoad` specifically for R releases prior to 3.5.



## goalie 0.2.7 (2019-02-11)

### Minor changes

- `assert`: `traceback` argument is disabled by default. Note that this can be
  enabled globally using `options(goalie.traceback = TRUE)`, which can be useful
  for code debugging in some situations.
- `isSubset`: Improved cause message if user attempts to pass in `NULL` for
  either `x` or `y` arguments.
- `hasNonZeroRowsAndCols`: Fixed typo in internal code that didn't check using
  `hasCols` properly.
- `isFlag`: Improved cause message if user passes in `NA`.



## goalie 0.2.6 (2019-01-22)

### New functions

- Migrated `printString` from [basejump][] package.



## goalie 0.2.5 (2019-01-15)

### Minor changes

- `isADirectory`, `isAFile`: Added `nullOK` argument support.



## goalie 0.2.4 (2019-01-06)

### New functions

- New exports: `allAreDirectories`, `allAreFiles`, which return scalar.

### Minor changes

- Documentation improvements.



## goalie 0.2.3 (2019-01-04)

### New functions

- Migrated some low-level functions from [basejump][] that are useful for
  assertive checks: `matchArgsToDoCall`, `standardizeCall`, and the
  `MethodDefinition` family, which includes `methodFunction`,
  `methodFormals`, `hasLocal`, `extractLocal`. These will get re-exported
  in [basejump][].

### Minor changes

- Reorganized base engine function files, getting rid of the `base-` prefix.
- Added conditional `NULL` support where applicable, with `nullOK` formal.
  Applies to `isInt`, `isNumber`, `isString`, for example.
- General documentation improvements.



## goalie 0.2.2 (2018-12-22)

### Major changes

- `assert`: Added `msg` formal. Improved error message when a user inputs
  check functions that don't return boolean.
- `capitalize`: Simplified documentation, referring the user to the
  documentation provided in [syntactic][] package.
- `falseFromVector`: Newly exported function.
- `isInRange` family: Added scalar variants for all vectorized functions.
- Improved scalar return consistency in functions where applicable, using
  `falseFromVector` internally.



## goalie 0.2.1 (2018-12-20)

### Major changes

- The approach to the package update is heavily influenced by the conventions
  defined in the assertive package. In goalie, I'm attempting to create a
  minimal assert check engine that behaves similar to `stopifnot`, but with
  more informative error messages. This approach is inspired by the assertthat
  package, but neither assertive or assertthat are working quite right for my
  needs.
- Overhauled the `assert` and `validate` engines, re-writing the code from
  scratch based on the internal code of `stopifnot`.
- Reworked all assertive check functions to reduce the number of dependencies.
  Now the package is lean and mean, only importing methods and utils into the
  NAMESPACE.
- Assertive checks now return as `goalie` class in addition to `logical`.



## goalie 0.2.0 (2018-12-12)

### Major changes

- Removed all `assert*` functions in favor of a simpler, assertthat style
  approach using `assert` for all checks. The package will export check
  functions that return `logical`, typically `logical(1)` (boolean flag) for
  most checks. These checks can then be wrapped in `assert` or `validate`
  (for S4 class validity checks) calls.



## goalie 0.1.2 (2018-11-21)

### Minor changes

- `isDir` and `isFile` now import `R.utils::isDirectory` and `R.utils::isFile`.



## goalie 0.1.1 (2018-11-14)

### Minor changes

- `areUniqueGeneNames` now returns `boolean` as expected.
- Improved error message for `assertAreUniqueGeneNames`.



## goalie 0.1.0 (2018-11-11)

- Initial release, migrating assertive check functions from [basejump][]
  package.



[basejump]: https://basejump.acidgenomics.com/
[Acid Genomics]: https://acidgenomics.com/
[syntactic]: https://syntactic.acidgenomics.com/