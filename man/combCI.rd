\name{combCI}
\alias{combCI}
\title{Combine upper and lower confidence intervals}
\description{
  This function combines upper and lower confidence intervals along with sample statistics and optionally stars intervals that do not contain 0.
}
\usage{
  combCI(lowerCI, upperCI, est, star=FALSE )
}
\arguments{
  \item{lowerCI}{
    Lower CI
    }
  \item{upperCI}{
    Upper CI
    }
  \item{est}{
    Estimate
    }
  \item{star}{
    Boolean to indicate whether CIs that do not contain zero should be starred.
    }
} % end arguments

\details{
  This function evaluates the bootstrap metrics produced from /code{boot.yhat}.   
}
\value{
Returns estimate with confidence interval in ( ). Optionally, confidence interval not containing 0 is starred.
}
\references{
Nimon, K., & Oswald, F. L. (2013). Understanding the results of multiple linear regression: Beyond standardized regression coefficients. \emph{Organizational Research Methods}, \emph{16}, 
650-674.
}
\author{ Kim Nimon <kim.nimon@gmail.com>}
\note{This function is internal to the yhat package and not intended to be an end-user function.}

