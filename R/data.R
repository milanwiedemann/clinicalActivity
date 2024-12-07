#' @importFrom tibble tibble
NULL

#' SNOMED Code Usage in Primary Care in England
#'
#' Yearly summary of code usage from 1st August 2011 to 31st July 2023.
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
#'   \item{description}{Description of SNOMED Concept ID}
#' }
#' @source <https://digital.nhs.uk/data-and-information/publications/statistical/mi-snomed-code-usage-in-primary-care>
"snomed_usage"

#' ICD-10 Code Usage from Hospital Admitted Patient Care Activity in England
#'
#' Yearly summary of code usage from 1st April YYYY to 31st March YYYY.
#'
#' @format ## `icd10_usage`
#' A data frame with XXX rows and 6 columns:
#' \describe{
#'   \item{start_date}{Start date of code usage count}
#'   \item{end_date}{End date of code usage count}
#'   \item{icd10_code}{ICD 10 Code.
#'      Note punctuation was removed for compatibility with OpenCodelists.}
#'   \item{usage}{Yearly summary of code usage.}
#'   \item{description}{Description of ICD 10 Code}
#' }
#' @source <https://digital.nhs.uk/data-and-information/publications/statistical/hospital-admitted-patient-care-activity>
"icd10_usage"
