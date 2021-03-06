% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mapNetworkPoint.R
\name{mapNetworkPoint}
\alias{mapNetworkPoint}
\title{eLTER mapNetworkPoint function}
\usage{
mapNetworkPoint(networkDEIMSID, countryCode)
}
\arguments{
\item{countryCode}{A `character` follow the SO 3166-1 alpha-3 codes. This ISO convention are three-letter country codes defined in ISO 3166-1, part of the ISO 3166 standard published by the International Organization for Standardization (ISO), to represent countries, dependent territories, and special areas of geographical interest. The map produced by this function will be limited only to the contry indicated in this parameter, if the network has a extraterritorial sites those will not represented.}
}
\value{
The output of the function is a tmap plot containing an image of geographic distribution of the network sites present in the chosen country.
}
\description{
This function provide a map (image) of site LTER network started from DEIMS iD of network.
}
\examples{
map <- mapNetworkPoint(networkDEIMSID = 'https://deims.org/network/7fef6b73-e5cb-4cd2-b438-ed32eb1504b3', countryCode = 'ITA')
print(map)

}
\author{
Alessandro Oggioni, phD (2020) \email{oggioni.a@irea.cnr.it}
}
