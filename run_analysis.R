run_analysis<-function(){
#this function downloads and unzips a file from
#"http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

#it merges the training and test data
#extracts the mean and std deviation for each measurement
#creates a dataset with appropriate activity and data names for the values

#from that dataset, creates a 2nd, independent

#Merges the training and the test sets to create one data set.
#Extracts only the measurements on the mean and standard deviation for each measurement. 
#Uses descriptive activity names to name the activities in the data set
#Appropriately labels the data set with descriptive variable names. 
#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
	library(reshape2)
	library(R.utils)

	#create the directory
	if(!file.exists("data")){dir.create("data")}
	
	src<-"http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
	dest<-"./data/dFile.zip"

	#download the data
	if(!file.exists(dest)){
		download.file(src,destfile=dest)
	}

	#unzip the data	
	con<-unzip(dest)
	
	#create the bound label table, this contrains the activity labels which will
	#correspond to the bound tables
	aLbl<-rbind(read.table(con[16]),read.table(con[28]))
	lbl<-read.table(con[1])

	#this contains the activity numbers
	totalLbl<-merge(aLbl,lbl,by.x="V1",by.y="V1",all=TRUE,sort=FALSE) 

	#this contains the subjects
	subjLbl<-rbind(read.table(con[14]),read.table(con[26]))
	
	#the features (column headers)
	featureLbl<-read.table(con[2])	


	output<-rbind(read.table(con[15]),read.table(con[27]))

	#for (i in 1:8){
	#	output<-cbind(output,apply(rbind(read.table(con[5+i]),read.table(con[17+i])),1,mean),
	#				apply(rbind(read.table(con[5+i]),read.table(con[17+i])),1,sd))
#
#	}
	output<-cbind(subjLbl,totalLbl[2],output)
	output<-data.frame(output)

	colnames(output)<-c("Subject","Activity",as.vector(featureLbl[,2]))

	means<-output[,grepl("mean",colnames(output))]
	stds<-output[,grepl("std",colnames(output))]
	
	nOut<-cbind(output[,1:2],means,stds)

	mtData<-melt(nOut,id<-1:2,measure.vars=3:81)
	out<-dcast(mtData,Subject~variable*Activity,mean)
out

	
	
		


}
