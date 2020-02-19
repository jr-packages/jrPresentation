check_r_style = function() {
  if (file.exists("config.yml") && isFALSE(config::get("lintr"))) {
    return(invisible(NULL))
  }
  msg_start("Checking code style...check_lint()")
  fnames = list.files(pattern = "^c.*Rmd$")
  bad_lints = FALSE
  for (i in seq_along(fnames)) {
    msg_start(glue::glue("Checking {fnames[i]}"), indent = 2)
    l = lintr::lint(fnames[i])
    if (length(l) > 0) {
      msg_error(paste(fnames[i], "\n"), indent = 2)
      print(l)
      bad_lints = TRUE
    }
    ## Check that library calls are correctly quoted
    ## library("XXX") not library(XXX) #nolint
    r = readLines(fnames[i])
    libraries = r[stringr::str_detect(r, "^library\\(.*\\)$")]
    is_quoted = stringr::str_detect(libraries, '"', negate = FALSE)
    if (any(!is_quoted)) {
      msg = paste0(clisymbols::symbol$cross, " Quote package names: ", libraries[!is_quoted],
                   collapse = "\n")
      message(red(msg))
      bad_lints = TRUE
    }
  }
  return(bad_lints)
}

check_python_style = function() {
  msg_start("Checking flake8...check_code_style()")
  if (!fs::file_exists("flake8.ini") && !fs::file_exists("flake8_config_Rmd.ini")) {
    msg_info("Missing flake8_config_Rmd.ini file - creating a default", indent = 2)
    flake8_ini_sys = system.file("", "flake8_config_Rmd.ini", package = "jrNotes", mustWork = TRUE)
    file.copy(flake8_ini_sys, to = "flake8_config_Rmd.ini", overwrite = TRUE)
  }
  fnames = list.files(pattern = "^c.*Rmd$")
  bad_lints = FALSE
  for (i in seq_along(fnames)) {
    msg_start(paste("Checking", fnames[i]), indent = 2)
    jrpytests = reticulate::import("jrpytests")
    jrpytests$runflake8rmdpychunks(filename = fnames[i])
  }
  return(bad_lints)
}

# @import jrNotes
# @importFrom jrNotes get_repo_language
check_code_style = function() {
  language = jrNotes::get_repo_language()
  if (language == "python") {
    bad_lints = check_python_style()
  } else {
    bad_lints = check_r_style()
  }

  if (bad_lints) {
    msg_error("Fix styling")
  }
  msg_ok("Linting looks good")
}



#' Lintr functions
#'
#' Run lintr on a vector of files. If \code{fnames} is \code{NULL}
#' then use the regular expression \code{^c.*Rmd$}. If
#' \code{config::get("lintr")} is \code{FALSE}, no lint used.
#' @importFrom lintr lint
#' @export
lint_slides = check_code_style

