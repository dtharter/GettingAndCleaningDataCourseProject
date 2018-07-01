# Getting and Cleaning Data Course Project Codebook
## Author: David Harter
### July 1, 2018


The tables described in this codebook are loaded, manipulated,
created, and output using the script "run_analysis.R."  This code is split by tasks as outlined in the project assignment.

## Libraries

### dplyr
Incorporated for its sorting and summarizing functionality.

## Constants

### fileURL
This contains the location of the zip file used for the project and has value: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Downloading and loading data

External files pulled from fileURL (above) wereloaded into R as the following data frames:

- subject_train.txt   -> loaded as data frame "subtrain"
- X_train.txt         -> loaded as data frame "Xtrain"
- Y_train.txt         -> loaded as data frame "Ytrain"
- subject_test.txt    -> loaded as data frame "subtest"
- X_test.txt          -> loaded as data frame "Xtest"
- Y_test.txt          -> loaded as data frame "Ytest"
- features.txt        -> loaded as data frame "featureNames"
- activity_labels.txt -> loaded as data frame "activityNames"

## Data Manipulation
- Data frames created by binding rows of training and test data frames:
```
features <- rbind(Xtrain, Xtest)
subject <- rbind(subtrain, subtest)
activity <- rbind(Ytrain, Ytest)
```
- Data frame allData created by merging "features," "subject," and "activity" into one large data frame containing all data.
- allData subsetted down into a data frame of columns containing means and standard deviations..

## Renaming Data
- featureNames data frame used for naming columns in "features" data frame.
- "Activity" column of allData coerced to factors using `factor`.
- activityNames data frame used for creating and assigning factor level names in "Activity" column of allData.  Incorporates `as.character` function.
- gsub used for getting rid of extra symbols and replacing ambiguous descriptions with explicit ones.
             
## Tidying Data  
tidyData - Data frame containing summarized variables from allData after applying `group_by` "Subject" and then "Activity," in that order and applying `summarize_at` to the result

## Writing Final Data File
tidy.txt - Text file created for exporting tidyData