library(shiny)
library(DT)

server <- function(input, output, session) {
  # Load data from the package
  data <- snomed::snomed_usage

  # Update variable choices
  observe({
    updateSelectInput(session, "variables", choices = names(data))
  })

  # Create the table
  output$data_table <- renderDT({
    req(input$variables)

    # Subset the data based on selected variables
    subset_data <- data[, input$variables, drop = FALSE]

    # Create the datatable
    datatable(
      subset_data,
      options = list(
        pageLength = input$n_rows,
        scrollX = TRUE,
        scrollY = "400px"
      ),
      filter = "top"
    )
  })
}
