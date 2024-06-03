#' Turf map over time
#' @description
#' Plot species cover against time when there are no subturf information
#' @param data Community data.frame in long form
#' @param title character; text for title
#' @param species name of column with species data
#' @param cover name of column with cover data
#' @param year name of column with year data
#' @details This is just a wrapper for a simple ggplot, but made consistent with See vignette for examples
#' @return a ggplot object
#' @importFrom ggplot2 ggplot aes geom_tile facet_grid ggtitle
#' @importFrom ggplot2 scale_x_continuous scale_y_discrete scale_fill_distiller
#' @importFrom ggplot2 theme_bw theme element_blank


make_turf_plot_no_subturfs <- function(data, year, species, cover, title) {
  data |>
    ggplot(aes(x = {{ year }}, y = {{ species }}, fill = {{ cover }})) +
    geom_tile() +
    ggtitle(title) +
    scale_x_continuous(expand = c(0, 0), breaks = scales::extended_breaks(w = c(0.5, 0.2, 0.5, 0.05))) +
    scale_y_discrete(expand = c(0, 0)) +
    scale_fill_distiller(type = "seq", palette = "Greens", direction = 1, limits = c(0, NA)) +
    theme_bw() +
    theme(
      axis.title = element_blank(),
      panel.grid = element_blank()
    )
}
