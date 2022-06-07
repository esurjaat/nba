#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(# Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    fluidPage(
      shinydashboard::dashboardPage(
        shinydashboard::dashboardHeader(title = "NBA Data"),
        shinydashboard::dashboardSidebar(),
        shinydashboard::dashboardBody(
          fluidRow(
            column(width = 5),
            column(width = 2,h1("Select Teams"), align = "center"),
            column(width = 5)
            ),
          fluidRow(
            column(width = 2),
            column(
              width = 3,
              align = "center",
              mod_team_1_select_ui("team_1_select_1", label = "Team 1", selected = "GS"),
              mod_team_logo_ui("team_logo_1")
            ),
            column(
              width = 2,
              align = "center",
              "VS"
            ),
            column(
              width = 3,
              align = "center",
              mod_team_2_select_ui("team_2_select_1", label = "Team 2", selected = "BOS"),
              mod_team_logo_ui("team_logo_2")
            ),
            column(width = 2)
          )
        )
      )
    ))
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "nba"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
