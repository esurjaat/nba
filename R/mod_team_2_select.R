#' team_2_select UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_team_2_select_ui <- function(id, label, selected){
  ns <- NS(id)
  tagList(
    shiny::selectInput(
      inputId = ns("team"),
      label = label,
      choices = scoreboard %>%
        distinct(home_team_abb) %>%
        filter(!(home_team_abb %>% str_detect("^DUR$|^LEB$"))) %>%
        arrange(home_team_abb) %>%
        pull(home_team_abb),
      selected = selected,
      multiple = FALSE)
  )
}

#' team_2_select Server Functions
#'
#' @noRd
mod_team_2_select_server <- function(id, team_1){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    observeEvent(team_1$team_abb(),{
      updateSelectInput(
        session = session,
        inputId = "team",
        choices =
          scoreboard %>%
          distinct(home_team_abb) %>%
          filter(!(home_team_abb %>% str_detect("^DUR$|^LEB$")),
                 !(home_team_abb == team_1$team_abb())) %>%
          arrange(home_team_abb) %>%
          pull(home_team_abb),
        selected = input$team
      )
    }
    )

    return(
      list(
        team_abb = reactive({ input$team })
      )
    )

  })
}

## To be copied in the UI
# mod_team_2_select_ui("team_2_select_1", label, selected)

## To be copied in the server
# mod_team_2_select_server("team_2_select_1", team_1)
