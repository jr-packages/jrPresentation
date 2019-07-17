#' @title Create a feedback slide
#'
#' @description Copies the feedback slide template to the current WD. This feedback slide will look for the config questionnaire item
#'
#' @export
create_feedback = function(){
  feedback = system.file("feedback/feedback.Rmd", package = "jrPresentation")
  file.copy(feedback, to = "./feedback.Rmd", overwrite = TRUE)
}