#' @export
create_feedback = function(){
  feedback = system.file("feedback/feedback.Rmd",package="jrPresentation")
  file.copy(feedback, to = "./feedback.Rmd", overwrite = TRUE)
}