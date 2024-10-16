library(shiny)
library(bslib)
library(DT)

ui <- page_sidebar(
  title = "My Data Viewer",
  sidebar = sidebar(
    selectInput("variables", "Choose variables:", choices = NULL, multiple = TRUE),
    numericInput("n_rows", "Number of rows to display:", value = 10, min = 1, max = 1000)
  ),
  DTOutput("data_table")
)
