% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/DIC.R
\name{xDIC}
\alias{xDIC}
\title{Dissolved inorganic carbon species}
\usage{
xDIC(temp, pH, S)
}
\arguments{
\item{temp}{The temperature of the solution (°C).}

\item{pH}{The pH of the solution.}

\item{S}{The salinity of the solution (g/kg or ‰).}
}
\value{
Returns a data frame with the relative abundance of the DIC species:
\itemize{
\item Relative abundance of dissolved CO2 (\%).
\item Relative abundance of bicarbonate ion (\%).
\item Relative abundance of carbonate ion (\%).
}
}
\description{
\code{xDIC()} calculates the relative abundance of the DIC species
as a function of solution temperature, pH, and salinity.
}
\examples{
xDIC(temp = 25, pH = 7, S = 30)

}
