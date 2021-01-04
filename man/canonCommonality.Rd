\name{canonCommonality}
\alias{canonCommonality}
\title{Commonality Coefficents for Canonical Correlation}
\description{
  The \code{canonCommonality} function produces commonality data 
  for both canonical variables sets. Variables in a given 
  canonical set are used to partition the variance of the 
  canonical variates produced from the \emph{other} canonical 
  set and vica versa. Commonality data is supplied for the 
  number of canonical functions requested.
}
\usage{
  canonCommonality(A, B, nofns = 1)
}
\arguments{
  \item{A}{Matrix containing variable set A}  
  \item{B}{Matrix containing variable set B}
  \item{nofns}{Number of canonical functions to analyze}
}
\details{
  The function \code{canonCommonality} has two required arguments 
  and one optional argument. The first two arguments contain the 
  two variable sets. The third argument is optional and defnes 
  the number of canonical functions to analyze. Unless specifed, 
  the number of canonical functions defaults to 1. \cr
  
  The function \code{canonCommonality} calls a function 
  \code{canonVariate} to decompose canonical varites twice: 
  the first time for the variable set identified in the first 
  argument, the second time for the variable set identified in 
  the second argument.
}
\value{
  The function \code{canonCommonality} returns commonality data 
  for both canonical variable sets. For the number of functions 
  requested, both canonical variates are analyzed. For each 
  canonical variate analyzed, two tables are returned. The first 
  table lists the commonality coefficients and their contribution 
  to the total effect, while the second table lists the unique 
  and common effects for each regressor. The function returns 
  the resulting output ordering the output according to the 
  function's paramaeters.
}
\references{
Nimon, K., Henson, R., & Gates, M. (2010). Revisiting interpretation of canonical correlation analysis: A tutorial and demonstration of canonical commonality analysis.  \emph{Multivariate Behavioral Research}, \emph{45},702-724.
}
\author{ Kim Nimon <kim.nimon@gmail.com>}

\seealso{
  \code{\link{canonVariate}}
}
\examples{
  ## Example parallels the R builtin cancor and the 
  ## yacca cca example
     data(LifeCycleSavings)
     pop <- LifeCycleSavings[, 2:3]
     oec <- LifeCycleSavings[, -(2:3)]
  ## Perform Commonality Coefficient Analysis
     canonCommonData<-canonCommonality(pop,oec,1)

  ## Use HS dataset in MBESS 
     if (require("MBESS")){
     data(HS)
     attach(HS)
  ## Create canonical variable sets
     MATH_REASON<-HS[,c("t20_deduction","t22_problem_reasoning")]
     MATH_FUND<-HS[,c("t21_numerical_puzzles","t24_woody_mccall","t10_addition")] 
  ## Perform Commonality Coefficient Analysis
     canonCommonData<-canonCommonality(MATH_FUND,MATH_REASON,1)
     detach(HS)      
     }
} % end example

\keyword{multivariate} %end keyword
