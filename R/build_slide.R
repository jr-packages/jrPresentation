#' Convert RMD to HTML
#'
#' If the slides are not runtime shiny, the filename is passed to
#'  \code{rmarkdown::render}.
#'
#' This could be run in parallel, but currently isn't
#' @param fname Filename
#' @export
build_slide = function(fname) {
  yaml = rmarkdown::yaml_front_matter(fname)
  if (!is.null(yaml$runtime)) {
    message("Can't build Shiny slides")
    return(invisible(NULL))
  }
  rmarkdown::render(fname)
}

