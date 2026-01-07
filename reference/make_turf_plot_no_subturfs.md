# Turf map over time

Plot species cover against time when there are no subturf information

## Usage

``` r
make_turf_plot_no_subturfs(data, year, species, cover, title)
```

## Arguments

- data:

  Community data.frame in long form

- year:

  name of column with year data

- species:

  name of column with species data

- cover:

  name of column with cover data

- title:

  character; text for title

## Value

a ggplot object

## Details

This is just a wrapper for a simple ggplot, but made consistent with See
vignette for examples
