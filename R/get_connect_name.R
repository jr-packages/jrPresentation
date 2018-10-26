#' Function to return slide name for connect
#'
#' Should only be used in a Makefile in slides directory
#'
#' @export
get_connect_name = function(){
  name = basename(dirname(getwd()))
  name = gsub("notes","slides",name)
  name
}