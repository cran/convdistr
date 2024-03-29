% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/distributions.R
\name{new_MULTINORMAL}
\alias{new_MULTINORMAL}
\title{Multivariate Normal Distribution}
\usage{
new_MULTINORMAL(p_mu, p_sigma, p_dimnames, tol = 1e-06, empirical = FALSE)
}
\arguments{
\item{p_mu}{a vector of means}

\item{p_sigma}{a positive-definite symmetric matrix for the covariance matrix}

\item{p_dimnames}{A character that represents the name of the dimension}

\item{tol}{tolerance (relative to largest variance) for numerical lack of positive-definiteness in p_sigma.}

\item{empirical}{logical. If true, mu and Sigma specify the empirical not population mean and covariance matrix.}
}
\value{
An object of class \code{\link{DISTRIBUTION}}, \code{MULTINORMAL}
}
\description{
Return a \code{\link{DISTRIBUTION}} object that draw random numbers from a 
multivariate normal distribution using the \code{\link[MASS]{mvrnorm}} function.
}
\examples{
msigma <- matrix(c(1,0,0,1), ncol=2)
d1 <- new_MULTINORMAL(c(0,1), msigma)
rfunc(d1, 10)
}
\seealso{
\code{\link[MASS]{mvrnorm}}
}
\author{
John J. Aponte
}
