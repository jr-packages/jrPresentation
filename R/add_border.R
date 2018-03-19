#' @title Add Border to Slides
#' @description Functions to add a header, footer or both.
#' @param inverse Default FALSE; should we use the inverse theme?
#' @param background_image Default \code{NULL}
#' @param background_size Default \code{NULL}. Options include "cover"
#' @export
add_border = function(inverse = FALSE, background_image = NULL, background_size= NULL) {
  txt = "layout: true"

  if(!is.null(background_image)) {
    image = paste0("background-image: url(", background_image, ")")
    txt = paste(txt, image , sep = "\n")
  }

  if(!is.null(background_size)) {
    size = paste0("background-size: ", background_size)
    txt = paste(txt, size , sep = "\n")
  }
  if(!is.null(inverse)) {
    txt = paste( txt, add_header(inverse), add_footer(inverse), sep = "\n")
  }
  txt
}

#' @rdname add_border
#' @export
add_header = function(inverse = FALSE){
  if(!inverse) {
    html = '
      <div class="jr-header">
        <img class="logo" src="assets/white_logo_full.png"/>
        <span class="social"><table><tr><td><img src="assets/twitter.gif"/></td><td> @jumping_uk</td></tr></table></span>
      </div>
      '
  } else {
    html = '
      <div class="jr-header-inverse">
        <img class="logo" src="assets/white_logo_full.png"/>
        <span class="social"><table><tr><td><img src="assets/twitter.gif"/></td><td> @jumping_uk</td></tr></table></span>
      </div>
      '
  }
  html
}

#' @rdname add_border
#' @export
add_footer = function(inverse = FALSE){
  if(!inverse) {
    html = '<div class="jr-footer"><span>&copy; 2018 Jumping Rivers (jumpingrivers.com)</span></div>'
  } else {
    html = '<div class="jr-footer-inverse"><span>&copy; 2018 Jumping Rivers (jumpingrivers.com)</span></div>'
  }
  html
}


