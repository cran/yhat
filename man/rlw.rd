\name{rlw}
\alias{rlw}
\title{Relative Weights}
\description{
  The function computes relative weights.  
}
\usage{
  rlw(dataMatrix, dv, ivlist)
}
\arguments{
  \item{dataMatrix}{
    Dataset containing the dependent and independent variables
    }
  \item{dv}{
    The dependent variable named in the dataset
    }
  \item{ivlist}{
    List of independent variables named in the dataset
    }
} % end arguments

\details{
The function computes relative weights. 
}
\value{
The function returns relative weights for each predictor.
}
\references{
Nimon, K., & Oswald, F. L. (2013). Understanding the results of multiple linear regression: Beyond standardized regression coefficients. \emph{Organizational Research Methods}, \emph{16}, 
650-674.

Thomas, D. R., Zumbo, B. D., Kwan, E., & Schweitzer, L. (2014). On Johnson's (2000) relative weights method for assessing variable importance: A reanalysis. \emph{Multivariate Behavioral Research}, \emph{16},
49(4), 329-338. 
}
\author{ Kim Nimon <kim.nimon@gmail.com>}
\seealso{
  \code{\link{aps}}
  \code{\link{calc.yhat}}
  \code{\link{commonality}}
  \code{\link{dominance}}
}
\examples{
  ## Relative weights from regression model predicting paragraph 
  ## comprehension based on three verbal tests: general info, 
  ## sentence comprehension, & word classification
 
  ## Use HS dataset in MBESS 
     if (require ("MBESS")){
     data(HS)

  ## Relative Weights
     rwlOut<-rlw(HS,"t6_paragraph_comprehension",
                     c("t5_general_information","t7_sentence","t8_word_classification"))
     }

}
\keyword{models}
\keyword{regression} % end keywords
