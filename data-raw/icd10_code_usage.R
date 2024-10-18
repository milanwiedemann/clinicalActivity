# This script loads all available code usage data from files.digital.nhs.uk

library(tidyverse)
library(janitor)
library(here)

url_start <- "https://files.digital.nhs.uk/"

icd10_code_usage_urls <- list(
  "2023to2024" = paste0(url_start, "A5/5B8474/hosp-epis-stat-admi-diag-2023-24-tab.xlsx"),
  "2022to2023" = paste0(url_start, "7A/DB1B00/hosp-epis-stat-admi-diag-2022-23-tab_V2.xlsx"),
  "2021to2022" = paste0(url_start, "0E/E70963/hosp-epis-stat-admi-diag-2021-22-tab.xlsx"),
  "2020to2021" = paste0(url_start, "5B/AD892C/hosp-epis-stat-admi-diag-2020-21-tab.xlsx"),
  "2019to2020" = paste0(url_start, "37/8D9781/hosp-epis-stat-admi-diag-2019-20-tab%20supp.xlsx"),
  "2018to2019" = paste0(url_start, "1C/B2AD9B/hosp-epis-stat-admi-diag-2018-19-tab.xlsx"),
  "2017to2018" = paste0(url_start, "B2/5CEC8D/hosp-epis-stat-admi-diag-2017-18-tab.xlsx"),
  "2016to2017" = paste0(url_start, "publications/7/d/hosp-epis-stat-admi-diag-2016-17-tab.xlsx"),
  "2015to2016" = paste0(url_start, "publicationimport/pub22xxx/pub22378/hosp-epis-stat-admi-diag-2015-16-tab.xlsx"),
  "2014to2015" = paste0(url_start, "publicationimport/pub19xxx/pub19124/hosp-epis-stat-admi-diag-2014-15-tab.xlsx"),
  "2013to2014" = paste0(url_start, "publicationimport/pub16xxx/pub16719/hosp-epis-stat-admi-diag-2013-14-tab.xlsx"),
  "2012to2013" = paste0(url_start, "publicationimport/pub12xxx/pub12566/hosp-epis-stat-admi-diag-2012-13-tab.xlsx")
)

read_icd10_usage_xlsx_from_url <- function(url, sheet = 6, skip = 11, ...) {
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
  #need to define year here
  usage_col <-  ifelse(year >=2015, 3, 8)

  dplyr::select(
    data,
    icd10_code = 1,
    description = 2,
    usage = usage_col
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
