globalVariables("chapter")
#' @importFrom stringr str_detect str_match str_replace_all str_trim str_replace
clean_string = function(string) {
  string = str_replace_all(string, '"', "")
  string = str_trim(string)
  string
}

check_slides_title = function() {
  msg_start("Checking slides title...check_slides_titles()")
  has_error = FALSE
  notes_chapters = sort(list.files(path = "../notes/", pattern = "^chapter?.\\.Rmd$"))
  slides_chapters = sort(list.files(path = ".", pattern = "^chapter?.\\.Rmd$"))

  if (length(slides_chapters) != length(notes_chapters)) {
    msg_error("Different numbers of chapters in notes/ and slides/", stop = TRUE)
  }
  if (!all(slides_chapters %in% notes_chapters)) {
    msg_error("Different chapters in notes/ and slides/", stop = TRUE)
  }

  chapter = slides_chapters[5]
  for (i in seq_along(slides_chapters)) {
    fname = slides_chapters[i]
    slide_title = readLines(fname)
    slide_title = slide_title[str_detect(slide_title, "^title:")]
    slide_title = str_match(slide_title, ":(.*)")[, 2]
    slide_title = clean_string(slide_title)

    notes_title = readLines(file.path("../notes/", fname))
    notes_title = notes_title[str_detect(notes_title, "^# .*")][1]
    notes_title = str_match(notes_title, "^# (.*)")[, 2]
    notes_title = str_replace(notes_title, pattern = "\\{.*\\}", "") # remove labels
    notes_title = clean_string(notes_title)
    if (notes_title != slide_title) {
      if (!has_error) msg_error("Slides / notes title differ")
      msg_error(glue::glue("{fname}: {slide_title} vs {notes_title}"), indent = 2)
      has_error = TRUE
    }
  }

  i = 1
  for (i in seq_along(slides_chapters)) {
    fname = slides_chapters[i]
    slide_subtitle = readLines(fname)
    slide_subtitle = slide_subtitle[str_detect(slide_subtitle, "^subtitle:")]
    slide_subtitle = str_match(slide_subtitle, ":(.*)")[, 2]
    slide_subtitle = clean_string(slide_subtitle)
    if (length(slide_subtitle) == 0 || slide_subtitle != paste("Chapter", i)) {
      msg = glue::glue("{fname} the subtitle should be Chapter {i}")
      msg_error(msg, indent = 2)
      has_error = TRUE
    }
  }
  if (has_error) stop(call. = FALSE)
  msg_ok("Titles look good!")
  return(invisible(NULL))
}
