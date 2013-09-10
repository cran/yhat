\name{odd}
\alias{odd}
\title{isOdd Function}
\description{
  Function receives value and returns true if value is odd.
}
\usage{
odd(val)
}
\arguments{
  \item{val }{ Value to check}
}
\details{
  Determines value of parameter in argument.
}
\value{
  Returns \code{true} when value checked is odd. Otherwise, function 
  returns a value \code{false}.
}
\author{Kim Nimon <kim.nimon@gmail.com>}

\note{
  This function is internal to \code{\link{commonalityCoefficients}}, 
  called during runtime and passed the appropriate parameters. This 
  is not an end-user function.
}
