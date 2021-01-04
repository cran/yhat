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

Thomas, D. R., Zumbo, B. D., Kwan, E., & Schweitzer, L. (2014). On Johnson's (2000) relative weights method for assessing variable importance: A reanalysis. \emph{Multivariate Behavioral Research}, \emph{16},
49(4), 329-338.
}
\author{
Kim Nimon <kim.nimon@gmail.com>
}
\examples{
  ## Predict paragraph comprehension based on three verbal
  ## tests: general info, sentence comprehension, & word
  ## classification
  
  ## Use HS dataset in MBESS 
     if (require("MBESS")){
     data(HS)
  
  ## Regression
     lm.out<-lm(t6_paragraph_comprehension~
                t5_general_information+t7_sentence+t8_word_classification,data=HS)
  
  ## Regression Indices
     regr.out<-calc.yhat(lm.out)
     }
}
