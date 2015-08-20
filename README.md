# Getting and Cleaning Data - Course Project

# Description

The goal of this project demonstrates how the raw data processed and scripted to produce the tidy data which can be used in analysis of  study or research projects later. There are also another two files in this repo: run_analysis.R and CodeBook.md. The run_analysis.R file contains all codes to perform the analyses described in the 5 sections. The CodeBook.md file describes the variables, the data, and any transformations or work that was performed to clean up the data. The codebook of this project are not used the files in the Inertial Signals folders. See the README.txt file for the detailed information on the dataset. The files that are used to load data are included in the followings:
.test/subject_test.txt  
.test/X_test.txt  
.test/y_test.txt  
.train/subject_train.txt  
.train/X_train.txt  
.train/y_train.txt  
Additional information about the variables, data and transformations can be found in the course project of the Johns Hopkins [Getting and Cleaning Data course.](https://www.coursera.org/course/getdata)

# Project Summary

To build a tidy data sets, R script- run_analysis.R is created that does the following procedures. 1. Merges the training and the test sets to create one data set. 2. Extracts only the measurements on the mean and standard deviation for each measurement. 3. Uses descriptive activity names to name the activities in the data set 4. Appropriately labels the data set with descriptive activity names. 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
