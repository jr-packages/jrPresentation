#' Create Example Presentation
#' @description Copy example presentation to a directory specified by \code{path}
#' @param path A path where the presentation should be copied to.
#' @export
create_example = function(path = NULL) {
  if (is.null(path)) stop("Please specify a path", call. = FALSE)

  example_dir = system.file("example/",  package = "jrPresentation")
  if (path != "." && file.exists(path)) {
    stop(paste("Directory", path, "already exists"), call. = FALSE)
  }

  if (path != ".") dir.create(path, showWarnings = FALSE)
  fnames = list.files(example_dir, full.names = TRUE)
  sapply(fnames, file.copy, to = path, copy.mode = FALSE,  recursive = TRUE)
  invisible(path)
}
