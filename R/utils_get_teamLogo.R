#' get_teamLogo
#'
#' @description A utils function
#'
#' @return The return value, if any, from executing the utility.
#'
#' @noRd
get_teamLogo <- function(){
  temporary_dataset <-
    hoopR::load_nba_team_box(season = 2022) %>%
    distinct(team_abbreviation,
             team_logo) %>%
    arrange(team_abbreviation) %>%
    select(team_abbreviation, everything())

  temporary_dataset
}
