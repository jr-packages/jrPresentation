#' Create a default Makefile
#' @description Create a default Makefile
#' @export
create_makefile = function() {
  example_dir = system.file("helper/",  package = "jrPresentation")
  from = file.path(example_dir, "Makefile")
  to = "Makefile"
  file.copy(from, to)
  message("Makefile created")
  invisible(from)
}