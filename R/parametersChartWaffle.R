#' @title eLTER parametersChartWaffle function
#' @description This function allows to obtain a waffle chart of the parameter collected in a site or network grouped into compounds.
#' @param deimsid A `character`. It is the DEIMS iD of network make from DEIMS-SDR website. More information about DEIMS iD in this \href{https://deims.org/docs/deimsid.html}{page}.
#' @return The output of the function is a waffle chart.
#' @author Alessandro Oggioni, phD (2020) \email{oggioni.a@@irea.cnr.it}
#' @import dplyr graphics tibble scales grDevices RColorBrewer waffle
#' @export 
#' @examples
#' waffle <- parametersChartWaffle(deimsid = 'https://deims.org/f30007c4-8a6e-4f11-ab87-569db54638fe')
#' print(waffle)
#'
### function parametersChartWaffle
parametersChartWaffle <- function(deimsid) {
  # TODO add this by SPARQL query
  data(envThesParams)
  
  paramsDeims <- ReLTER::getSiteParameters(deimsid)
  paramsDeims <- tibble::as_tibble(paramsDeims$parameter[[1]])
  params <- tibble::as_tibble(paramsDeims)
  params$parameterGroups <- parametersStructureEnvThes$category[match(params$parameterLabel, parametersStructureEnvThes$parameter)]
  
  groupsIsNa <- params %>% dplyr::filter(is.na(parameterGroups))
  
  # plot of parameters
  params <- params %>% 
    dplyr::group_by(parameterGroups) %>% 
    dplyr::tally() %>%
    dplyr::mutate(freq = n / sum(n))
  params$label <- scales::percent(params$freq)
  obsPropWaffle <- params$n
  names(obsPropWaffle) <- params$parameterGroups
  
  # Waffle charth
  # TODO: verify because for some site (e.g. Moor House - Upper Teesdale) the UI provide this error: "Insufficient values in manual scale. 10 needed but only 9 provided."
  pieGraphPalette <- grDevices::colorRampPalette(RColorBrewer::brewer.pal(8, "Set2"))(nrow(params))
  p <- waffle::waffle(
    obsPropWaffle,
    rows = 8,
    size = 3, 
    xlab = paste0("1 square is 1 parameter. Total of ", sum(params$n), " parameters"), 
    keep = FALSE,
    colors = pieGraphPalette
  )
  print(p)
  # warning about the Insufficient values in manual scale and 
  if (length(groupsIsNa$parameterLabel) == 0) {
    message('')
  } else {
    message(
      'This parameters are not included, please contact the development of the package by GitHub.\n',
      'Paste this message into the GitHub issue.\n',
      'I am using the parametersChart function and need to add the following parameters in the mapping:\n',
      paste(groupsIsNa$parameterLabel, collapse = '\n')
    )
  }
}





