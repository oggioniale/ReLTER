#' @title eLTER getSiteParameters function
#' @description This function allows to obtain the list of parameters measured in the eLTER site througth the DEIMS-SDR sites API.
#' @param deimsid A `character`. It is the DEIMS iD of network make from DEIMS-SDR website. More information about DEIMS iD in this \href{https://deims.org/docs/deimsid.html}{page}.
#' @return The output of the function is a `tibble` with main features of the site and the parameters collected by site.
#' @author Alessandro Oggioni, phD (2020) \email{oggioni.a@@irea.cnr.it}
#' @import tibble httr
#' @export
#' @examples
#' tSiteParameters <- getSiteParameters(deimsid = 'https://deims.org/f30007c4-8a6e-4f11-ab87-569db54638fe')
#' tSiteParameters
#'
### function getParameters
getSiteParameters <- function(deimsid) {
  q = '{title: .title,
       uri: "\\(.id.prefix)\\(.id.suffix)",
       geoCoord: .attributes.geographic.coordinates,
       country: .attributes.geographic.country,
       geoElev: .attributes.geographic.elevation,
       parameter: .attributes.focusDesignScale.parameters
      }'
  url <- paste0("https://deims.org/", "api/sites/", substring(deimsid, 19))
  export <- httr::GET(url = url)
  jj <- suppressMessages(httr::content(export, "text"))
  invisible(capture.output(parameters <- tibble::as_tibble(ReLTER::do_Q(q, jj))))
  if (!is.na(parameters$parameter)) {
    colnames(parameters$parameter[[1]]) <- c("parameterLabel", "parameterUri")
  } else {
    parameterLabel <- NULL
    parameterUri <- NULL
    parameters$parameter <- list(data.frame(parameterLabel, parameterUri))
  }
  parameters
}

