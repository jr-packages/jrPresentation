#' @rdname create_site_yml
#' @param clean Should we clean up?
#' @param user Connect user. Default \code{Sys.getenv("JR_CONNECT_USER")}
#' @export
#' @importFrom rsconnect deploySite
upload_slides = function(clean = TRUE,
                         user = Sys.getenv("JR_CONNECT_USER")) {
  if(clean) on.exit(clean_site())
  get_connect_template()
  create_site_yml()
  rsconnect::deploySite(getwd(),
                        get_connect_name(),
                        user,
                        render = "local")

}

#' Function to return slide name for connect
#'
#' Should only be used in a Makefile in slides directory
#'
#' @export
get_connect_name = function(){
  git_config = file("../.git/config")
  on.exit(close(git_config))
  l = readLines(git_config)
  git_url = l[grep(pattern = "\turl", l) ]
  pkg = stringr::str_match(git_url, "course_notes/(.*)/(.*)_notes.git")
  pkg = pkg[,length(pkg)]
  pkg
}

#' Copy the index.Rmd template for the connect back up to local directory
#'
#' Should only be used in a Makefile in slides directory
#'
#' @export
get_connect_template = function() {
  file = system.file("home_template.Rmd", package = "jrPresentation")
  # Index does not exist
  if(!file.exists("index.Rmd")) {
    file.copy(file, "index.Rmd")
    message("Updated index.Rmd")
    return(TRUE)
  }

  # Check if index is home_template
  index = readLines("index.Rmd")
  home_temp = readLines(file)

  if(index[[2]] == home_temp[[2]]) {
    file.copy(file, "index.Rmd")
    message("Updated index.Rmd")
    return(TRUE)
  }
  message("index.Rmd not updated. Delete if you want to update")
  return(FALSE)
}

#' Create site yaml for connect
#'
#' Should only be used in a Makefile in slides directory
#'
#' @importFrom stringr str_to_title
#' @export
create_site_yml = function() {
  chapters = list.files(pattern = "chapter(.*)\\.Rmd$")
  chapters = chapters[grepl("chapter", chapters)]
  html = gsub("Rmd", "html",chapters)
  labels = gsub(".Rmd", "", chapters)
  labels = gsub("([a-z])([0-9])", "\\1 \\2", labels)
  labels = stringr::str_to_title(labels)

  # Try to get title
  if(file.exists("chapter1.Rmd")) {
    chapter1 = readLines("chapter1.Rmd")[[2]]
    title = stringr::str_match(chapter1, 'title: "(.*)"')[1,2]
  } else if(file.exists("index.Rmd")) {
    index = readLines("index.Rmd")[[2]]
    title = stringr::str_match(index, 'title: "(.*)"')[1,2]
  } else {
    title = "R Course"
  }
  content = paste0("    - text: \"",labels,"\"\n      href: ",html, collapse = "\n")
  site = paste0(
    'name: "Slides"
navbar:
  title: "', title, '"
  left:
',content
  )
  cat(site, file = "_site.yml")
}

#' @rdname create_site_yml
#' @importFrom digest digest
#' @importFrom rmarkdown clean_site
#' @export
clean_site = function() {
  rmarkdown::clean_site(getwd())
  file.remove("_site.yml")
  index = digest::digest(readLines("index.Rmd"))
  file = system.file("home_template.Rmd", package = "jrPresentation")
  home_temp = digest::digest(readLines(file))
  # WhyR has only index.Rmd, so don't delete
  # Use a hash as a quick comparison
  if(index == home_temp) file.remove("index.Rmd")
}

