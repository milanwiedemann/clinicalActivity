# This script loads all available code usage data from files.digital.nhs.uk

library(tidyverse)
library(janitor)
library(here)

url_start <- "https://files.digital.nhs.uk/"

icd10_code_usage_urls <- list(
  "fy22to23" = list(
    file = paste0(url_start, "7A/DB1B00/hosp-epis-stat-admi-diag-2022-23-tab_V2.xlsx"),
    sheet = 6,
    skip_rows = 12,
    usage_col = 8
  ),
  "fy23to24" = list(
    file = paste0(url_start, "A5/5B8474/hosp-epis-stat-admi-diag-2023-24-tab.xlsx"),
    sheet = 6,
    skip_rows = 12,
    usage_col = 8
  ),
  "fy21to22" = list(
    file = paste0(url_start, "0E/E70963/hosp-epis-stat-admi-diag-2021-22-tab.xlsx"),
    sheet = 6,
    skip_rows = 12,
    usage_col = 8
  ),
  "fy20to21" = list(
    file = paste0(url_start, "5B/AD892C/hosp-epis-stat-admi-diag-2020-21-tab.xlsx"),
    sheet = 6,
    skip_rows = 12,
    usage_col = 8
  ),
  "fy19to20" = list(
    file = paste0(url_start, "37/8D9781/hosp-epis-stat-admi-diag-2019-20-tab%20supp.xlsx"),
    sheet = 6,
    skip_rows = 11,
    usage_col = 8
  ),
  "fy18to19" = list(
    file = paste0(url_start, "1C/B2AD9B/hosp-epis-stat-admi-diag-2018-19-tab.xlsx"),
    sheet = 6,
    skip_rows = 11,
    usage_col = 8
  ),
  "fy17to18" = list(
    file = paste0(url_start, "B2/5CEC8D/hosp-epis-stat-admi-diag-2017-18-tab.xlsx"),
    sheet = 6,
    skip_rows = 11,
    usage_col = 8
  ),
  "fy16to17" = list(
    file = paste0(url_start, "publications/7/d/hosp-epis-stat-admi-diag-2016-17-tab.xlsx"),
    sheet = 6,
    skip_rows = 11,
    usage_col = 8
  ),
  "fy15to16" = list(
    file = paste0(url_start, "publicationimport/pub22xxx/pub22378/hosp-epis-stat-admi-diag-2015-16-tab.xlsx"),
    sheet = 6,
    skip_rows = 12,
    usage_col = 8
  ),
  "fy14to15" = list(
    file = paste0(url_start, "publicationimport/pub19xxx/pub19124/hosp-epis-stat-admi-diag-2014-15-tab.xlsx"),
    sheet = 6,
    skip_rows = 12,
    usage_col = 8
  ),
  "fy13to14" = list(
    file = paste0(url_start, "publicationimport/pub16xxx/pub16719/hosp-epis-stat-admi-diag-2013-14-tab.xlsx"),
    sheet = 6,
    skip_rows = 18,
    usage_col = 3
  ),
  "fy12to13" = list(
    file = paste0(url_start, "publicationimport/pub12xxx/pub12566/hosp-epis-stat-admi-diag-2012-13-tab.xlsx"),
    sheet = 6,
    skip_rows = 19,
    usage_col = 3
  )
)

read_icd10_usage_from_url <- function(url_list, sheet = 6, skip = 11, icd10_code_col_num = 1, description_col_num = 2, usage_col_num = 8, ...) {
  url <- sapply(url_list, function(x) x$file)
  sheet <- ifelse(is.na(url_list$sheet), sheet, url_list$sheet)
  skip <- ifelse(is.na(url_list$skip_rows), skip, url_list$skip_rows)
  usage_col_num <- ifelse(is.na(url_list$usage_col), usage_col_num, url_list$usage_col)
  tmp_xlsx <- tempfile()
  download.file(
    url,
    destfile = "tmp_xlsx",
    mode = "wb"
  )
  data <- readxl::read_xlsx(
    "tmp_xlsx",
    col_names = FALSE,
    .name_repair = janitor::make_clean_names,
    sheet = sheet,
    skip = skip,
    ...
  )
  unlink(tmp_xlsx)
  dplyr::select(
    data,
    icd10_code = icd10_code_col_num,
    description = description_col_num,
    usage = usage_col_num
  ) |>
    # separate(icd10_code, c("icd10_category", "icd10_subclassification"), "\\.", remove = FALSE) |>
    dplyr::mutate(
      usage = as.integer(usage)
    )
}

icd10_usage <- icd10_code_usage_urls |>
  map(read_icd10_usage_from_url) |>
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
