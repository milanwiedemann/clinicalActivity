library(shiny)
library(bslib)
library(DT)
library(dplyr)

ui <- page_sidebar(
  title = "Clinical Activity Explorer",
  sidebar = sidebar(
    selectInput("dataset", "Select Dataset:",
                choices = c("SNOMED-CT" = "snomed", "ICD-10" = "icd10")),
    selectizeInput("code_search", "Search by Code:",
                   choices = NULL,
                   multiple = TRUE,
                   options = list(maxOptions = 10)),
    textInput("desc_search", "Search by Description:"),
    actionButton("search", "Search", class = "btn-primary")
  ),
  card(
    card_header("Results"),
    DTOutput("results_table")
  )
)
