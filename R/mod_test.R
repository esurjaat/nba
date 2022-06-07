#' test UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_test_ui <- function(id){
  ns <- NS(id)
  tagList(
    shiny::tableOutput(
      outputId = ns("test")
    )

  )
}

#' test Server Functions
#'
#' @noRd
mod_test_server <- function(id, team){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    text <-
      reactive({
        team$team_abb()
      })

    output$test <-
      renderText({
        text()
      })

  })
}

## To be copied in the UI
# mod_test_ui("test_1")

## To be copied in the server
# mod_test_server("test_1")
