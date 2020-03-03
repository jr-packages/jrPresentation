#' @title Create a feedback slide
#'
#' @description Copies the feedback slide template to the current WD. This feedback
#' slide will look for the config questionnaire item
#' @export
create_feedback = function() {
  feedback = system.file("feedback/feedback.Rmd", package = "jrPresentation")
  file.copy(feedback, to = "./feedback.Rmd", overwrite = TRUE)
}


#' @title feedback slide
#'
#' @description Knits the feeedback stub template into the current slides
#'
#' @importFrom knitr knit_child
#' @export
include_feedback = function(){
  feedback = system.file("feedback/feedback_stub.Rmd", package = "jrPresentation")
  knitr::knit_child(feedback, quiet=TRUE, options = list(results = "asis"))
}