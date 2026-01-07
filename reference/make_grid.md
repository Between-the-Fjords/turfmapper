# Make subturf grid

Makes and optionally plots grid of sub-turfs.

## Usage

``` r
make_grid(grid, ncol, nrow = ncol)

plot_subturf_grid(grid_long)
```

## Arguments

- grid:

  matrix; subturf ID of each subturf

- ncol:

  integer; number of columns

- nrow:

  integer; number of rows, defaults to \`ncol\` for a square grid

- grid_long:

  dataframe, output of \`make_grid\`

## Value

\`data.frame\` with columns \`.x\`, \`.y\` and subturf

a ggplot object

## Details

use \`ncol\` and \`nrow\` if subturf IDs start at 1 in the top left and
are read left-right. Use \`grid\` in other cases.

## Examples

``` r
# square
make_grid(ncol = 4)
#>    .x .y subturf
#> 1   1 -1       1
#> 2   1 -2       5
#> 3   1 -3       9
#> 4   1 -4      13
#> 5   2 -1       2
#> 6   2 -2       6
#> 7   2 -3      10
#> 8   2 -4      14
#> 9   3 -1       3
#> 10  3 -2       7
#> 11  3 -3      11
#> 12  3 -4      15
#> 13  4 -1       4
#> 14  4 -2       8
#> 15  4 -3      12
#> 16  4 -4      16

# Rectangular
make_grid(ncol = 4, nrow = 5)
#>    .x .y subturf
#> 1   1 -1       1
#> 2   1 -2       5
#> 3   1 -3       9
#> 4   1 -4      13
#> 5   1 -5      17
#> 6   2 -1       2
#> 7   2 -2       6
#> 8   2 -3      10
#> 9   2 -4      14
#> 10  2 -5      18
#> 11  3 -1       3
#> 12  3 -2       7
#> 13  3 -3      11
#> 14  3 -4      15
#> 15  3 -5      19
#> 16  4 -1       4
#> 17  4 -2       8
#> 18  4 -3      12
#> 19  4 -4      16
#> 20  4 -5      20

# snake
make_grid(grid = rbind(1:4, 8:5, 9:12, 16:13))
#>    .x .y subturf
#> 1   1 -1       1
#> 2   1 -2       8
#> 3   1 -3       9
#> 4   1 -4      16
#> 5   2 -1       2
#> 6   2 -2       7
#> 7   2 -3      10
#> 8   2 -4      15
#> 9   3 -1       3
#> 10  3 -2       6
#> 11  3 -3      11
#> 12  3 -4      14
#> 13  4 -1       4
#> 14  4 -2       5
#> 15  4 -3      12
#> 16  4 -4      13
```
