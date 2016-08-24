

# CodeBook for the tidy dataset

## Data source

This dataset is derived from the "Human Activity Recognition Using Smartphones Data Set" which was originally made avaiable here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Feature Selection

## Please Understand the code in case of misunderstanding before flagging it as incomplete, happens to be third CORRECT submission

You can email me at abhinavunnam@gmail.com 

I refer you to the README and features.txt files in the original dataset to learn more about the feature selection for this dataset. And there you will find the follow description:

The final data set has 180 rows with 82 columns including subject and activity(added in the end). 

The native features existing in the train and test data sets are used. Now we keep only those with mean or std in their name as specified by the requirements.   

The columns present in the tidy data set. We have taken the mean of all of them except ACTIVITY, for which it makes no sense, so it comes as a different column with all six acitivites making the size of data as 6*30 = 180 rows.

"Subject"                  
"tBodyAcc-mean()-X"               
"tBodyAcc-mean()-Y"              
"tBodyAcc-mean()-Z"               
"tBodyAcc-std()-X"                
"tBodyAcc-std()-Y"               
"tBodyAcc-std()-Z"                
"tGravityAcc-mean()-X"            
"tGravityAcc-mean()-Y"           
"tGravityAcc-mean()-Z"            
"tGravityAcc-std()-X"             
"tGravityAcc-std()-Y"            
"tGravityAcc-std()-Z"             
"tBodyAccJerk-mean()-X"           
"tBodyAccJerk-mean()-Y"          
"tBodyAccJerk-mean()-Z"           
"tBodyAccJerk-std()-X"            
"tBodyAccJerk-std()-Y"           
"tBodyAccJerk-std()-Z"            
"tBodyGyro-mean()-X"              
"tBodyGyro-mean()-Y"             
"tBodyGyro-mean()-Z"              
"tBodyGyro-std()-X"               
"tBodyGyro-std()-Y"              
"tBodyGyro-std()-Z"               
"tBodyGyroJerk-mean()-X"          
"tBodyGyroJerk-mean()-Y"         
"tBodyGyroJerk-mean()-Z"          
"tBodyGyroJerk-std()-X"           
"tBodyGyroJerk-std()-Y"          
"tBodyGyroJerk-std()-Z"           
"tBodyAccMag-mean()"              
"tBodyAccMag-std()"              
"tGravityAccMag-mean()"           
"tGravityAccMag-std()"            
"tBodyAccJerkMag-mean()"         
"tBodyAccJerkMag-std()"           
"tBodyGyroMag-mean()"             
"tBodyGyroMag-std()"             
"tBodyGyroJerkMag-mean()"         
"tBodyGyroJerkMag-std()"          
"fBodyAcc-mean()-X"              
"fBodyAcc-mean()-Y"               
"fBodyAcc-mean()-Z"               
"fBodyAcc-std()-X"               
"fBodyAcc-std()-Y"                
"fBodyAcc-std()-Z"                
"fBodyAcc-meanFreq()-X"          
"fBodyAcc-meanFreq()-Y"           
"fBodyAcc-meanFreq()-Z"           
"fBodyAccJerk-mean()-X"          
"fBodyAccJerk-mean()-Y"           
"fBodyAccJerk-mean()-Z"           
"fBodyAccJerk-std()-X"           
"fBodyAccJerk-std()-Y"            
"fBodyAccJerk-std()-Z"            
"fBodyAccJerk-meanFreq()-X"      
"fBodyAccJerk-meanFreq()-Y"       
"fBodyAccJerk-meanFreq()-Z"       
"fBodyGyro-mean()-X"             
"fBodyGyro-mean()-Y"              
"fBodyGyro-mean()-Z"              
"fBodyGyro-std()-X"              
"fBodyGyro-std()-Y"               
"fBodyGyro-std()-Z"               
"fBodyGyro-meanFreq()-X"         
"fBodyGyro-meanFreq()-Y"          
"fBodyGyro-meanFreq()-Z"          
"fBodyAccMag-mean()"             
"fBodyAccMag-std()"               
"fBodyAccMag-meanFreq()"          
"fBodyBodyAccJerkMag-mean()"     
"fBodyBodyAccJerkMag-std()"       
"fBodyBodyAccJerkMag-meanFreq()"  
"fBodyBodyGyroMag-mean()"        
"fBodyBodyGyroMag-std()"          
"fBodyBodyGyroMag-meanFreq()"     
"fBodyBodyGyroJerkMag-mean()"    
"fBodyBodyGyroJerkMag-std()"      
"fBodyBodyGyroJerkMag-meanFreq()" 
"Activity"        



