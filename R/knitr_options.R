# TODO: PASS as arguments
#' @title Set knitr Options
#'
#' @description In the future, pass the options as arguments.
#' @export
set_presentation_options = function() {
  knitr::opts_chunk$set(
    comment = "#>",
    echo = TRUE,
    collapse = TRUE,
    cache = TRUE,
    fig.align = "center",
    fig.pos = "t",
    out.width = "70%",
    fig.width = 6,
    fig.asp = 0.618,  # 1 / phi,
    dev="svg"
  )
  set.seed(2016)
  options(dplyr.print_min = 4,
          dplyr.print_max = 4,
          digits = 3)

}