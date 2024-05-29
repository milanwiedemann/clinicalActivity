library(tidyverse)

bp_cod <- read_csv(
  "https://www.opencodelists.org/codelist/nhsd-primary-care-domain-refsets/bp_cod/20200812/download.csv",
  col_types = list(
    code = "c",
    term = "c"
    )
  ) |>
  rename(snomed_concept_id = code, description = term)

usethis::use_data(
  bp_cod,
  compress = "bzip2",
  overwrite = TRUE
)
