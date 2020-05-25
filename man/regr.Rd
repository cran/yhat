\name{regr}
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

\item{LM_Output}{The summary of the output from the \code{lm} class object}
\item{Beta_Weights}{Beta weights for the regression effects}
\item{Structure_Coefficients}{Structure coefficients for the regression effects}
\item{Commonality_Data}{Commonality coefficients for the regression effects. The output only
  produces a parsed version of CCdata}
\item{Effect_Size}{Adjusted effect size computations based on R^2 adjustments}
}
\references{
  Kraha, A., Turner, H., Nimon, K., Zientek, L., Henson, R. (2012). Tools to support multiple regression in the face of multicollinearity.\emph{Frontiers in Psychology}, \emph{3}(102), 1-13.
  
}
\author{
J. Kyle Roberts <kyler@smu.edu>, Kim Nimon <kim.nimon@gmail.com>
}

\seealso{
 \code{\link{commonalityCoefficients}}, 
 \code{\link{effect.size}}
}
\examples{
     require("MBESS")
     data(HS)
     attach(HS)
     lm.out<-lm(t20_deduction~t10_addition*t24_woody_mccall)
     regr(lm.out)
     detach(HS)
}
