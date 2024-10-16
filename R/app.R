#' Interactive tool to explore code activity
#'
#' This function launches the Shiny app for visualizing the data in this package.
#'
#' @export
run_explore_activity <- function() {
  app_dir <- system.file("apps/codeExplorer", package = "clinicalActivity")
  if (app_dir == "") {
    stop("Could not find the Shiny app directory. Try re-installing the package.")
  }
  shiny::runApp(app_dir, display.mode = "normal")
}
