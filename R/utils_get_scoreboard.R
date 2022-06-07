#' get_scoreboard
#'
#' @description A utils function
#'
#' @return The return value, if any, from executing the utility.
#'
#' @noRd
get_scoreboard <- function(){
  season_months <- c(202110:202112, 202201:202206)

  scoreboard <-
    season_months %>%
    map_df(
      .f = ~try(hoopR::espn_nba_scoreboard(season = .x))
    )

  scoreboard
}
