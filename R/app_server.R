#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  # Your application server logic
  team_1 <- mod_team_1_select_server("team_1_select_1", team_2 = team_2)
  mod_team_logo_server("team_logo_1", team = team_1)
  team_2 <- mod_team_2_select_server("team_2_select_1", team_1 = team_1)
  mod_team_logo_server("team_logo_2", team = team_2)

  # Interactions
  observeEvent(
    input$`team_select_1-team`,
    {
      updateSelectInput(
        session = session,
        inputId = input$`team_select_2-team`,
        choices =
          scoreboard %>%
          distinct(home_team_abb) %>%
          filter(!(home_team_abb %>% str_detect("^DUR$|^LEB$")),
                 !(home_team_abb == input$`team_select_1-team`)) %>%
          arrange(home_team_abb) %>%
          pull(home_team_abb)
        )
    }
  )
}
