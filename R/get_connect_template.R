#' Copy the index.Rmd template for the connect back up to local directory
#'
#' @export
get_connect_template = function(){
  file = system.file("home_template.Rmd",package = "jrPresentation")
  file.copy(file,"index.Rmd")
}