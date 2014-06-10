## This script implements the Course Project for the Johns Hopkins Data Science course: "Getting and Cleaning Data"
## Author: Amar Gupta

## Read in data for training set 
x_train = read.table("UCI HAR Dataset/train/X_train.txt")
y_train = read.table("UCI HAR Dataset/train/y_train.txt")
subject_train = read.table("UCI HAR Dataset/train/subject_train.txt")

## Read in data for testing set
x_test = read.table("UCI HAR Dataset/test/X_test.txt")
y_test = read.table("UCI HAR Dataset/test/y_test.txt")
subject_test = read.table("UCI HAR Dataset/test/subject_test.txt")

## Read in data for row labels
activity_labels = read.table("UCI HAR Dataset/activity_labels.txt", colClasses = c("integer", "character"))

## Read in data for column labels and reduce to names
column_names = read.table("UCI HAR Dataset/features.txt", colClasses = c("integer", "character"))
column_names = column_names[, 2]

## Build data frames combining elements above
traindf = data.frame(subject_train, y_train, x_train)
testdf = data.frame(subject_test, y_test, x_test)

## Rename columns in data frame to be more descriptive
colnames(traindf) = c("subject", "activity", column_names)
colnames(testdf) = c("subject", "activity", column_names)

## Combine dataframes
combineddf = rbind(traindf, testdf)

## Filter out irrelevant columns; specifically, those that don't include mean() or std() in their name
colstokeep = c(1, 2, grep("-std|-mean", column_names) + 2)
combineddf = combineddf[, colstokeep]

## Rewrite activity values with actual labels
combineddf = merge(combineddf, activity_labels, by.x = "activity", by.y = "V1")
combineddf["activity"] = combineddf["V2"]
combineddf = combineddf[, 1:(ncol(combineddf) - 1)]

## Rework column names for readability
column_names = colnames(combineddf)
column_names = gsub("\\(\\)", "", column_names)
column_names = gsub("^f", "Frequency", column_names)
column_names = gsub("^t", "Time", column_names)
column_names = gsub("BodyBody", "Body", column_names)
colnames(combineddf) = column_names

## Create second dataset that is tidy

## Load reshape2 library in case it's not available
library(reshape2)

## Melt and dcast data
temp = melt(combineddf, measure.vars = column_names[3:length(column_names)], id = c("subject", "activity"))
tidyds = dcast(temp, subject + activity ~ variable, mean)

## Output second dataset
write.table(tidyds, file = "tidyds.csv", row.names = FALSE, sep = ",")