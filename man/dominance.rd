\name{dominance}
\alias{dominance}
\title{Dominance Weights}
\description{
Computes dominance weights including conditional and general.
}
\usage{
  dominance(apsOut)
}
\arguments{
  \item{apsOut}{
    Output from /code{aps}
    }
} % end arguments

\details{
Provides full dominance weights table that are used to compute conditional and general dominance weights as well as reports conditional and general dominance weights.
}
\value{
\item{DA}{Dominance analysis table}
\item{CD}{Conditional dominance weights}
\item{GD}{General dominance weights}

}
\references{
Nimon, K., & Oswald, F. L. (2013). Understanding the results of multiple linear regression: Beyond standardized regression coefficients. \emph{Organizational Research Methods}, \emph{16}, 
650-674.
}
\author{ Kim Nimon <kim.nimon@gmail.com>}

\seealso{
  \code{\link{aps}}
  \code{\link{calc.yhat}}
  \code{\link{dombin}}
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

  ## Dominance weights
     dominance(apsOut)
     }

}
\keyword{models}
\keyword{regression} % end keywords
