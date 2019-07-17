# TODO: PASS as arguments
#' @title Set knitr Options
#'
#' @description In the future, pass the options as arguments.
#' @param page_numbers Boolean Add page numbers to the slides
#' @param url Character (default "") optional link to package
#' @export
set_presentation_options = function(page_numbers = FALSE, url = "") {
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
    dev = "svg"
  )
  set.seed(2016)
  options(dplyr.print_min = 4,
          dplyr.print_max = 4,
          digits = 3)

  welcome_dir = system.file("example/",  package = "jrPresentation")
  fname = file.path(welcome_dir, "style.css")
  css = paste(readLines(fname), collapse = "\n")

  if (page_numbers && nchar(url) > 0) {
    message("Can't display both page numbers and url - pick one greedy.")
    message("Just displaying page numbers")
    url = ""
  }

  if (!page_numbers) {
    css = paste(css, ".remark-slide-number {display:none;}", sep = "\n")
  }
  con = file("style.css", "w"); on.exit(close(con))
  cat(css, file = con, append = FALSE)

  zzz$url = url
  invisible(NULL)

}
