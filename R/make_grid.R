#' @title Make subturf grid
#' @description Makes and optionally plots grid of sub-turfs.
#' @param grid matrix; subturf ID of each subturf
#' @param ncol integer; number of columns
#' @param nrow integer; number of rows, defaults to `ncol` for a square grid
#' @details use `ncol` and `nrow` if subturf IDs start at 1 in the 
#' top left and are read left-right. Use `grid` in other cases.
#' @return `data.frame` with columns `.x`, `.y` and subturf
#' @examples 
#' #square
#' make_grid(ncol = 4)
#' 
#' #Rectangular
#' make_grid(ncol = 4, nrow = 5)
#' 
#' #snake
#' make_grid(grid = rbind(1:4, 8:5, 9:12, 16:13))
#' 
#' @export

make_grid <- function(grid, ncol, nrow = ncol){
  if(missing(grid)){
    grid <- matrix(1:(nrow * ncol), nrow = nrow, byrow = TRUE)
  }
  
  pos <- data.frame(.x = as.vector(col(grid)),
                    .y = -as.vector(row(grid)),
                    subturf = as.vector(grid))
  return(pos)
}

#'@rdname make_grid
#'@param obj dataframe, output of `make_grid`
#'@return a ggplot object
#' @importFrom ggplot2 ggplot aes geom_tile geom_text scale_x_continuous scale_y_continuous coord_equal theme element_blank
#' @importFrom rlang .data
#' @export

plot_subturf_grid <-   function(obj){
  g <- ggplot(obj, 
              aes(x = .data$.x, y = .data$.y, label = .data$subturf)) +
    geom_tile(colour = "grey60", fill = "grey90",
              show.legend = FALSE, alpha = .8) +
    geom_text() +
    scale_x_continuous(expand = c(0, 0)) +  
    scale_y_continuous(expand = c(0, 0)) +
    coord_equal() +
    theme(axis.text = element_blank(), 
          axis.ticks = element_blank())
  return(g)
}
