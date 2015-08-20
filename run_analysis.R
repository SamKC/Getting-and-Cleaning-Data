## Clear the workspace
rm(list=ls())

## Set the working directory
setwd("C:/Users/giselle/Desktop/Coursera/DATA CLEANING/data/UCI HAR Dataset")

## Phase 1: Merge the training and test sets to create one data set
## Load data sets
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

## Concatenate each data set by rows
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

## Name the variables
names(y_data)<- c("activity")
names(subject_data)<-c("subject")
features <- read.table("features.txt")
names(x_data)<- features$V2

## Combine all data into one data frame
dataCombine <- cbind(subject_data, y_data)
Data <- cbind(x_data, dataCombine)

str(Data)
## Phase 2: Extract only the measurements on the mean and standard deviation for each measurement

## Extract only columns with its names: mean() or std()  
subFeatures <- features$V2[grep("mean\\(\\)|std\\(\\)", features$V2)]
selectedNames<-c(as.character(subFeatures), "subject", "activity" )
Data<-subset(Data,select=selectedNames)

str(Data)

## Phase 3: Use descriptive activity names to name the activities in the data set

Data$activity <- as.character(Data$activity)
Data$activity[Data$activity == 1] <- "WALKING"
Data$activity[Data$activity == 2] <- "WALKING_UPSTAIRS"
Data$activity[Data$activity == 3] <- "WALKING_DOWNSTAIRS"
Data$activity[Data$activity == 4] <- "SITTING"
Data$activity[Data$activity == 5] <- "STANDING"
Data$activity[Data$activity == 6] <- "LAYING"
Data$activity <- as.factor(Data$activity)
    
head(Data$activity,30)

## Phase 4: Appropriately label the data set with descriptive variable names
names(Data)<-gsub("^t", "time", names(Data))
names(Data)<-gsub("^f", "frequency", names(Data))
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))
names(Data)

## Phase 5: Create a second, independent tidy data set with the average of each variable
library(plyr)
Data2<-aggregate(. ~subject + activity, Data, mean)
Data2<-Data2[order(Data2$subject,Data2$activity),]
write.table(Data2, file = "tidydata.txt",row.name=FALSE)