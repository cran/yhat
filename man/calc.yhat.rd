\name{calc.yhat}
\alias{calc.yhat}
\title{More regression indices for lm class objects}
\description{
  Reports beta weights, validity coefficients, structure coefficients, product measures, commonality analysis coefficients, and dominance analysis weights for \code{lm} class objects.
}
\usage{
calc.yhat(lm.out,prec=3)
}
\arguments{
  \item{lm.out}{lm class object}
  \item{prec}{level of precision for rounding, defaults to 3}
}
\details{
Takes the lm class object and reports beta weights, validity coefficients, 
structure coefficients, product measures, commonality analysis coefficients, 
and dominance analysis weights.
}
\value{
\item{PredictorMetrics}{Predictor metrics associated with lm class object}
\item{OrderedPredictorMetrics}{Rank order of predictor metrics}
\item{PairedDominanceMetrics}{Dominance analysis for predictor pairs}
\item{APSRelatedMetrics}{APS metrics associated with lm class object}
}
\references{
Nimon, K., & Oswald, F. L. (2013). Understanding the results of multiple linear regression: Beyond standardized regression coefficients. \emph{Organizational Research Methods}, \emph{16}, 
650-674.
}
\author{
Kim Nimon <kim.nimon@gmail.com>
}
\examples{
  ## Predict paragraph comprehension based on three verbal
  ## tests: general info, sentence comprehension, & word
  ## classification
  
  ## Use HS dataset in MBESS 
     require ("MBESS")
     data(HS.data)
  
  ## Regression
     lm.out<-lm(paragrap~general+sentence+wordc,data=HS.data)
  
  ## Regression Indices
     regr.out<-calc.yhat(lm.out)
}
