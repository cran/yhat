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
     require("MBESS")
     data(HS.data)

  ## Relative Weights
     rwlOut<-rlw(HS.data,"paragrap",c("general","sentence","wordc"))

}
\keyword{models}
\keyword{regression} % end keywords
