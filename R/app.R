#' Run the Shiny App
#'
#' This function launches the Shiny app for visualizing the data in this package.
#'
#' @export
run_code_explorer <- function() {
  app_dir <- system.file("apps/codeExplorer", package = "snomed")
  if (app_dir == "") {
    stop("Could not find the Shiny app directory. Try re-installing the package.")
  }
  shiny::runApp(app_dir, display.mode = "normal")
}
