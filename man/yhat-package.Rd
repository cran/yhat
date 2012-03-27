\name{yhat-package}
\alias{yhat-package}
\alias{yhat}
\docType{package}
\title{Interpreting Regression Effects}
\description{
  The purpose of this package is to provide methods for variance
  partitioning for linear models and canonical correlation and methods
  for interpreting regression effects using beta weights, standardized beta 
  weights, structure coefficients, and adjusted effect sizes.
}
\details{
\tabular{ll}{
Package: \tab yhat\cr
Type: \tab Package\cr
Version: \tab 1.4\cr
Date: \tab 2012-03-27\cr
License: \tab GPL (>= 2)\cr
LazyLoad: \tab yes\cr
}
  The \code{regr} reports beta weights, standardized beta weights, 
  structure coefficients, adjusted effect
  sizes, and commonality coefficients.

  The \code{commonalityCoeffcients} function is based on Mood's 
  (1969) procedure for computing commonality analysis formulas 
  for any number of \emph{k} predictor variables. The function 
  outputs a list of two tables. The first table lists the 
  commonality coefficients and the percentage of variance 
  associated with each effect. The second table provides a total 
  of the unique and common effects for each independent variable. \cr
   
  The \code{canonCommonality} function produces commonality data 
  for both canonical variables sets. Variables in a given 
  canonical set are used to partition the variance of the 
  canonical variates produced from the \emph{other} canonical 
  set and vica versa. Commonality data is supplied for the number 
  of canonical functions requested. \cr
  
  Canonical commonality analysis is not substantively different 
  from regression commonality analysis developed by Mood (1969). 
  In fact, Beaton (1973) recognized multivariate commonality as 
  a simple generalization of univariate commonality, indicating 
  that the two techniques provide identical results when one 
  canonical set contains only a single variable.
}
\author{Kim Nimon <kim.nimon@gmail.com>, J. Kyle Roberts <kyler@smu.edu>}

\references{
  Beaton, A. E. (1973) \emph{Commonality}. (ERIC Document Reproduction
  Service No. ED111829)
  
  Butts, C. T. (2009). \emph{yacca: Yet Another Canonical Correlation
  Analysis Package}. R package version 1.1.
  
  Mood, A. M. (1969) Macro-analysis of the American educational 
  system. \emph{Operations Research}, \bold{17}, 770-784.
  
  Nimon, K., Lewis, M., Kane, R. & Haynes, R. M. (2008) An R package
  to compute commonality coefficients in the multiple regression
  case: An introduction to the package and a practical example. 
  \emph{Behavior Research Methods}, \bold{40}(2), 457-466.
}
\keyword{package}
\seealso{
    \code{\link{regr}}
    \code{\link{commonalityCoefficients}}
    \code{\link{canonCommonality}}
}
