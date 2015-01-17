complete <- function(directory, id = 1:332) 
{

	 if(grep("specdata", directory) == 1) {
        directory <- ("./specdata/")
    }
	
	n<-c()
	allFiles = as.character(list.files(directory))
	filePaths = paste(directory,allFiles,sep="")

for(i in id)
	{
		currentFile <- read.csv(filePaths[i], header=T, sep=",")
		n<-c(n,nobs =sum(complete.cases(currentFile)))
		
		
}

	
	return(data.frame(id,nobs=n))



}