#' read nve data
#'
#' This function read the HBV format data and return a zoo object.
#' @param fileName file to read.
#' @param na.rm if remove the null values, "NULL" not include, "NA" eller "any"; default is "NULL"
#' @keywords data
#' @export
#' @examples
#' readSima_disc(fileName = "data/dew_00400000.out", na = "NULL", skip = 1)

readSima_disc <- function(fileName, na = "NULL", skip = 1) {
	if ( ! require(zoo) )        { install.packages("zoo");        library(zoo) }
	ObsRunoff <- read.table(fileName, header = FALSE, skip = skip, sep = ",")
	ObsRunoff[which(ObsRunoff[,2] == -9999),2] <- NA
	ObsDates <- as.Date(ObsRunoff[,1], format = "%Y.%m.%d 12:00")
	ObsRunoffZoo <- zoo(ObsRunoff[,2], ObsDates)
	if (na == "NULL") {
	  removeNULL <- which(is.na(ObsRunoffZoo))
	  if (length(removeNULL) == 0) {
	    return(ObsRunoffZoo)
	  } else {	
		ObsRunoffZoo <- ObsRunoffZoo[-removeNULL]
	  }
	} else if (na == "NA") {
		ObsRunoffZoo <- ObsRunoffZoo
	} else {
		ObsRunoffZoo[which(is.na(ObsRunoffZoo))] <- na
	}
	return(ObsRunoffZoo)
}
