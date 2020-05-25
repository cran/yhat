\name{plotCI.yhat}
\alias{plotCI.yhat}
\title{Plot CIs from yhat}
\description{
  This function plots CIs that have been produced from /code{booteval.yhat}.
}
\usage{
  plotCI.yhat(sampStat, upperCI, lowerCI, pid=1:ncol(sampStat), nr=2, nc=2)
}
\arguments{
  \item{sampStat}{
    Set of sample statistics
    }
  \item{upperCI}{
    Set of upper CIs
    }
  \item{lowerCI}{
    Set of lower CIs
    }
  \item{pid}{
    Which set of Metrics to plot (default to all)
    }
  \item{nr}{
    Number of rows (default = 2)
    }
  \item{nc}{
    Number of columns(default = 2)
    }
} % end arguments

\details{
  This function plots CIs that have been produced from /code{booteval.yhat}.   
}
\value{
This returns a plot of CIs that have been produced from /code{booteval.yhat}.
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

  ## Plot results
  ## plotCI.yhat(regrOut$PredictorMetrics[-nrow(regrOut$PredictorMetrics),],
  ## result$upperCIpm,result$lowerCIpm, pid=which(colnames(regrOut$PredictorMetrics) 
  ## %in% c("Beta","rs","CD:0","CD:1","CD:2","GenDom","Pratt","RLW") == TRUE),nr=3,nc=3)
}
\keyword{models}
\keyword{regression} % end keywords
