\name{setBits}
\alias{setBits}
\title{Decimal to Binary}
\description{
  Creates the binary representation of n and stores it in the nth 
  column of the matrix.
}
\usage{
  setBits(col, effectBitMap)
}
\arguments{
  \item{col }{ Column of matrix to represent in binary image}
  \item{effectBitMap }{ Matrix of mean combinations in binary form}
}
\details{
  Creates the binary representation of col and stores it in its 
  associated column.
}
\value{
  Returns matrix \code{effectBitMap} of mean combinations in binary 
  form.
} 
\author{Kim Nimon <kim.nimon@gmail.com>}

\note{
  This function is internal to \code{\link{commonalityCoefficients}}, 
  called during runtime and passed the appropriate parameters. This 
  is not an end-user function.
}
