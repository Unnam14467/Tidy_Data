

## Files Present

run_analysis.R : Executes the code

README.md : The explanation file for all 

CodeBook : Features used and manipulated

tidy.txt : The final data


# README FILE

Explains the code flow and implementation of code

Setting the base directory
Rest of the script works from this very directory 

```{r cars}
setwd("C:/******************/CleaningData/Week4/UCI HAR Dataset")
```

## Train Data
Three data fields are read

```{r pressure, echo=FALSE}
X_train <- read.table("./train/X_train.txt")
subject_train <- read.table("./train/subject_train.txt")
y_train <- read.table("./train/y_train.txt")
```

Bind the three sets into one, now we have 563 columns(561+1+1)

```{r}
Train <- cbind(X_train,subject_train,y_train)
```

Convert Train into a data frame

```{r}
Train <- as.data.frame(Train)
```

## Measurements Train Data from Inertial Signals are skipped

## Test Data
Three Data Fields are read

```{r}
X_test <- read.table("./test/X_test.txt")
subject_test <- read.table("./test/subject_test.txt")
y_test <- read.table("./test/y_test.txt")
```

Bind them into one data set

```{r}
Test <- cbind(X_test,subject_test,y_test)
```

Convert it into a data frame (data frame is better for analysis)

```{r}
Test <- as.data.frame(Test)
```

## Merging Train and Test into one complete data set(data.frame format)
By default rbind and cbind, make final output into a list

```{r}
Total <- rbind(Train,Test)
Total <- as.data.frame(Total)
```


Features Selection

```{r}
features <- read.table("features.txt", quote="\"", comment.char="")
```

Check for those column names with either mean or std in their names

```{r}
mean_features_list <- grep("mean",features[,2])
std_features_list <- grep("std",features[,2])
```

Concatenate the list and then sort, since the ouptut is not in order
We get 79  valid features

```{r}
valid_features <- c(mean_features_list,std_features_list)
valid_features <- sort(valid_features)
```
Just keeping those features which 
Valid features plus the subject and activity lables are kept
Number of columns reduced to 81(79+1+1)

```{r}
Total <- Total[,c(valid_features,562,563)]
```




A very unfancy means to rename the activity labels

```{r}
Total[Total[,81]==1,81] <- "WALKING"
Total[Total[,81]==2,81] <- "WALKING_UPSTAIRS"
Total[Total[,81]==3,81] <- "WALKING_DOWNSTAIRS"
Total[Total[,81]==4,81] <- "SITTING"
Total[Total[,81]==5,81] <- "STANDING"
Total[Total[,81]==6,81] <- "LAYING"
```



Giving the columns proper names
There are over 80 variables, so obviously we needn't write more descriptive names rather use the exisitng ones
Get the 79 variable names, append Subject and Activity lables

```{r}
names <- as.character(features[valid_features,2])
names <- c(names,"Subject","Activity")
```

Modify the names of the column from V form to peoper descriptive ones

```{r}
colnames(Total) <- names
```



Summarizing data into a single independent data having mean of variables by subjects. 
Aggregate, you beauty :) 
A data frame with 
Activity is added as labels later in another operation

```{r}
New_Data_Set <- aggregate( . ~ Subject,Total[,1:80],mean)
Temp <- table(Total$Subject,Total$Activity)
New_Data_Set <- cbind(New_Data_Set,Temp)
```

Removing the excess column

```{r}
New_Data_Set <- New_Data_Set[,-81]
```

Writing to a file

```{r}
write.table(New_Data_Set,file="tidy.txt",row.names=F)
```


