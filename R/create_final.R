#' Performs the checks
#'
#' Calls a bunch of checks to ensure great slides!
#' @export
create_final = function() {
  check_slides_title()
  check_graphics_paths()
  check_code_style()
  msg_info("Remember to use 'make connect' to create a back-up")

  return(invisible(NULL))
}

#' Performs the checks on python in venv
#'
#' Calls a bunch of checks to ensure great slides!
#' @export
create_final_python = function() {
  jrNotes::provision_venv("slides")
  create_final()
}
