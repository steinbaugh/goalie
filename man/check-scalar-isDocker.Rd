% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/check-scalar-isDocker.R
\name{check-scalar-isDocker}
\alias{check-scalar-isDocker}
\alias{isDocker}
\alias{skip_on_docker}
\title{Is the R session running inside Docker?}
\usage{
isDocker()

skip_on_docker()
}
\value{
\code{TRUE} on success;
\code{FALSE} on failure, with cause set.
}
\description{
Is the R session running inside Docker?
}
\section{Functions}{
\itemize{
\item \code{skip_on_docker}: Utility function for testthat.
}}

\note{
Updated 2021-01-04.
}
\examples{
isDocker()
}
