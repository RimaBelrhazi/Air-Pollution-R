pollutantmean <- function(directory, pollutant,id = 1:332)

{

## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

## 'pollutant' is a character vector of length 1 indicating
## the name of the pollutant for which we will calculate the
## mean; either "sulfate" or "nitrate".

## 'id' is an integer vector indicating the monitor ID numbers
## to be used


## Return the mean of the pollutant across all monitors list
## in the 'id' vector (ignoring NA values)


	        if(grep("specdata", directory) == 1) {
        directory <- ("./specdata/")
    }
	
	meanP <- c()
	
	allFiles = as.character(list.files(directory))
	filePaths = paste(directory,allFiles,sep="")
	

	
	for(i in id)
	{
		currentFile <- read.csv(filePaths[i], header=T, sep=",")
      	na_removed <- na.omit(currentFile[,pollutant])   
		meanP <- c(meanP, na_removed)

		
}
	result <- mean(meanP)
      return(round(result, 3)) 
}


## tests
## pollutantmean("specdata", "sulfate", 1:10) == 4.064
## pollutantmean("specdata", "nitrate", 70:72) == 1.706
## pollutantmean("specdata", "nitrate", 23) == 1.281