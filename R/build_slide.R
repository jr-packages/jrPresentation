globalVariables("lines")
#' @importFrom crayon red blue green yellow
cross = clisymbols::symbol$cross
tick = clisymbols::symbol$tick
bullet = clisymbols::symbol$bullet

#' Convert RMD to HTML
#'
#' If the slides are not runtime shiny, the filename is passed to
#'  \code{rmarkdown::render}.
#'
#' This could be run in parallel, but currently isn't
#' @param fname Filename
#' @export
build_slide = function(fname) {
  check_slides_title()
  check_graphics_paths()


  yaml = rmarkdown::yaml_front_matter(fname)
  if (!is.null(yaml$runtime)) {
    message("Can't build Shiny slides")
    return(invisible(NULL))
  }

  # This is a bit hacky
  # Need to render in the global environment, as S4 classes weren't able to be created
  # However, want to maintain indpendence of chapters
  # Not sure if this will work if run in parallel
  old_vars = ls(envir = globalenv())
  rmarkdown::render(fname, envir = globalenv())
  new_vars = ls(envir = globalenv())
  new_vars = new_vars[!(new_vars %in% old_vars)]
  rm(list = new_vars, envir = globalenv())
}
