\name{regr}
\Rdversion{1.1}
\alias{regr}
\title{Regression effect reporting for lm class objects}
\description{
  The \code{regr} reports beta weights, standardized beta weights, 
  structure coefficients, adjusted effect sizes, and commonality 
  coefficients for \code{lm} class objects.
}
\usage{
regr(lm.out)
}
\arguments{
  \item{lm.out}{lm class object}
}
\details{
 The function \code{regr} takes the lm class object and reports
 beta weights, standardized beta weights, structure coefficients, 
 adjusted effect sizes, and commonality 
 coefficients for \code{lm} class objects.
}
\value{


return(list(LM_Output=summary(lm.out), Beta_Weights=beta.out, Structure_Coefficients=structure.coef, Commonality_Data=CCdata[1], Effect_Size=es, 
Comment="The Effect Size recommendations are based on Yin and Fan (2001). Your dataset may take on a different covariance structure, thus making another effect size estimate more appropriate."))

\item{LM_Output}{The summary of the output from the \code{lm} class object}
\item{Beta_Weights}{Beta weights for the regression effects}
\item{Structure_Coefficients}{Structure coefficients for the regression effects}
\item{Commonality_Data}{Commonality coefficients for the regression effects. The output only
  produces a parsed version of CCdata}
\item{Effect_Size}{Adjusted effect size computations based on R^2 adjustments}
}
\references{
  Nimon, K., Lewis, M., Kane, R. & Haynes, R. M. (2008) An R package
  to compute commonality coefficients in the multiple regression
  case: An introduction to the package and a practical example. 
  \emph{Behavior Research Methods}, \bold{40}(2), 457-466.
  
  Yin, P., & Fan. X. (2001) Estimated R^2 shrinkage in multiple
  regression: A comparison of different analytical methods. 
  \emph{The Journal of Experimental Education}, \bold{69}(2), 
  203-224. \cr
}
\author{
J. Kyle Roberts <kyler@smu.edu>, Kim Nimon <kim.nimon@gmail.com>
}

\seealso{
Functions in the yhat library \code{\link{commonalityCoefficients}}, 
 \code{\link{effect.size}}
}
\examples{
     data(HS.data)
     attach(HS.data)
     lm.out<-lm(deduct~addition*arithmet)
     regr(lm.out)
}
