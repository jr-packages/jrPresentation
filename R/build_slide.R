globalVariables("lines")

#'  Build all the slides and create virtualenv needed to do so
#'
#' @export
render = function() {
  jrNotes:::check_pkgs()
  jrNotes::provision_venv("slides")
  build_all()
}

build_all = function() {
  slides_chapters = sort(list.files(path = ".", pattern = "^chapter?.\\.Rmd$"))

  for (i in seq_along(slides_chapters)) {
    build_slide(slides_chapters[i])
  }
}

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

  if (!fs::file_exists("graphics")) {
    fs::link_create("../graphics", "graphics", symbolic = TRUE)
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
