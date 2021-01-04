\name{effect.size}
\alias{effect.size}
\title{Effect Size Computation for lm}
\description{
  Creates adjusted effect sizes for linear regression.
}
\usage{
  effect.size(lm.out)
}
 
\arguments{
  \item{lm.out}{Output from lm class object}
}
\details{
  The function \code{effect.size} produces a family of effect
  size corrections for the R-squared metric produced from an
  \code{lm} class object. Suggestions for recommended correction
  are supplied, based on Yin and Fan (2001).
}
\value{
  Returns adjusted R-squared metric.
}
\references{
 
  Yin, P., & Fan. X. (2001) Estimated R^2 shrinkage in multiple
  regression: A comparison of different analytical methods. 
  \emph{The Journal of Experimental Education}, \emph{69}, 
  203-224.
}
\author{ J. Kyle Roberts <kyler@smu.edu>}
\seealso{
  \code{\link{regr}},\code{\link{yhat}}
}
\examples{
     if (require("MBESS")){
     data(HS)
     attach(HS)
     lm.out<-lm(t20_deduction~t10_addition*t24_woody_mccall)
     effect.size(lm.out)
     detach(HS)
     }
}

