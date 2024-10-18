
<!-- README.md is generated from README.Rmd. Please edit that file -->

# clinicalActivity: Clinical Activity in England

<!-- badges: start -->

<!-- badges: end -->

The goal of `clinicalActivity` is to make yearly summaries of **SNOMED
Code Usage in Primary Care** and **Hospital Admitted Patient Care
Activity** published by NHS Digital available in R for research. The
original data is available from NHS Digital at:

- [SNOMED Code Usage in Primary
  Care](https://digital.nhs.uk/data-and-information/publications/statistical/mi-snomed-code-usage-in-primary-care)
- [Hospital Admitted Patient Care
  Activity](https://digital.nhs.uk/data-and-information/publications/statistical/hospital-admitted-patient-care-activity)

## Installation

You can install the development version of `clinicalActivity` like so:

``` r
remotes::install_github("milanwiedemann/clinicalActivity")
```

## Example

``` r
# Load clinicalActivity package
library(clinicalActivity)
```

### Dataset: SNOMED Code Usage in Primary Care in England

This is only a selection of the full dataset published by NHS Digital,
for the data pre-processing see `/data-raw/snomed_code_usage.R`.

``` r
# Return SNOMED code usage data
snomed_usage
#> # A tibble: 1,366,513 × 7
#>    start_date end_date   snomed_concept_id description     usage active_at_start
#>    <date>     <date>     <chr>             <chr>           <int> <lgl>          
#>  1 2011-08-01 2012-07-31 163020007         On examinatio… 5.80e7 TRUE           
#>  2 2011-08-01 2012-07-31 163030003         On examinatio… 4.01e7 TRUE           
#>  3 2011-08-01 2012-07-31 163031004         On examinatio… 4.00e7 TRUE           
#>  4 2011-08-01 2012-07-31 1000731000000107  Serum creatin… 2.02e7 TRUE           
#>  5 2011-08-01 2012-07-31 162763007         On examinatio… 1.98e7 TRUE           
#>  6 2011-08-01 2012-07-31 1020291000000106  Glomerular fi… 1.93e7 TRUE           
#>  7 2011-08-01 2012-07-31 1000661000000107  Serum sodium … 1.86e7 TRUE           
#>  8 2011-08-01 2012-07-31 1000651000000109  Serum potassi… 1.86e7 TRUE           
#>  9 2011-08-01 2012-07-31 1022431000000105  Haemoglobin e… 1.81e7 TRUE           
#> 10 2011-08-01 2012-07-31 1022541000000102  Total white c… 1.80e7 TRUE           
#> # ℹ 1,366,503 more rows
#> # ℹ 1 more variable: active_at_end <lgl>
```

### Dataset: Hospital Admitted Patient Care Activity

This is only a selection of the full dataset published by NHS Digital,
for the data pre-processing see `/data-raw/icd10_code_usage.R`.

``` r
# Return ICD-10 diagnosis code usage data
icd10_usage
#> # A tibble: 33,893 × 5
#>    start_date end_date   icd10_code description                            usage
#>    <date>     <date>     <chr>      <chr>                                  <int>
#>  1 2022-04-01 2023-03-31 A00.0      Cholera due to Vibrio cholerae 01, bi…     3
#>  2 2022-04-01 2023-03-31 A00.9      Cholera, unspecified                      23
#>  3 2022-04-01 2023-03-31 A01.0      Typhoid fever                            657
#>  4 2022-04-01 2023-03-31 A01.1      Paratyphoid fever A                       71
#>  5 2022-04-01 2023-03-31 A01.2      Paratyphoid fever B                       13
#>  6 2022-04-01 2023-03-31 A01.4      Paratyphoid fever, unspecified            28
#>  7 2022-04-01 2023-03-31 A02.0      Salmonella enteritis                    1762
#>  8 2022-04-01 2023-03-31 A02.1      Salmonella sepsis                        243
#>  9 2022-04-01 2023-03-31 A02.2      Localized salmonella infections           74
#> 10 2022-04-01 2023-03-31 A02.8      Other specified salmonella infections     37
#> # ℹ 33,883 more rows
```

### Interactive Code Usage Explorer

The interactive tool is available online at
<https://milanwiedemann.shinyapps.io/codeexplorer/> or by launching the
Shiny app locally using:

``` r
# Open Shiny App to explore code usage interactively
run_explore_activity()
```
