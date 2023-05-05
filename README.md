
# DadosBCB

Este pacote busca dados de uma série na API do Banco Central do Brasil e
retorna os valores da série no período desejado.

## Installation

You can install the development version of DadosBCB like so:

``` r
# https://github.com/jorgeenunes/DadosBCB
```

## Example

Buscando dados da série 433:

``` r
library(DadosBCB)

download_bcb("433", "01-01-2022", "31-12-2022")
#> # A tibble: 12 × 2
#>    date       valor
#>    <date>     <dbl>
#>  1 2022-01-01  0.54
#>  2 2022-02-01  1.01
#>  3 2022-03-01  1.62
#>  4 2022-04-01  1.06
#>  5 2022-05-01  0.47
#>  6 2022-06-01  0.67
#>  7 2022-07-01 -0.68
#>  8 2022-08-01 -0.36
#>  9 2022-09-01 -0.29
#> 10 2022-10-01  0.59
#> 11 2022-11-01  0.41
#> 12 2022-12-01  0.62
```
