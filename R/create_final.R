#' Performs the checks
#'
#' Calls a bunch of checks to ensure great slides!
#' @export
create_final = function() {
  check_slides_title()
  check_graphics_paths()
  check_lint()
  return(invisible(NULL))
}
