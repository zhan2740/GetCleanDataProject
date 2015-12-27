#########packages required###################
if (!require("data.table")) { 
        install.packages("data.table") 
} 
if (!require("plyr")) { 
        install.packages("plyr") 
} 

library(data.table)
library(plyr) 

########1.Merges the training and the test sets to create one data set.
####Download the data and put the data in the "projectData" folder
if(!file.exists("./projectData")){
        dir.create("./projectData")
        }
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile = "./projectData/Dataset.zip") # window10, not use method="curl"
####Unzip the data
unzip(zipfile = "./projectData/Dataset.zip", exdir = "./projectData")
####list all the files
allFiles = list.files("./projectData/UCI HAR Dataset", recursive = TRUE)
allFiles
####read data into the variables
activityTest = read.table("./projectData/UCI HAR Dataset/test/Y_test.txt", header = FALSE)
subjectTest = read.table("./projectData/UCI HAR Dataset/test/subject_test.txt", header = FALSE)
featureTest = read.table("./projectData/UCI HAR Dataset/test/X_test.txt", header = FALSE)
activityTrain = read.table("./projectData/UCI HAR Dataset/train/Y_train.txt", header = FALSE)
subjectTrain = read.table("./projectData/UCI HAR Dataset/train/subject_train.txt", header = FALSE)
featureTrain = read.table("./projectData/UCI HAR Dataset/train/X_train.txt", header = FALSE)
####check the properties of the variables
str(activityTest)
str(subjectTest)
str(featureTest)
str(activityTrain)
str(subjectTrain)
str(featureTrain)
####combine the train and test data
subject = rbind(subjectTest, subjectTrain)
activity = rbind(activityTest, activityTrain)
feature = rbind(featureTest, featureTrain)
####give names to variables
names(subject) = c("subject"); head(subject)
names(activity) = c("activity"); head(activity) 
featureNames = read.table("./projectData/UCI HAR Dataset/features.txt", header = FALSE)
names(feature) = featureNames$V2
####combine col to get all data
sub8act = cbind(subject, activity)
allData = cbind(feature, sub8act)

########2. Extracts only the measurements on the mean and standard deviation for each measurement. 
####Extract the mean and standard deviation for each measurement
extract_featureNames <- grepl("mean\\(|std\\(", featureNames$V2)
dataMean = allData[,extract_featureNames]
str(dataMean)
dim(dataMean)

########3.Uses descriptive activity names to name the activities in the data set
activityLabel = read.table("./projectData/UCI HAR Dataset/activity_labels.txt", header = FALSE)[,2]
activityLabel
dataMean[,68] = activityLabel[dataMean[,68]]
str(dataMean)

########4. Appropriately labels the data set with descriptive variable names
names(dataMean)<-gsub("^t", "time", names(dataMean))
names(dataMean)<-gsub("^f", "frequency", names(dataMean))
names(dataMean)<-gsub("Acc", "Accelerometer", names(dataMean))
names(dataMean)<-gsub("Gyro", "Gyroscope", names(dataMean))
names(dataMean)<-gsub("Mag", "Magnitude", names(dataMean))
names(dataMean)<-gsub("BodyBody", "Body", names(dataMean))
names(dataMean)

########5.creates a second, independent tidy data set with the average of each variable for each activity and each subject.
outputData = aggregate(. ~subject + activity, dataMean, mean)
outputData = outputData[order(outputData$subject, outputData$activity),]
write.table(outputData, file = "tidydata.txt", row.name = FALSE)

