# This script will collect, work with, and clean a data set to make
# it tidy and usable for later analysis.

# Created by David Harter as the Getting and Cleaning Data course
# project.


# Libraries
library(dplyr)

# Download the data sets for use in R if they don't already exist.
if(!dir.exists("./Documents/Coursera/UCI HAR Dataset")) {
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata
              %2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, destfile = "wear.zip", method = "curl")
  unzip("wear.zip")
  }

# Set working directory to desired directory.
setwd("./Documents/Coursera/UCI HAR Dataset")

# Extract all datasets of interest for this project.
subtrain <- read.table("./train/subject_train.txt", header = F)
Xtrain <- read.table("./train/X_train.txt", header = F)
Ytrain <- read.table("./train/Y_train.txt", header = F)
subtest <- read.table("./test/subject_test.txt", header = F)
Xtest <- read.table("./test/X_test.txt", header = F)
Ytest <- read.table("./test/Y_test.txt", header = F)



# 1. Merge the training and the test sets to create one data set.

# Bind the training and test data by rows
features <- rbind(Xtrain, Xtest)
subject <- rbind(subtrain, subtest)
activity <- rbind(Ytrain, Ytest)

# Set names to variables using names in features.txt.
featureNames <- read.table("features.txt", head = F)
names(features) <- featureNames$V2
names(subject) <- c("Subject")
names(activity) <- c("Activity")

# Combine all data into one data frame.
allData <- cbind(subject, activity, features)



# 2. Extract only the measurements on the mean and standard
# deviation for each measurement.

# Subset large data frame into means and deviations.
allData <- subset(allData, select = c("Subject", "Activity", 
    as.character(featureNames$V2[grep("mean", featureNames$V2)]),
    as.character(featureNames$V2[grep("std", featureNames$V2)])))



# 3. Use descriptive activity names to name the activities in the
# data set.

# Read factor levels from activityLabels.txt.
activityNames <- read.table("activity_labels.txt", header = F)

# Factorize the Activity column.
allData$Activity <- factor(allData$Activity)

# Apply factor level names to the levels in the Activity column.
levels(allData$Activity) <- as.character(activityNames$V2)



# 4. Appropriately label the data set with descriptive variable
# names.

# Remove extra characters from variable names.
names(allData) <- gsub("\\()", "", names(allData))
names(allData) <- gsub("-", "", names(allData))

# Convert abbreviated words to descriptive words.
names(allData) <- gsub("^t", "time", names(allData))
names(allData) <- gsub("^f", "frequency", names(allData))
names(allData) <- gsub("BodyBody", "Body", names(allData))
names(allData) <- gsub("Acc", "Accelerometer", names(allData))
names(allData) <- gsub("Gyro", "Gyroscope", names(allData))
names(allData) <- gsub("Mag", "Magnitude", names(allData))
names(allData) <- gsub("mean", "Mean", names(allData))
names(allData) <- gsub("std", "StdDev", names(allData))



# 5. From the data set in step 4, create a second, independent
# tidy data set with the average of each variable for each
# activity and each subject.

# First group by Subject, then Activity, then use summarize_at
# to apply mean over all columns.
tidyData <- allData %>%
  group_by(Subject, Activity) %>%
  summarize_at(c(as.character(names(allData[3:ncol(allData)]))),
               funs(mean))

# Write the tidy dataset to a txt file.
write.table(tidyData, file = "tidy.txt", row.names = F)