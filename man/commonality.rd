\name{commonality}
\alias{commonality}
\title{Commonality Analysis}
\description{
  This function conducts commonality analyses based on an all-possible-subsets regression.
}
\usage{
  commonality(apsOut)
}
\arguments{
  \item{apsOut}{
    Output from /code{aps}
    }
} % end arguments

\details{
  This function conducts commonality analyses based on an all-possible-subsets regression. 
}
\value{
     The function returns a matrix containing commonality coefficients and percentage of regression effect for each each possible set of predictors.
}
\references{
Nimon, K., Lewis, M., Kane, R. & Haynes, R. M. (2008) An R  package to compute commonality coefficients in the multiple regression case: An introduction to the package and a practical example.\emph{Behavior Research Methods}, \emph{40}, 457-466.
  
Nimon, K., & Oswald, F. L. (2013). Understanding the results of multiple linear regression: Beyond standardized regression coefficients. \emph{Organizational Research Methods}, \emph{16}, 
650-674.
}
\author{ Kim Nimon <kim.nimon@gmail.com>}
\seealso{
  \code{\link{aps}}
  \code{\link{calc.yhat}}
  \code{\link{dominance}}
  \code{\link{rlw}}  
}
\examples{
  ## Predict paragraph comprehension based on three verbal
  ## tests: general info, sentence comprehension, & word
  ## classification

  ## Use HS dataset in MBESS 
     if (require ("MBESS")){
     data(HS)

  ## All-possible-subsets regression
     apsOut=aps(HS,"t6_paragraph_comprehension",
                    list("t5_general_information", "t7_sentence","t8_word_classification"))

  ## Commonality analysis
     commonality(apsOut)
     }
}
\keyword{models}
\keyword{regression} % end keywords
