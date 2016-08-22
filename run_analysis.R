


## ReadMe File

## Explains the code flow and implementation of code

## Setting the base directory
## Rest of the script works from this very directory 
setwd("C:/******************/CleaningData/Week4/UCI HAR Dataset")

###############################           Step1            ###############################################################

## Train Data
## Three data fields are read
X_train <- read.table("./train/X_train.txt")
subject_train <- read.table("./train/subject_train.txt")
y_train <- read.table("./train/y_train.txt")

## Bind the three sets into one, now we have 563 columns(561+1+1)
Train <- cbind(X_train,subject_train,y_train)

## Convert Train into a data frame
Train <- as.data.frame(Train)

## Measurements Train Data from Inertial Signals
## commented, since they won't be useful going forward

# body_acc_x_train <- read.table("./train/Inertial Signals/body_acc_x_train.txt")
# body_acc_y_train <- read.table("./train/Inertial Signals/body_acc_y_train.txt")
# body_acc_z_train <- read.table("./train/Inertial Signals/body_acc_z_train.txt")
# 
# body_gyro_x_train <- read.table("./train/Inertial Signals/body_gyro_x_train.txt")
# body_gyro_y_train <- read.table("./train/Inertial Signals/body_gyro_y_train.txt")
# body_gyro_z_train <- read.table("./train/Inertial Signals/body_gyro_z_train.txt")
# 
# total_acc_x_train <- read.table("./train/Inertial Signals/total_acc_x_train.txt")
# total_acc_y_train <- read.table("./train/Inertial Signals/total_acc_y_train.txt")
# total_acc_z_train <- read.table("./train/Inertial Signals/total_acc_z_train.txt")


## Test Data
## Three Data Fields are read
X_test <- read.table("./test/X_test.txt")
subject_test <- read.table("./test/subject_test.txt")
y_test <- read.table("./test/y_test.txt")

## Bind them into one data set
Test <- cbind(X_test,subject_test,y_test)

## Convert it into a data frame (data frame is better for analysis)
Test <- as.data.frame(Test)

## Measurements Test Data 
# body_acc_x_test <- read.table("./test/Inertial Signals/body_acc_x_test.txt")
# body_acc_y_test <- read.table("./test/Inertial Signals/body_acc_y_test.txt")
# body_acc_z_test <- read.table("./test/Inertial Signals/body_acc_z_test.txt")
# 
# body_gyro_x_test <- read.table("./test/Inertial Signals/body_gyro_x_test.txt")
# body_gyro_y_test <- read.table("./test/Inertial Signals/body_gyro_y_test.txt")
# body_gyro_z_test <- read.table("./test/Inertial Signals/body_gyro_z_test.txt")
# 
# total_acc_x_test <- read.table("./test/Inertial Signals/total_acc_x_test.txt")
# total_acc_y_test <- read.table("./test/Inertial Signals/total_acc_y_test.txt")
# total_acc_z_test <- read.table("./test/Inertial Signals/total_acc_z_test.txt")


## Merging Train and Test into one complete data set(data.frame format)
## By default rbind and cbind, make final output into a list
Total <- rbind(Train,Test)
Total <- as.data.frame(Total)

###############################     Step 2     ######################################################

## Features Selection
features <- read.table("features.txt", quote="\"", comment.char="")

## Check for those column names with either mean or std in their names
mean_features_list <- grep("mean",features[,2])
std_features_list <- grep("std",features[,2])

## Concatenate the list and then sort, since the ouptut is not in order
## We get 79  valid features
valid_features <- c(mean_features_list,std_features_list)
valid_features <- sort(valid_features)

## Just keeping those features which 
## Valid features plus the subject and activity lables are kept
## Number of columns reduced to 81(79+1+1)
Total <- Total[,c(valid_features,562,563)]


##############################     Step 3    #########################################################

## A very unfancy means to rename the activity labels
Total[Total[,81]==1,81] <- "WALKING"
Total[Total[,81]==2,81] <- "WALKING_UPSTAIRS"
Total[Total[,81]==3,81] <- "WALKING_DOWNSTAIRS"
Total[Total[,81]==4,81] <- "SITTING"
Total[Total[,81]==5,81] <- "STANDING"
Total[Total[,81]==6,81] <- "LAYING"

##############################    Step 4    ###########################################################

## Giving the columns proper names
## There are over 80 variables, so obviously we needn't write more descriptive names rather use the exisitng ones
## Get the 79 variable names, append Subject and Activity lables
names <- as.character(features[valid_features,2])
names <- c(names,"Subject","Activity")

## Modify the names of the column from V form to peoper descriptive ones
colnames(Total) <- names

##############################     Step 5   ##########################################################

## Summarizing data into a single independent data having mean of variables by subjects. 
## Aggregate, you beauty :) 
## A data frame with 
## Activity makes no sense as far as mean is concerned
New_Data_Set <- aggregate( . ~ Subject,Total[,1:80],mean)
Temp <- table(Total$Subject,Total$Activity)
New_Data_Set <- cbind(New_Data_Set,Temp)

## Removing the excess column
New_Data_Set <- New_Data_Set[,-81]

## Writing to a file
write.table(New_Data_Set,file="tidy.txt",row.names=F)

