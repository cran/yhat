\name{aps}
\alias{aps}
\title{All Possible Subsets Regression}
\description{
  The function runs all possible subsets regression and 
  returns data needed to run commonality and dominance analysis.  
}
\usage{
  aps(dataMatrix, dv, ivlist)
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
Function returns all possible subset information that is used by \code{\link{commonality}} 
and \code{\link{dominance}}.
If data are missing, non-missing data are eliminated based on listwise deletion for full model. 
}
\value{
  \item{ivID}{ 
     Matrix containing independent variable IDS.
     }
  \item{PredBitMap}{ 
     All possible subsets predictor bit map.
    }
  \item{apsBitMap}{ 
     Index into all possible subsets predictor bit map.
    }
  \item{APSMatrix}{ 
     Table containing the number of predictors and Multiple R^2  for each possible set of predictors. 
    }
}
\references{
Nimon, K., & Oswald, F. L. (2013). Understanding the results of multiple linear regression: Beyond standardized regression coefficients. \emph{Organizational Research Methods}, \emph{16}, 
650-674.
}
\author{ Kim Nimon <kim.nimon@gmail.com>}
\seealso{
  \code{\link{calc.yhat}}
  \code{\link{commonality}}
  \code{\link{dominance}}
  \code{\link{rlw}}}
\examples{
  ## APS regression predicting miles per gallon based 
  ## on vehicle weight, type of 
  ## carborator, & number of engine cylinders
     apsOut<-aps(mtcars,"mpg",list("wt","carb","cyl"))

  ## APS regression predicting paragraph comprehension based 
  ## on thre verbal tests: general info, sentence comprehension,
  ## & word classification
 
  ## Use HS dataset in MBESS 
     if (require ("MBESS")){
     data(HS)
  ## APS
     apsOut<-aps(HS,"t6_paragraph_comprehension",list("t5_general_information","t7_sentence",
                                         "t8_word_classification"))
     }
}
\keyword{models}
\keyword{regression} % end keywords
