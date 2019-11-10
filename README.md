
<!-- README.md is generated from README.Rmd. Please edit that file -->
turfmapper
==========

<!-- badges: start -->
<!-- badges: end -->
The goal of turfmapper is to plot species \* time turf maps.

Installation
------------

You can install `turfmapper` from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("Between-the-Fjords/turfmapper")
```

Example
-------

This is a basic example which shows you how to solve a common problem:

``` r
library(turfmapper)
library("tidyverse")
#> ── Attaching packages ────────────────────────────────── tidyverse 1.2.1 ──
#> ✔ ggplot2 3.2.1     ✔ purrr   0.3.2
#> ✔ tibble  2.1.3     ✔ dplyr   0.8.3
#> ✔ tidyr   1.0.0     ✔ stringr 1.4.0
#> ✔ readr   1.3.1     ✔ forcats 0.4.0
#> ── Conflicts ───────────────────────────────────── tidyverse_conflicts() ──
#> ✖ dplyr::filter() masks stats::filter()
#> ✖ dplyr::lag()    masks stats::lag()
data(heath)
heath_long <- heath %>% 
  pivot_longer(cols = matches("^freq\\d+$"), 
               names_to = "subturf", 
               values_to = "presence", 
               names_prefix = "freq", 
               names_ptypes = list(subturf = integer())) %>% 
  filter(presence != "0")#only want presences

#set up subturf grid
grid <- make_grid(ncol = 4)
```

This function will plot the data from one turf over time.

``` r
heath_long %>%
  filter(plot == "10.1.") %>%
  make_turf_plot(
    year = year, species = species, cover = cover, subturf = subturf, 
    title = glue::glue("Site {.$site}: plot {.$plot}"), 
    grid = grid)
```

<img src="man/figures/README-one_plot-1.png" width="100%" />

There are a few taxa than need checking here.

See the vignette for plotting multiple turfs. The vignette's source RMD file is a template.
