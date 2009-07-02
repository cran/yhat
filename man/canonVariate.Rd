\name{canonVariate}
\Rdversion{1.1}
\alias{canonVariate}
\title{Canonical Commonality Analysis}
\description{
  The \code{canonCommonality} function produces commonality data 
  for a given canonical variable set. Using the variables in a 
  given canonical set to partition the variance of the canonical 
  variates produced from the \emph{other} canonical set, 
  commonality data is supplied for the number of canonical 
  functions requested.
}
\usage{
  canonVariate(A, B, nofns)
}
\arguments{
  \item{A}{ Matrix containing variable set A}  
  \item{B}{ Matrix containing variable set B}
  \item{nofns }{ Number of canonical functions to analyze}
}
\details{
  For each canonical function, \code{canonVariate}: (a) creates 
  a dataset that combines the matrix of variables for a given 
  canonical set and the canonicate variate for the \emph{other} 
  canonical set; (b) calls \code{commonalityCoefficients}, 
  passing the dataset, the name of the canonical variate, and 
  the names of the variates in a given canonical set; (c) saves 
  resultant output.
}
\value{
  The function \code{canonVariate} returns commonality data for 
  the canonical variable set input. For the number of functions 
  requested, two tables are returned. The first table lists the 
  commonality coefficients for each canonical function together 
  with its contribution to the total effect, while the second 
  table lists the unique and common effects for each regressor.
}
\author{ Kim Nimon <kim.nimon@gmail.com>
}
\note{
  This function is internal to \code{\link{canonCommonality}}, 
  called during runtime and passed the appropriate parameters. 
  This is not an end-user function.
} % end note

\seealso{
  \code{\link{canonCommonality}}
}
\keyword{multivariate} % end keyword
