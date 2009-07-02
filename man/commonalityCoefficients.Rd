\name{commonalityCoefficients}
\alias{commonalityCoefficients}
\title{Commonality Coefficents}
\description{
  Commonality Coefficients returns a list of two tables. The first 
  table \code{CC} contains the list of commonality coefficients and 
  the percent variance for each effect. The second \code{CCTotByVar} 
  totals the unique and common effects for each independent variable.
}
\usage{
  commonalityCoefficients(dataMatrix, dv, ivlist, imat=FALSE)
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
  \item{imat}{
    Echo flag, default to FALSE
    }
} % end arguments

\details{
  When echo flag is true, transitional matrices during commonality 
  coefficient calculation are sent to output window. Default for 
  this option is false. When set to true, the intermediate matrices 
  for each commonality coefficient and regression combinations are 
  printed in the output window.
}
\value{
  \item{CC}{ 
     Matrix containing commonality coefficients and percentage of 
     variance for each effect.
     }
  \item{CCTotalByVar}{ 
    Table of unique and common effects for each independent 
    variable.
    }
}
\author{ Kim Nimon <kim.nimon@gmail.com>}

\seealso{
  \code{\link{canonCommonality}}
  \code{\link{genList}}
  \code{\link{odd}}
  \code{\link{setBits}}
}
\examples{
  ## Predict miles per gallon based on vehicle weight, type of 
  ## carborator, & number of engine cylinders
     CCdata=commonalityCoefficients(mtcars,"mpg",list("wt","carb","cyl"))
     print(CCdata)

  ## Predict paragraph comprehension based on four verbal
  ## tests: general info, sentence comprehension, word
  ## classification, & word type 
  ## Uses HS dataset in MBESS 
     library(MBESS)
     data(HS.data)
     attach(HS.data)
  ## Commonality Coefficient Analysis
     CCdata=commonalityCoefficients(HS.data,"paragrap",list("general",
       "sentence","wordc","wordm"))
     print(CCdata)
}
\keyword{models}
\keyword{regression} % end keywords
