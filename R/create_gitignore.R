#' Create a default gitignore
#' @description Create a default gitignore
#' @export
create_gitignore = function() {
  example_dir = system.file("helper/",  package = "jrPresentation")
  from = file.path(example_dir, "gitignore")
  to = ".gitignore"
  file.copy(from, to)
  message(".gitignore created")
  invisible(from)
}