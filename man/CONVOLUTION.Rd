% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/convolution.R
\name{CONVOLUTION}
\alias{CONVOLUTION}
\alias{new_CONVOLUTION}
\alias{new_SUM}
\alias{+.DISTRIBUTION}
\alias{new_SUBTRACTION}
\alias{-.DISTRIBUTION}
\alias{new_MULTIPLICATION}
\alias{*.DISTRIBUTION}
\alias{new_DIVISION}
\alias{/.DISTRIBUTION}
\title{Make the convolution of two or more \code{\link{DISTRIBUTION}} objects}
\usage{
new_CONVOLUTION(listdistr, op, omit_NA = FALSE)

new_SUM(..., omit_NA = FALSE)

\method{+}{DISTRIBUTION}(e1, e2)

new_SUBTRACTION(..., omit_NA = FALSE)

\method{-}{DISTRIBUTION}(e1, e2)

new_MULTIPLICATION(..., omit_NA = FALSE)

\method{*}{DISTRIBUTION}(e1, e2)

new_DIVISION(..., omit_NA = FALSE)

\method{/}{DISTRIBUTION}(e1, e2)
}
\arguments{
\item{listdistr}{a list of \code{\link{DISTRIBUTION}} objects}

\item{op}{a function to convolute `+`, `-`, `*`, `\`}

\item{omit_NA}{if TRUE, \code{NA} distributions will be omitted}

\item{...}{\code{\link{DISTRIBUTION}} objects or a list of distribution objects}

\item{e1}{object of class \code{\link{DISTRIBUTION}}}

\item{e2}{object of class \code{\link{DISTRIBUTION}}}
}
\value{
and object of class \code{CONVOLUTION}, \code{\link{DISTRIBUTION}}
}
\description{
The convolution of the simple algebraic operations is made by the operation of individual drawns of
the distributions. The \code{\link{DISTRIBUTION}} objects must have the
same dimensions.
}
\details{
If any of the distributions is of class \code{NA} (\code{\link{NA_DISTRIBUTION}})
the result will be a new distribution of class \code{NA} unless the
 \code{omit_NA} option is set to \code{TRUE}
}
\section{Functions}{
\itemize{
\item \code{new_SUM()}: Sum of distributions

\item \code{new_SUBTRACTION()}: Subtraction for distributions

\item \code{new_MULTIPLICATION()}: Multiplication for distributions

\item \code{new_DIVISION()}: DIVISION for distributions

}}
\examples{
x1 <- new_NORMAL(0,1)
x2 <- new_UNIFORM(1,2)
new_CONVOLUTION(list(x1,x2), `+`)
new_SUM(x1,x2)
x1 + x2
new_SUBTRACTION(x1,x2)
x1 - x2
new_MULTIPLICATION(list(x1,x2))
x1 * x2
new_DIVISION(list(x1,x2))
x1 / x2
}
\author{
John J. Aponte
}
