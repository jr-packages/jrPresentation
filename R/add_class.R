#' Add class tags to the slides
#'
#' @param inverse Default \code{FALSE}
#' @param center Default \code{FALSE}
#' @param middle Default \code{FALSE}
#' @export
add_class = function(inverse = FALSE, center = FALSE, middle = FALSE) {
  txt = "class:"
  opts = c("inverse", "center", "middle")
  selected = paste(opts[c(inverse, center, middle)], collapse = ", ")
  paste(txt, selected)
}
