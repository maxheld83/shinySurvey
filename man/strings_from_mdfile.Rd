% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/strings.R
\name{strings_from_mdfile}
\alias{strings_from_mdfile}
\title{Retrieve paths to longer strings
Returns paths to (markdown) files containing longer string parameters.}
\usage{
strings_from_mdfile(filenames = NULL, path)
}
\arguments{
\item{filenames}{\verb{[character()]} giving the filenames of longer strings expected at \code{path}, \emph{without extension}.
Defaults to \code{NULL}, in which case all \verb{*.md}s at \code{path} are returned.}

\item{path}{\verb{[character(1)]} giving the path to a directory including \verb{*.md}s with longer strings.}
}
\value{
\verb{[character()]} giving absolute paths to files, named by \code{filenames} without extension.
}
\description{
Retrieve paths to longer strings
Returns paths to (markdown) files containing longer string parameters.
}
\section{Storing longer strings}{

Longer strings, such as for survey questions or user interface are often best edited in separate files with proper markup (markdown) support.
In the context of a package, they are best saved in\verb{inst/}, which can be conveniently accessed with \code{\link[=system.file]{system.file()}}.
}

