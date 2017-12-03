library(reshape2)
library(plyr); library(dplyr)

run_analysis <- function() {
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile="Dataset.zip")
  unzip("Dataset.zip", exdir="courseproject")

  # Set up our working directory
  workdir <- "./courseproject/UCI HAR Dataset"
  homedir <- getwd()
  setwd(workdir)

  # Read in our column names
  colnames <- read.table("features.txt")
  colnames <- colnames$V2
  
  # Read and filter our X data
  xtrain <- read.table("train/X_train.txt", col.names=colnames)
  xtest <- read.table("test/X_test.txt", col.names=colnames)
  x <- rbind(xtrain, xtest)
  x <- x[,grepl("\\.(mean|std)\\.", names(x))]
  
  # Set up and join the activities data
  ytrain <- read.table("train/y_train.txt", col.names=c("activityid"))
  ytest <- read.table("test/y_test.txt", col.names=c("activityid"))
  y <- rbind(ytrain, ytest)
  activityNames <- read.table("activity_labels.txt", col.names=c("activityid", "activityname"))
  y <- join(y, activityNames, by="activityid")
  x <- cbind(subset(y,,select = activityname), x)
  
  # Set up and join the subject data
  strain <- read.table("train/subject_train.txt", col.names=c("subject"))
  stest <- read.table("test/subject_test.txt", col.names=c("subject"))
  subj <- rbind(strain, stest)
  x <- cbind(subj, x)
  
  # Clean up the column names
  names(x) <- gsub("^t", "time.", names(x))
  names(x) <- gsub("^f", "freq.", names(x))
  names(x) <- gsub("std", "sdev", names(x))
  names(x) <- gsub("(\\w+)\\.(\\w+)\\.(\\w+)\\..*([XYZ]$)", "\\1.\\2.\\4.\\3", names(x), perl=TRUE)
  names(x) <- gsub("\\.\\.$", "", names(x))
  
  # Creates a second, independent tidy data set with the average of each variable for each activity and each subject
  x <- melt(x, id.vars=c("subject", "activityname"))
  names(x) <- gsub("variable", "sensorname", names(x))
  names(x) <- gsub("value", "sensorvalue", names(x))
  result <- ddply(x, .(subject, activityname, sensorname), summarize, sensormean=mean(sensorvalue, na.rm=TRUE))

  
  # return to our original directory and write out our result
  setwd(homedir)
  write.table(result, "tidy.tbl")
  
  # return our final dataset
  result
}