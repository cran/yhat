\name{booteval.yhat}
\alias{booteval.yhat}
\title{Evaluate bootstrap metrics produced from /code{calc.yhat}}
\description{
  This function evaluates the bootstrap metrics produced from /code{boot.yhat}.   
}
\usage{
  booteval.yhat(regrOut, boot.out, bty, level, prec)
}
\arguments{
  \item{regrOut}{
    Output from \code{calc.yhat}
    }
  \item{boot.out}{
    Output from \code{boot} in conjunction with \code{boot.yhat}
    }
  \item{bty}{
    Type of confidence interval. Only types "perc", "norm", "basic", and "bca" supported.
    }
  \item{level}{
    Confidence level (e.g., .95)
    }
  \item{prec}{
    Integer indicating number of decimal places to be used.
    }
} % end arguments

\details{
  This function evaluates the bootstrap metrics produced from \code{boot.yhat}.   
}
\value{
Confidence intervals are reported for predictor and all possible subset metrics as 
well as differences between appropriate predictors and all possible subset metrics. 
The function also output the means, standard errors, probabiltites, and 
reproducibility metrics for the dominance comparisons. Means and standard deviations 
are reported for Kendall's tau correlation between sample predictor metrics and the
bootstrap statistics of like metrics.
\item{combCIpm}{Upper and lower CIs for predictor metrics}
\item{lowerCIpm}{Lower CIs for predictor metrics}
\item{upperCIpm}{Upper CIs for predictor metrics}
\item{combCIaps}{Upper and lower CIs for APS metrics}
\item{lowerCIaps}{Lower CIs for APS metrics}
\item{upperCIaps}{Upper CIs for APS metrics}
\item{domBoot}{Dominance analysis bootstrap results}
\item{tauDS}{Descriptive statistics for Kendall's tau}
\item{combCIpmDiff}{Upper and lower CIs for differences between predictor metrics}
\item{lowerCIpmDiff}{Lower CIs for differences between predictor metrics}
\item{upperCIpmDiff}{Upper  CIs for differences between predictor metrics}
\item{combCIapsDiff}{Upper and lower CIs for differences between APS metrics}
\item{lowerCIapsDiff}{Lower CIs for differences between APS metrics}
\item{upperCIapsDiff}{Upper  CIs for differences between APS metrics}
\item{combCIincDiff}{Upper and lower CIs for differences between incremental validity metrics}
\item{lowerCIincDiff}{Lower CIs for differences between incremental validity metrics}
\item{upperCIincDiff}{Upper  CIs for differences between incremental validity metrics}
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
  \code{\link{plotCI.yhat}}
}
\examples{
  ## Bootstrap regression results predicting paragraph     
  ## comprehension based on four verbal tests: general info, 
  ## sentence comprehension, & word classification
 
  ## Use HS dataset in MBESS 
     if (require ("MBESS")){
     data(HS)

  ## Regression
     lm.out<-lm(t6_paragraph_comprehension~
                t5_general_information+t7_sentence+t8_word_classification,data=HS)

  ## Calculate regression metrics
     regrOut<-calc.yhat(lm.out)

  ## Bootstrap results
     require ("boot")
     boot.out<-boot(HS,boot.yhat,100,lmOut=lm.out,regrout0=regrOut)

  ## Evaluate bootstrap results
     result<-booteval.yhat(regrOut,boot.out,bty="perc")
     }
}
\keyword{models}
\keyword{regression} % end keywords
