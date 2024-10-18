#' Interactive tool to explore clinical activity
#'
#' Launch Shiny app to explore clinical activity.
#'
#' @export
run_explore_activity <- function() {
  app_dir <- system.file("app", package = "clinicalActivity")
  if (app_dir == "") {
    stop("Could not find the Shiny app directory. Try re-installing the package.")
  }
  shiny::runApp(app_dir, display.mode = "normal")
}
