#' team_logo UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_team_logo_ui <- function(id){
  ns <- NS(id)
  tagList(
    shiny::textOutput(
      outputId = ns("name")
      ),
    shiny::imageOutput(
      outputId = ns("logo")
      )
  )
}

#' team_logo Server Functions
#'
#' @noRd
mod_team_logo_server <- function(id, team){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    team_data <-
      reactive({
        teamLogo_links %>%
          filter(team_abbreviation == team$team_abb())
      })

    output$name <-
      renderText({
        team_data() %>%
          pull(team_display_name)
      })

    output$logo <-
      renderImage({
        tmpfile <-
          team_data() %>%
          pull(team_logo) %>%
          magick::image_read() %>%
          magick::image_scale("100") %>%
          magick::image_background(color = "#ECF0F5") %>%
          image_write(tempfile(fileext='jpg'), format = 'jpg')

        list(src = tmpfile, contentType = "image/jpeg")
      })

  })
}

## To be copied in the UI
# mod_team_logo_ui("team_logo_1")

## To be copied in the server
# mod_team_logo_server("team_logo_1")
