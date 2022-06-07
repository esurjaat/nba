## code to prepare `scoreboard` dataset goes here
scoreboard <- get_scoreboard()

usethis::use_data(scoreboard, overwrite = TRUE)
