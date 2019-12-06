
check_graphics_paths = function() {
  msg = glue::glue("{bullet} Checking graphics path...check_graphics_paths()")
  message(yellow(msg))
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
      if (!has_error) message(red("Change '../graphics/ to graphics in paths. See lines: "))
      msg = glue::glue_col("  {cross} {lines} in file {fname}")
      message(red(msg))
      has_error = TRUE
    }
  }
  if (has_error) stop(call. = FALSE)
  msg = glue::glue("{tick} Graphics paths look good!")
  message(yellow(msg))
  return(invisible(NULL))
}
