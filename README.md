
<!-- README.md is generated from README.Rmd. Please edit that file -->

# snomed: An R data package containing SNOMED code usage counts in Primary Care in England

<!-- badges: start -->
<!-- badges: end -->

The goal of `snomed` is to to make anonymous SNOMED code usage counts in
Primary Care in England available in R. The original data is available
from NHS Digital at
<https://digital.nhs.uk/data-and-information/publications/statistical/mi-snomed-code-usage-in-primary-care>.

## Installation

You can install the development version of `snomed` like so:

``` r
remotes::install_github("milanwiedemann/snomed")
```

## Example

``` r
# Load snomed package
library(snomed)
```

### SNOMED Code Usage in Primary Care in England

``` r
# Return snomed code usage data
snomed_usage
#> # A tibble: 1,366,513 × 6
#>    start_date end_date   snomed_concept_id   usage active_at_start active_at_end
#>    <date>     <date>     <chr>               <int> <lgl>           <lgl>        
#>  1 2011-08-01 2012-07-31 163020007          5.80e7 TRUE            TRUE         
#>  2 2011-08-01 2012-07-31 163030003          4.01e7 TRUE            TRUE         
#>  3 2011-08-01 2012-07-31 163031004          4.00e7 TRUE            TRUE         
#>  4 2011-08-01 2012-07-31 1000731000000107   2.02e7 TRUE            TRUE         
#>  5 2011-08-01 2012-07-31 162763007          1.98e7 TRUE            TRUE         
#>  6 2011-08-01 2012-07-31 1020291000000106   1.93e7 TRUE            TRUE         
#>  7 2011-08-01 2012-07-31 1000661000000107   1.86e7 TRUE            TRUE         
#>  8 2011-08-01 2012-07-31 1000651000000109   1.86e7 TRUE            TRUE         
#>  9 2011-08-01 2012-07-31 1022431000000105   1.81e7 TRUE            TRUE         
#> 10 2011-08-01 2012-07-31 1022541000000102   1.80e7 TRUE            TRUE         
#> # ℹ 1,366,503 more rows
```

### Dictionary of SNOMED Code Descriptions in Primary Care in England

``` r
# Return snomed code dictionary
snomed_dict
#> # A tibble: 1,366,513 × 4
#>    start_date end_date   snomed_concept_id description                          
#>    <date>     <date>     <chr>             <chr>                                
#>  1 2011-08-01 2012-07-31 163020007         On examination - blood pressure read…
#>  2 2011-08-01 2012-07-31 163030003         On examination - Systolic blood pres…
#>  3 2011-08-01 2012-07-31 163031004         On examination - Diastolic blood pre…
#>  4 2011-08-01 2012-07-31 1000731000000107  Serum creatinine level (observable e…
#>  5 2011-08-01 2012-07-31 162763007         On examination - weight (finding)    
#>  6 2011-08-01 2012-07-31 1020291000000106  Glomerular filtration rate calculate…
#>  7 2011-08-01 2012-07-31 1000661000000107  Serum sodium level (observable entit…
#>  8 2011-08-01 2012-07-31 1000651000000109  Serum potassium level (observable en…
#>  9 2011-08-01 2012-07-31 1022431000000105  Haemoglobin estimation (observable e…
#> 10 2011-08-01 2012-07-31 1022541000000102  Total white cell count (observable e…
#> # ℹ 1,366,503 more rows
```
