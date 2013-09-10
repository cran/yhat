\name{genList}
\alias{genList}
\title{Generate List R^2 Values}
\description{
  Use the bitmap matrix to generate the list of \emph{R^2} values 
  needed.
}
\usage{
  genList(ivlist, value)
}
\arguments{
  \item{ivlist }{ List of independent variables in dataset}
  \item{value }{ Number of variables}
}
\details{
  Returns the number of \emph{R^2} values that will be calculated 
  in output tables.
}
\value{
  Returns \code{newlist} from generate list function call.
}
\author{Kim Nimon <kim.nimon@gmail.com>}

\note{
  This function is internal to \code{\link{commonalityCoefficients}}, 
  called during runtime and passed the appropriate parameters. This 
  is not an end-user function.
}
