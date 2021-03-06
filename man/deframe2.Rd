% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/params.R
\name{deframe2}
\alias{deframe2}
\title{Convert data frame to named vector}
\usage{
deframe2(x)
}
\arguments{
\item{x}{An atomic vector (for \code{enframe()}) or a data frame with one or two columns
(for \code{deframe()}).}
}
\description{
\code{deframe2} converts two-column data frames to a named vector, using the first column as the value and the second column as the name.
\emph{This is the opposite behavior of \code{\link[tibble:deframe]{tibble::deframe()}}}.
Such named vectors are often useful for \code{\link[shiny:selectInput]{shiny::selectInput()}} and others.
}
