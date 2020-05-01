library(reshape2)

## step 0 => Download and extracting the zip file
# Download the file
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipfile <- "Data.zip"
datadir <- "UCI HAR Dataset"

if(!file.exists(zipfile)){
    download.file(url, destfile = zipfile , method = "curl") 
}

# Unzip the file
if(!file.exists(datadir)){
    unzip(zipfile, files = NULL, exdir=".")
}

## step 1=> Merges the training and the test sets to create one data set.
features_infoData <- read.table(paste(datadir,"/features.txt",sep=""),header = F, sep = "")
colnames(features_infoData) <- c("feature_id", "feature_name")

X_trainData <- read.table(paste(datadir,"/train/X_train.txt",sep=""),header = F, sep = "")
X_testData <- read.table(paste(datadir,"/test/X_test.txt",sep=""),header = F, sep = "")
Y_trainData <- read.table(paste(datadir,"/train/y_train.txt",sep=""),header = F, sep = "")
Y_testData <- read.table(paste(datadir,"/test/y_test.txt",sep=""),header = F, sep = "")
mergedDataset <- rbind(X_trainData, X_testData)

## step 2 => Extracts only the measurements on the mean and standard deviation for each measurement.
mean_std_features <- features_infoData[grep("mean\\(\\)|std\\(\\)",features_infoData$feature_name),1]
mergedDataset <- mergedDataset[,mean_std_features]

## step3 => Uses descriptive activity names to name the activities in the data set 
activities <- rbind(Y_trainData, Y_testData)
colnames(activities) <- c("activity_id")
activities$activity <- sapply(activities$activity_id, function(x) {activity_labelsData[activity_labelsData$activity_label_id == x,2]})
mergedDataset <- cbind(activities$activity, mergedDataset)

## step 4 => Appropriately labels the data set with descriptive variable names.
subject_trainData <- read.table(paste(datadir,"/subject_train.txt",sep=""),header = F, sep = "")
subject_testData <- read.table(paste(datadir,"/subject_test.txt",sep=""),header = F, sep = "")
subjects <- rbind(subject_trainData,subject_testData)
colnames(subjects) <- c("subject_id")
mergedDataset <- cbind(subjects, mergedDataset)

mean_std_features_name <- features_infoData[grep("mean\\(\\)|std\\(\\)",features_infoData$feature_name),2]
colnames(mergedDataset) <- c("subject","activity", as.character(mean_std_features_name))


## step 5 => From the data set in step 4, creates a second, independent tidy data set with the average
## of each variable for each activity and each subject.
meltedData <- melt(mergedDataset, id.vars = c("subject", "activity"))
tidydata <- dcast(meltedData, subject+activity ~ variable, mean)
write.table(tidydata, "tidydata.txt", sep = ",", row.name=FALSE)