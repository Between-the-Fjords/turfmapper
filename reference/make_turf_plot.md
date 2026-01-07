# Subturf maps over time

Subturf maps over time

## Usage

``` r
make_turf_plot(
  data,
  grid_long,
  species,
  cover,
  year,
  subturf,
  title,
  site_id = "",
  turf_id = ""
)
```

## Arguments

- data:

  Community data.frame in long form

- grid_long:

  grid from `make_grid`

- species:

  name of column with species data

- cover:

  name of column with cover data

- year:

  name of column with year data

- subturf:

  name of column with subturf IDs

- title:

  character; text for title if missing \`site_id\` and \`turf_id\` are
  used to make a title

- site_id:

  name of Site ID column for plot title

- turf_id:

  name of Turf ID column for plot title

## Value

a ggplot object

## Details

See vignette for examples
