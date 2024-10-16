# This script loads all available code usage data from files.digital.nhs.uk

library(tidyverse)
library(janitor)
library(here)

url_start <- "https://files.digital.nhs.uk/"

icd10_code_usage_urls <- list(
  "2022to2023" = paste0(url_start, "7A/DB1B00/hosp-epis-stat-admi-diag-2022-23-tab_V2.xlsx"),
  "2021to2022" = paste0(url_start, "0E/E70963/hosp-epis-stat-admi-diag-2021-22-tab.xlsx"),
  "2020to2021" = paste0(url_start, "5B/AD892C/hosp-epis-stat-admi-diag-2020-21-tab.xlsx")
)

read_icd10_usage_xlsx_from_url <- function(url, sheet = 6, skip = 12, ...) {
  tmp_xlsx <- tempfile()
  download.file(
    url,
    destfile = "tmp_xlsx",
    mode = "wb"
  )
  readxl::read_xlsx(
    "tmp_xlsx",
    col_names = FALSE,
    .name_repair = janitor::make_clean_names,
    sheet = sheet,
    skip = skip,
    ...
  )
  unlink(tmp_xlsx)
}

select_all_diag_counts <- function(data) {
  dplyr::select(
    data,
    icd10_code = 1,
    description = 2,
    usage = 8
  ) |>
    # separate(icd10_code, c("icd10_category", "icd10_subclassification"), "\\.", remove = FALSE) |>
    dplyr::mutate(
      usage = as.integer(usage)
    )
}

icd10_usage <- icd10_code_usage_urls |>
  map(read_icd10_usage_xlsx_from_url) |>
  map(select_all_diag_counts) |>
  bind_rows(.id = "nhs_fy") |>
  separate(nhs_fy, c("start_date", "end_date"), "to") |>
  mutate(
    start_date = as.Date(paste0(start_date, "-04-01")),
    end_date = as.Date(paste0(end_date, "-03-31"))
  )

usethis::use_data(
  icd10_usage,
  compress = "bzip2",
  overwrite = TRUE
)

# icd10_usage |>
#   filter(str_detect(icd10_code, "A00"))
