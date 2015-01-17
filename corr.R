corr <- function(directory, threshold = 0) {
	source("complete.R")
	corl <-c()
	
	if(grep("specdata", directory) == 1) {
        directory <- ("./specdata/")
    }

	allFiles = as.character(list.files(directory))
	filePaths = paste(directory,allFiles,sep="")

	R1 = complete(directory)
	R2 = R1[R1["nobs"]>threshold,]
	ids = R2$id
	

		for(i in ids)
	{
		currentFile <- read.csv(filePaths[i], header=T, sep=",")
		cf = currentFile[complete.cases(currentFile),]
		corl<-c(corl,cor(cf$sulfate,cf$nitrate))
		
		
}
	return(corl)

		
	}
