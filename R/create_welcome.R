#' Create Example Presentation
#' @description Copy example presentation to a directory specified by \code{path}
#' @param path A path where the presentation should be copied to.
#' @export
create_welcome = function(path = ".") {

  welcome_dir = system.file("welcome/",  package = "jrPresentation")
  dir.create(path, showWarnings = FALSE)
  fnames = list.files(welcome_dir, full.names = TRUE)
  sapply(fnames, file.copy, to = path, copy.mode = FALSE,  recursive = TRUE)
  invisible(path)
}
