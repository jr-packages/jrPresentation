#' @title Add Border to Slides
#' @description Functions to add a header, footer or both.
#' @param inverse Default FALSE; should we use the inverse theme?
#' @param background_image Default \code{NULL}
#' @param background_size Default \code{NULL}. Options include "cover"
#' @export
add_border = function(inverse = FALSE,
                      background_image = NULL,
                      background_size= NULL) {
  txt = "layout: true"

  if (!is.null(background_image)) {
    image = paste0("background-image: url(", background_image, ")")
    txt = paste(txt, image, sep = "\n")
  }

  if (!is.null(background_size)) {
    size = paste0("background-size: ", background_size)
    txt = paste(txt, size, sep = "\n")
  }
  if (!is.null(inverse)) {
    txt = paste(txt, add_header(inverse), add_footer(inverse), sep = "\n")
  }
  txt
}

#' @rdname add_border
#' @export
add_header = function(inverse = FALSE) {
  # nolint start
  if (!inverse) {
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
  # nolint end
}

#' @rdname add_border
#' @export
add_footer = function(inverse = FALSE) {
  # nolint start
  year = strsplit(as.character(Sys.Date()), split = "-")[[1]][1]
  url = paste0("<div>", zzz$url, "</div>")
  if (!inverse) {
    html = paste0('<div class="jr-footer"><span>&copy; ', year, ' Jumping Rivers (jumpingrivers.com)</span>', url, '</div>')
  } else {
    html = paste0('<div class="jr-footer-inverse"><span>&copy; ', year, ' Jumping Rivers (jumpingrivers.com)</span>', url, '</div>')
  }
  html
  # nolint end
}

#' @rdname add_border
#' @export
add_page_number = function() {
  "<div>
    <style type='text/css' scoped>
        .remark-slide-number {display:block;}
    </style>
  </div>"
}