#'@title Subturf maps over time
#'@param data Community data.frame in long form
#'@param grid grid from \code{make_grid}
#'@param title character; text for title
#'@param species name of column with species data
#'@param cover name of column with cover data
#'@param year name of column with year data
#'@param subturf name of column with subturf IDs 
#'@return a ggplot object
#'@importFrom ggplot2 ggplot aes geom_tile facet_grid ggtitle 
#'@importFrom ggplot2 scale_x_continuous scale_y_continuous scale_fill_distiller
#'@importFrom ggplot2 theme_bw theme element_blank unit element_text
#'@importFrom rlang .data
#'@importFrom dplyr left_join rename
#'@export

make_turf_plot <- function(data, grid, species, cover, year, subturf, title){
  #rename columns for convenience
  data <- rename(data, subturf = {{subturf}}, species = {{species}}, year = {{year}})
  
  #check no unidentified subturfs
  stopifnot(all(data$subturf %in% grid$subturf))

  #join data to grid  
  data <- left_join(data, grid, by = "subturf")
  
  #plot
  ggplot(data, aes(x = .data$.x, 
                   y = .data$.y, 
                   fill = {{cover}})) +
    geom_tile(colour = "grey60") +
    facet_grid(species ~ year) +
    ggtitle(title) +
    scale_x_continuous(expand = c(0, 0)) +
    scale_y_continuous(expand = c(0, 0)) +
    scale_fill_distiller(type = "seq", palette = "Greens", direction = 1) + 
    theme_bw() +
    theme(
      axis.text = element_blank(), 
      axis.title = element_blank(), 
      axis.ticks = element_blank(),
      panel.spacing.y = unit(0.04, "lines"),
      panel.grid.minor = element_blank(),
      strip.text.y = element_text(angle = 0)
    )
}
