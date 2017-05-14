library(dplyr)
# [Step 0A - Get data]
# download zip file if data directory doesn't already exist
zipDataUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipData <- "UCI HAR Dataset.zip"
if (!file.exists(zipData)) {
    download.file(zipDataUrl, zipData, mode = "wb")
}
# unzip zip file containing data
dataPath <- "UCI HAR Dataset"
if (!file.exists(dataPath)) {
    unzip(zipData)
}

# [Step 0B - Set working directory and Read data]
setwd("UCI HAR Dataset")
# read test data
s_test<-read.table("test/subject_test.txt")
x_test<-read.table("test/X_test.txt")
y_test<-read.table("test/y_test.txt")
# read train data
s_train<-read.table("train/subject_train.txt")
x_train<-read.table("train/X_train.txt")
y_train<-read.table("train/y_train.txt")
# read features
features<-read.table("features.txt")
# [Step 1 - Merge the training and the test sets to create one data set]
# Rename column names
y_test<-rename(y_test, activity=V1)
y_train<-rename(y_train, activity=V1)
s_test<-rename(s_test, subject=V1)
s_train<-rename(s_train, subject=V1)
# Using bind_rows & bind_cols form dplyr to create single dataset
x<-bind_rows(x_test, x_train)
y<-bind_rows(y_test, y_train)
s<-bind_rows(s_test, s_train)

# [Step 2 - Extract only the measurements on the mean and standard deviation 
#           for each measurement]
# Replace colnames from X_test & X_train with features
colnames(x) <- features[, 2]
# Extract only columns containing Mean(),mean(),Std() or std()
colselect<-grep("[Mm]ean\\()|[Ss]td\\()",colnames(x))
xselect<-x[,colselect]
# Merge the subject and the activity set with the above set
newdataset<-bind_cols(s,y,xselect)

# [Step 3 - Use descriptive activity names to name the activities in the data
#           set]
activities <- read.table("activity_labels.txt")
newdataset[, 2] <- activities[newdataset[, 2], 2]

# [Step 4 - Appropriately label the data set with descriptive variable names]
# get column names
newdatasetCols <- colnames(newdataset)
# expand abbreviations
newdatasetCols <- gsub("Acc", "Accelerometer", newdatasetCols)
newdatasetCols <- gsub("Freq", "Frequency", newdatasetCols)
newdatasetCols <- gsub("Gyro", "Gyroscope", newdatasetCols)
newdatasetCols <- gsub("Mag", "Magnitude", newdatasetCols)
# remove repeated term
newdatasetCols <- gsub("BodyBody", "Body", newdatasetCols)
# replace column names with new labels
colnames(newdataset) <- newdatasetCols

# [Step 5 - Create a second, independent tidy set with the average of each
#           variable for each activity and each subject]
# use summarise_each to group by 30 subjects x 6 activities, 
# and output mean of each group 
data_summary <- newdataset %>%
    group_by(subject,activity) %>%
    summarise_each(funs(mean))
# output to file "data_summary.txt"
write.table(data_summary, "data_summary.txt", row.name=FALSE)
