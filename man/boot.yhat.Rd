\name{boot.yhat}
\alias{boot.yhat}
\title{Bootstrap metrics produced from /code{calc.yhat}}
\description{
  This function is input to \code{boot} to bootstrap metrics
  computed from \code{calc.yhat}. 
}
\usage{
  boot.yhat(data, indices, lmOut,regrout0)
}
\arguments{
  \item{data}{
    Original dataset
    }
  \item{indices}{
    Vector of indices which define the bootstrap sample
    }
  \item{lmOut}{
    Ouput of /code{lm}
    }
  \item{regrout0}{
    Output of /code{calc.yhat}
    }
} % end arguments

\details{
  This function is input to \code{boot} to bootstrap metrics
  computed from \code{calc.yhat}.  
}
\value{
  The output of \code{boot.yhat} when used in conjunction with    \code{boot} is of class \code{boot} and is not further described
here. The output is designed to be useful as input for \code{booteval.yhat} 
}
\references{
Nimon, K., & Oswald, F. L. (2013). Understanding the results of multiple linear regression: Beyond standardized regression coefficients. \emph{Organizational Research Methods}, \emph{16}, 
650-674.
}
\author{ Kim Nimon <kim.nimon@gmail.com>}
\seealso{
  \code{\link{lm}}
  \code{\link{calc.yhat}}
  \code{\link{boot}}
  \code{\link{booteval.yhat}}

}
\examples{
  ## Bootstrap regression results predicting paragraph     
  ## comprehension based on three verbal tests: general info, 
  ## sentence comprehension, & word classification
 
  ## Use HS dataset in MBESS 
     require ("MBESS")
     data(HS.data)

  ## Regression
     lm.out<-lm(paragrap~general+sentence+wordc,data=HS.data)

  ## Calculate regression metrics
     regrOut<-calc.yhat(lm.out)

  ## Bootstrap results
     require ("boot")
     boot.out<-boot(HS.data,boot.yhat,100,lmOut=lm.out,regrout0=regrOut)
}
\keyword{models}
\keyword{regression} % end keywords
