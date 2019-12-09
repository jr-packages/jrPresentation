globalVariables("chapter")
#' @importFrom stringr str_detect str_match str_replace_all str_trim str_replace
clean_string = function(string) {
  string = str_replace_all(string, '"', "")
  string = str_trim(string)
  string
}

check_slides_title = function() {
  msg = glue::glue("{bullet} Checking slides title...check_slides_titles()")
  message(yellow(msg))

  has_error = FALSE
  notes_chapters = sort(list.files(path = "../notes/", pattern = "^chapter?.\\.Rmd$"))
  slides_chapters = sort(list.files(path = ".", pattern = "^chapter?.\\.Rmd$"))

  if (length(slides_chapters) != length(notes_chapters)) {
    stop("Different numbers of chapters in notes/ and slides/", call. = FALSE)
  }
  if (!all(slides_chapters %in% notes_chapters)) {
    stop("Different chapters in notes/ and slides/", call. = FALSE)
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
      if (!has_error) message(red("Slides / notes title differ"))
      msg = glue::glue("  {cross} {fname}: {slide_title} vs {notes_title}")
      message(red(msg))
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
    if (slide_subtitle != paste("Chapter", i)) {
      msg = glue::glue("  {cross}{fname} the subtitle should be Chapter {i}")
      message(red(msg))
      has_error = TRUE

    }
  }
  if (has_error) stop(call. = FALSE)

  msg = glue::glue("{tick} Titles look good!")
  message(yellow(msg))
  return(invisible(NULL))
}
