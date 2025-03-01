# Functions in this file: xDIC()

##———————————————————————————————————————————————————————————————————————————##
#### xDIC ####
#' @title Dissolved inorganic carbon species
#'
#' @description `xDIC()` calculates the relative abundance of the DIC species
#'   as a function of solution temperature, pH, and salinity.
#'
#' @param temp The temperature of the solution (°C).
#' @param pH The pH of the solution.
#' @param S The salinity of the solution (g/kg or ‰).
#'
#' @return
#' Returns a data frame with the relative abundance of the DIC species:
#' * Relative abundance of dissolved CO2 (%).
#' * Relative abundance of bicarbonate ion (%).
#' * Relative abundance of carbonate ion (%).
#'
#' @examples
#' xDIC(temp = 25, pH = 7, S = 30)
#'
#' @export

xDIC = function(temp, pH, S) {
  TinK = temp + 273.15

  # First and second stoichiometric dissociation constants of carbonic acid

  # from Harned and Davis (1943) and Harned and Scholes (1941)
  pK1_0 = -126.34048 + 6320.813 / TinK + 19.568224 * log(TinK)
  pK2_0 = -90.18333 + 5143.692 / TinK + 14.613358 * log(TinK)

  # from Millero (2006)
    A1 = 13.4191 * S^0.5 + 0.0331 * S - (5.33 * 10^-5) * S^2
    B1 = -530.123 * S^0.5 - 6.103 * S
    C1 = -2.06950 * S^0.5
  pK1 = A1 + (B1 / TinK) + C1 * log(TinK) + pK1_0
    A2 = 21.0894 * S^0.5 + 0.1248 * S - (3.687 * 10^-4) * S^2
    B2 = -772.483 * S^0.5 - 20.051 * S
    C2 = -3.3336 * S^0.5
  pK2 = A2 + (B2 / TinK) + C2 * log(TinK) + pK2_0

  # Relative proportion of the DIC species
  xCO3  = ((10^(pK1 + pK2 - 2*pH) + 10^(pK2 - pH) + 1)^-1) * 100
  xHCO3 = (10^(pK2 - pH) * (10^(pK1 + pK2 - 2*pH) +
                              10^(pK2 - pH) + 1)^-1) * 100
  xCO2  = ((10^(2*pH - pK1 - pK2) + 10^(pH-pK1) + 1)^-1) * 100

  data.frame(xCO2, xHCO3, xCO3)

}
