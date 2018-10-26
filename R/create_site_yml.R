#' Create site yaml for connect
#'
#' Should only be used in a Makefile in slides directory
#'
#' @export
create_site_yml = function(){
  chapters = list.files(pattern = "*.Rmd")
  chapters = chapters[grepl("chapter",chapters)]
  html = gsub("Rmd","html",chapters)
  labels = gsub(".Rmd","",chapters)
  labels = gsub("([a-z])([0-9])", "\\1 \\2",labels)
  labels = stringr::str_to_title(labels)

  content = paste0("    - text: \"",labels,"\"\n      href: ",html, collapse = "\n")

  site = paste0(
    'name: "Slides"
navbar:
  title: "Introduction to R"
  left:
',content
  )
  cat(site, file = "_site.yml")
}