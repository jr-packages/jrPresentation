#' Set a nice par
#'
#' @description Colin's wonderful setnicepar functions for sexy base graphics
#' @param mar See \code{?par}
#' @param mgp See \code{?par}
#' @param tck See \code{?par}
#' @param cex.axis See \code{?par}
#' @param las See \code{?par}
#' @param mfrow See \code{?par}
#' @param ... Additional arguments passed to \code{par}
#' @examples
#' plot(1:10)
#' setnicepar()
#' plot(1:10)
#' @importFrom graphics par
#' @export
setnicepar = function(mar=c(3,3,2,1),
                      mgp=c(2,0.4,0), tck=-.01,
                      cex.axis=0.9, las=1, mfrow=c(1,1),...) {
  par(mar=mar,
      mgp=mgp,
      tck=tck,
      cex.axis=cex.axis,
      las=las,
      mfrow=mfrow,...)
}



