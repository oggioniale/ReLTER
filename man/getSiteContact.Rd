% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getSiteContacts.R
\name{getSiteContact}
\alias{getSiteContact}
\title{eLTER getSiteContact function}
\usage{
getSiteContact(deimsid)
}
\arguments{
\item{deimsid}{A `character`. It is the DEIMS iD of network make from DEIMS-SDR website. More information about DEIMS iD in this \href{https://deims.org/docs/deimsid.html}{page}.}
}
\value{
The output of the function is a `tibble` with main features of the site and the contact information, such as: site manager, operation organaization, metadata provider, founding agency and site url.
}
\description{
This function allows to obtain the contact information of the eLTER site througth the DEIMS-SDR sites API.
}
\examples{
tSiteContact <- getSiteContact(deimsid = 'https://deims.org/17210eba-d832-4759-89fa-9ff127cbdf6e')
tSiteContact

}
\author{
Alessandro Oggioni, phD (2020) \email{oggioni.a@irea.cnr.it}
}
