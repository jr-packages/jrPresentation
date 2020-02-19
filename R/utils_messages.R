info = clisymbols::symbol$info
cross = clisymbols::symbol$cross
tick = clisymbols::symbol$tick
circle_filled = clisymbols::symbol$circle_filled
bullet = clisymbols::symbol$bullet

red = crayon::red
blue = crayon::blue
yellow = crayon::yellow
green = crayon::green

msg_error = function(msg, indent = 0, stop = FALSE) {
  indent = ifelse(indent == 0, "", rep(" ", indent))
  if (isFALSE(stop)) {
    message(glue::glue_col("{indent}{red}{cross} {msg}"))
  } else {
    stop(glue::glue_col("{indent}{red}{cross} {msg}"), call. = FALSE)
  }
}

msg_start = function(msg, indent = 0) {
  indent = ifelse(indent == 0, "", rep(" ", indent))
  message(glue::glue_col("{indent}{yellow}{circle_filled} {msg}"))
}

msg_ok = function(msg, indent = 0) {
  indent = ifelse(indent == 0, "", rep(" ", indent))
  message(glue::glue_col("{indent}{green}{tick} {msg}"))
}

msg_info = function(msg, indent = 0) {
  indent = ifelse(indent == 0, "", rep(" ", indent))
  message(glue::glue_col("{indent}{blue}{info} {msg}"))
}
