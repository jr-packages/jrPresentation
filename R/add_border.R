#' @title Add Border to Slides
#' @description Functions to add a header, footer or both.
#' @param inverse Default FALSE; should we use the inverse theme?
#' @export
add_border = function(inverse = FALSE) {
  paste(add_header(inverse),
        add_footer(inverse), sep = "\n")
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
    html = '<div class="jr-footer"><span>&copy; 2017 Jumping Rivers (jumpingrivers.com)</span></div>'
  } else {
    html = '<div class="jr-footer-inverse"><span>&copy; 2017 Jumping Rivers (jumpingrivers.com)</span></div>'
  }
  html
}



