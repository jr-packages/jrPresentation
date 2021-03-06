#' Presentation author and twitter handle
#'
#' Returns a nicely formatted name and twitter handle.
#' @param user By default grabs the system name and matches user.
#' @examples
#' get_author(user = "ncsg3")
#' @export
get_author = function(user = NULL) {
  if (is.null(user))
    user = Sys.info()["user"]
  if (user %in% c("ncsg3", "colin")) {
    "Colin Gillespie ([\\@csgillespie](https://twitter.com/csgillespie))"
  }
  else if (user == "jamie") {
    "Jamie Owen ([\\@jamieRowen](https://twitter.com/jamieRowen))"
  }
  else if (user == "theo") {
    "Theo Roe ([\\@theoJRivers1](https://twitter.com/theoJRivers1))"
  }
  else if (user == "rmn") {
    "Roman Popat ([\\@rmnppt](https://twitter.com/rmnppt))"
  }
  else if (user == "rhian") {
    "Rhian Davies ([\\@trianglegirl](https://twitter.com/trianglegirl))"
  }
  else if (user == "john")
    "John McIntyre"
  else {
    "Jumping Rivers ([\\@jumping_uk](https://twitter.com/jumping_uk))"
  }
}
