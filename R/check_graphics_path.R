
check_graphics_paths = function() {
  msg_start("Checking graphics path...check_graphics_paths()")

  if (!fs::file_exists("graphics")) {
    fs::link_create("../graphics", "graphics", symbolic = TRUE)
  }

  has_error = FALSE
  fnames = list.files(pattern = "^chapter?.\\.Rmd$")
  for (fname in fnames) {
    out = readLines(fname)
    detect = stringr::str_detect(out, "../graphics/")
    if (sum(detect) > 0L) {
      lines = paste(which(detect), collapse = ", ")
      if (!has_error) msg_error("Change '../graphics/ to graphics in paths. See lines: ")
      msg = glue::glue("{lines} in file {fname}")
      msg_error(msg, indent = 2)
      has_error = TRUE
    }
  }
  if (has_error) stop(call. = FALSE)
  msg_ok("Graphics paths look good!")

  return(invisible(NULL))
}
