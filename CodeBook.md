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

## Final Variables

### Activity Factor Levels
1              WALKING
2     WALKING_UPSTAIRS
3   WALKING_DOWNSTAIRS
4              SITTING
5             STANDING
6               LAYING

### Variable Names
 [1] "Subject"                                        
 [2] "Activity"                                       
 [3] "timeBodyAccelerometerMeanX"                     
 [4] "timeBodyAccelerometerMeanY"                     
 [5] "timeBodyAccelerometerMeanZ"                     
 [6] "timeGravityAccelerometerMeanX"                  
 [7] "timeGravityAccelerometerMeanY"                  
 [8] "timeGravityAccelerometerMeanZ"                  
 [9] "timeBodyAccelerometerJerkMeanX"                 
[10] "timeBodyAccelerometerJerkMeanY"                 
[11] "timeBodyAccelerometerJerkMeanZ"                 
[12] "timeBodyGyroscopeMeanX"                         
[13] "timeBodyGyroscopeMeanY"                         
[14] "timeBodyGyroscopeMeanZ"                         
[15] "timeBodyGyroscopeJerkMeanX"                     
[16] "timeBodyGyroscopeJerkMeanY"                     
[17] "timeBodyGyroscopeJerkMeanZ"                     
[18] "timeBodyAccelerometerMagnitudeMean"             
[19] "timeGravityAccelerometerMagnitudeMean"          
[20] "timeBodyAccelerometerJerkMagnitudeMean"         
[21] "timeBodyGyroscopeMagnitudeMean"                 
[22] "timeBodyGyroscopeJerkMagnitudeMean"             
[23] "frequencyBodyAccelerometerMeanX"                
[24] "frequencyBodyAccelerometerMeanY"                
[25] "frequencyBodyAccelerometerMeanZ"                
[26] "frequencyBodyAccelerometerMeanFreqX"            
[27] "frequencyBodyAccelerometerMeanFreqY"            
[28] "frequencyBodyAccelerometerMeanFreqZ"            
[29] "frequencyBodyAccelerometerJerkMeanX"            
[30] "frequencyBodyAccelerometerJerkMeanY"            
[31] "frequencyBodyAccelerometerJerkMeanZ"            
[32] "frequencyBodyAccelerometerJerkMeanFreqX"        
[33] "frequencyBodyAccelerometerJerkMeanFreqY"        
[34] "frequencyBodyAccelerometerJerkMeanFreqZ"        
[35] "frequencyBodyGyroscopeMeanX"                    
[36] "frequencyBodyGyroscopeMeanY"                    
[37] "frequencyBodyGyroscopeMeanZ"                    
[38] "frequencyBodyGyroscopeMeanFreqX"                
[39] "frequencyBodyGyroscopeMeanFreqY"                
[40] "frequencyBodyGyroscopeMeanFreqZ"                
[41] "frequencyBodyAccelerometerMagnitudeMean"        
[42] "frequencyBodyAccelerometerMagnitudeMeanFreq"    
[43] "frequencyBodyAccelerometerJerkMagnitudeMean"    
[44] "frequencyBodyAccelerometerJerkMagnitudeMeanFreq"
[45] "frequencyBodyGyroscopeMagnitudeMean"            
[46] "frequencyBodyGyroscopeMagnitudeMeanFreq"        
[47] "frequencyBodyGyroscopeJerkMagnitudeMean"        
[48] "frequencyBodyGyroscopeJerkMagnitudeMeanFreq"    
[49] "timeBodyAccelerometerStdDevX"                   
[50] "timeBodyAccelerometerStdDevY"                   
[51] "timeBodyAccelerometerStdDevZ"                   
[52] "timeGravityAccelerometerStdDevX"                
[53] "timeGravityAccelerometerStdDevY"                
[54] "timeGravityAccelerometerStdDevZ"                
[55] "timeBodyAccelerometerJerkStdDevX"               
[56] "timeBodyAccelerometerJerkStdDevY"               
[57] "timeBodyAccelerometerJerkStdDevZ"               
[58] "timeBodyGyroscopeStdDevX"                       
[59] "timeBodyGyroscopeStdDevY"                       
[60] "timeBodyGyroscopeStdDevZ"                       
[61] "timeBodyGyroscopeJerkStdDevX"                   
[62] "timeBodyGyroscopeJerkStdDevY"                   
[63] "timeBodyGyroscopeJerkStdDevZ"                   
[64] "timeBodyAccelerometerMagnitudeStdDev"           
[65] "timeGravityAccelerometerMagnitudeStdDev"        
[66] "timeBodyAccelerometerJerkMagnitudeStdDev"       
[67] "timeBodyGyroscopeMagnitudeStdDev"               
[68] "timeBodyGyroscopeJerkMagnitudeStdDev"           
[69] "frequencyBodyAccelerometerStdDevX"              
[70] "frequencyBodyAccelerometerStdDevY"              
[71] "frequencyBodyAccelerometerStdDevZ"              
[72] "frequencyBodyAccelerometerJerkStdDevX"          
[73] "frequencyBodyAccelerometerJerkStdDevY"          
[74] "frequencyBodyAccelerometerJerkStdDevZ"          
[75] "frequencyBodyGyroscopeStdDevX"                  
[76] "frequencyBodyGyroscopeStdDevY"                  
[77] "frequencyBodyGyroscopeStdDevZ"                  
[78] "frequencyBodyAccelerometerMagnitudeStdDev"      
[79] "frequencyBodyAccelerometerJerkMagnitudeStdDev"  
[80] "frequencyBodyGyroscopeMagnitudeStdDev"          
[81] "frequencyBodyGyroscopeJerkMagnitudeStdDev"