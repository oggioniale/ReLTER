#' @title eLTER_getSiteContact
#' @description This function allows to obtain the contact information of the eLTER site througth the DEIMS-SDR sites API.
#' @param deimsid
#' @return The output of the function is a tibble with main features of the site and the contact information, such as: site manager, operation organaization, metadata provider, founding agency and site url.
#' @author Alessandro Oggioni, phD (2020) <oggioniale@gmail.com>
#' @import jsonlite
#' @export
#' @examples
#' getSiteContact(deimsid = 'https://deims.org/17210eba-d832-4759-89fa-9ff127cbdf6e')
#'
### function getSiteContact
getSiteContact <- function(deimsid) {
  q = '{title: .title,
       uri: "\\(.id.prefix)\\(.id.suffix)",
       geoCoord: .attributes.geographic.coordinates,
       country: .attributes.geographic.country,
       geoElev: .attributes.geographic.elevation,
       generalInfo: .attributes.contact
      }'
  url <- paste0("https://deims.org/", "api/sites/", substring(deimsid, 19))
  export <- httr::GET(url = url)
  jj <- httr::content(export, "text")
  contact <- tibble::as_tibble(do_Q(q, jj))
  contact
}