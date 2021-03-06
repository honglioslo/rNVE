% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/random_pst.R
\name{random_pst}
\alias{random_pst}
\title{generate several pst files with format and sepecific distribution}
\usage{
random_pst(infile = "data/dew.pst", outfile = "data/dew.pst_r", nout = 3,
  dist = "uniform")
}
\arguments{
\item{infile}{file to read.}

\item{outfile}{file to write.}

\item{nout}{number of out file to write.}

\item{dist}{distribution of values to follow, at prsent at only use uniform.}
}
\description{
generate several pst files with format and sepecific distribution
}
\examples{
random_pst()
}
\keyword{data}
