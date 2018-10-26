#' Presentation user_name for rstudio connect
#'
#' Returns a nicely formatted name and twitter handle.
#' @param user By default grabs the system name and matches user.
#' @examples
#' get_user(user = "ncsg3")
#' @export
get_user = function (user = NULL) {
  if (is.null(user))
    user = Sys.info()["user"]
  if (user %in% c("ncsg3", "colin")) {
    "colin"
  }
  else if (user == "jamie") {
    "u450" # TODO update this once seb back with my user on rstudio connect
  }
  # TODO add theo
}
