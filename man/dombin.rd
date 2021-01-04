\name{dombin}
\alias{dombin}
\title{Dominance Analysis}
\description{
For each level of dominance and pairs of predictors in the full model, this function indicates whether a predictor "x1" dominates "x2", predictor "x2" dominates "x1", or that dominance cannot be established between predictors.
}
\usage{
  dombin(domOut)
}
\arguments{
  \item{domOut}{
    Output from /code{dominance}
    }
} % end arguments

\details{
For each level of dominance and pairs of predictors in the full model, this function indicates whether a predictor "x1" dominates "x2", predictor "x2" dominates "x1", or that dominance cannot be established between predictors.
}
\value{
The function return a matrix that contains dominance level decisions (complete, conditional, and general) for each pair of predictors in the full model.
}
\references{
Nimon, K., & Oswald, F. L. (2013). Understanding the results of multiple linear regression: Beyond standardized regression coefficients. \emph{Organizational Research Methods}, \emph{16}, 
650-674.
}
\author{ Kim Nimon <kim.nimon@gmail.com>}

\seealso{
  \code{\link{aps}}
  \code{\link{calc.yhat}}
  \code{\link{commonality}}
  \code{\link{dominance}}
  \code{\link{rlw}}
}
\examples{
  ## Predict paragraph comprehension based on three verbal
  ## tests: general info, sentence comprehension, & word
  ## classification

  ## Use HS dataset in MBESS 
     if (require("MBESS")){
     data(HS)

  ## All-possible-subsets regression
     apsOut=aps(HS,"t6_paragraph_comprehension",
                list("t5_general_information", "t7_sentence","t8_word_classification"))

  ## Dominance analysis
     domOut=dominance(apsOut)

  ## Dominance analysis
     dombin(domOut)
     }
}
\keyword{models}
\keyword{regression} % end keywords
