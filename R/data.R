#' @importFrom tibble tibble
NULL

#' SNOMED Code Usage in Primary Care in England
#'
#' Yearly summary of code usage from 1st August 2011 to 31st July 2023.
#' Note that this data set does not include the code descriptions, for code descriptions see [snomed_dict].
#'
#' @format ## `snomed_usage`
#' A data frame with 1,366,513 rows and 6 columns:
#' \describe{
#'   \item{start_date}{Start date of code usage count}
#'   \item{end_date}{End date of code usage count}
#'   \item{snomed_concept_id}{SNOMED Concept ID}
#'   \item{usage}{Yearly summary of code usage.
#'   Note that counts are rounded to the nearest 10.
#'   Counts of 5 or below are displayed as 5.}
#'   \item{active_at_start}{Specifying whether code was active at the start date.}
#'   \item{active_at_end}{Specifying whether code was active at the end date.}
#' }
#' @source <https://digital.nhs.uk/data-and-information/publications/statistical/mi-snomed-code-usage-in-primary-care>
"snomed_usage"

#' Dictionary of SNOMED Code Descriptions in Primary Care in England
#'
#' Dictionary of code descriptions (including SNOMED concepts) for each year.
#' Note that there are sometimes small differences across years.
#'
#' @format ## `snomed_dict`
#' A data frame with 1,366,513 rows and 4 columns:
#' \describe{
#'   \item{start_date}{Start date of code description}
#'   \item{end_date}{End date of code description}
#'   \item{snomed_concept_id}{SNOMED Concept ID}
#'   \item{description}{Description of SNOMED Concept ID}
#' }
#' @source <https://digital.nhs.uk/data-and-information/publications/statistical/mi-snomed-code-usage-in-primary-care>
"snomed_dict"
