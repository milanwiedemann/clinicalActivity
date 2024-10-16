server <- function(input, output, session) {

  current_data <- reactiveVal(NULL)

  observeEvent(input$dataset, {
    if (input$dataset == "snomed") {
      dataset <- snomed_usage
      code_col <- "snomed_concept_id"
      columns_to_show <- c("start_date", "snomed_concept_id", "description")
      custom_names <- c("Start Date", "SNOMED Concept ID", "Description")
    } else if (input$dataset == "icd10") {
      dataset <- icd10_usage
      code_col <- "icd10_code"
      columns_to_show <- c("start_date", "icd10_code", "description")
      custom_names <- c("Start Date", "ICD-10 Code", "Description")
    }

    current_data(setNames(head(dataset[columns_to_show], 10), custom_names))

    updateSelectizeInput(session, "code_search",
                         choices = c("", dataset[[code_col]]),
                         selected = "",
                         server = TRUE,
                         options = list(maxOptions = 10))
  })

  filtered_data <- eventReactive(input$search, {
    if (input$dataset == "snomed") {
      dataset <- snomed_usage
      code_col <- "snomed_concept_id"
      columns_to_show <- c("start_date", "snomed_concept_id", "description")
      column_names <- c("Start Date", "SNOMED Concept ID", "Description")
    } else if (input$dataset == "icd10") {
      dataset <- icd10_usage
      code_col <- "icd10_code"
      columns_to_show <- c("start_date", "icd10_code", "description")
      column_names <- c("Start Date", "ICD-10 Code", "Description")
    }

    result <- dataset %>%
      filter(
        (input$code_search == "" | !!sym(code_col) == input$code_search) &
          grepl(input$desc_search, description, ignore.case = TRUE)
      ) %>%
      select(all_of(columns_to_show))

    setNames(result, column_names)
  })

  output$results_table <- renderDT({

    data <- if (input$search == 0) current_data() else filtered_data()

    datatable(data,
              options = list(
                pageLength = 10,
                scrollX = TRUE,
                searching = FALSE
              ),
              colnames = colnames(data)
    )
  })
}
