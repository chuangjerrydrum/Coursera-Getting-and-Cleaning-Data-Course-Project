# Introduction

The script run_analysis.R performs the steps described in the course project's definition.

Step for run_analysis.R:

1.Merge test and train datasets by using the bind_rows() & bind_cols() function.

2.Extract only columnsnames from features.txt containing Mean(),mean(),Std() or std() 

3.use descriptive activity names to name the activities in the dataset

4.label the dataset with descriptive variable names, which included expanding abbreviations and removing repeated term

5.Create a second, independent tidy set with function summarise_each() and group_by() to 30 subjects x 6 activities 
and output average of each group

---
Activities
1 WALKING 2 WALKING_UPSTAIRS 3 WALKING_DOWNSTAIRS 4 SITTING 5 STANDING 6 LAYING

Features
`tBodyAccelerometer-mean()-Y` <dbl>,
`tBodyAccelerometer-mean()-Z` <dbl>, `tBodyAccelerometer-std()-X` <dbl>,
`tBodyAccelerometer-std()-Y` <dbl>, `tBodyAccelerometer-std()-Z` <dbl>,
`tGravityAccelerometer-mean()-X` <dbl>,
`tGravityAccelerometer-mean()-Y` <dbl>,
`tGravityAccelerometer-mean()-Z` <dbl>,
`tGravityAccelerometer-std()-X` <dbl>,
`tGravityAccelerometer-std()-Y` <dbl>,
`tGravityAccelerometer-std()-Z` <dbl>,
`tBodyAccelerometerJerk-mean()-X` <dbl>,
`tBodyAccelerometerJerk-mean()-Y` <dbl>,
`tBodyAccelerometerJerk-mean()-Z` <dbl>,
`tBodyAccelerometerJerk-std()-X` <dbl>,
`tBodyAccelerometerJerk-std()-Y` <dbl>,
`tBodyAccelerometerJerk-std()-Z` <dbl>, `tBodyGyroscope-mean()-X` <dbl>,
`tBodyGyroscope-mean()-Y` <dbl>, `tBodyGyroscope-mean()-Z` <dbl>,
`tBodyGyroscope-std()-X` <dbl>, `tBodyGyroscope-std()-Y` <dbl>,
`tBodyGyroscope-std()-Z` <dbl>, `tBodyGyroscopeJerk-mean()-X` <dbl>,
`tBodyGyroscopeJerk-mean()-Y` <dbl>, `tBodyGyroscopeJerk-mean()-Z` <dbl>,
`tBodyGyroscopeJerk-std()-X` <dbl>, `tBodyGyroscopeJerk-std()-Y` <dbl>,
`tBodyGyroscopeJerk-std()-Z` <dbl>,
`tBodyAccelerometerMagnitude-mean()` <dbl>,
`tBodyAccelerometerMagnitude-std()` <dbl>,
`tGravityAccelerometerMagnitude-mean()` <dbl>,
`tGravityAccelerometerMagnitude-std()` <dbl>,
`tBodyAccelerometerJerkMagnitude-mean()` <dbl>,
`tBodyAccelerometerJerkMagnitude-std()` <dbl>,
`tBodyGyroscopeMagnitude-mean()` <dbl>,
`tBodyGyroscopeMagnitude-std()` <dbl>,
`tBodyGyroscopeJerkMagnitude-mean()` <dbl>,
`tBodyGyroscopeJerkMagnitude-std()` <dbl>,
`fBodyAccelerometer-mean()-X` <dbl>, `fBodyAccelerometer-mean()-Y` <dbl>,
`fBodyAccelerometer-mean()-Z` <dbl>, `fBodyAccelerometer-std()-X` <dbl>,
`fBodyAccelerometer-std()-Y` <dbl>, `fBodyAccelerometer-std()-Z` <dbl>,
`fBodyAccelerometerJerk-mean()-X` <dbl>,
`fBodyAccelerometerJerk-mean()-Y` <dbl>,
`fBodyAccelerometerJerk-mean()-Z` <dbl>,
`fBodyAccelerometerJerk-std()-X` <dbl>,
`fBodyAccelerometerJerk-std()-Y` <dbl>,
`fBodyAccelerometerJerk-std()-Z` <dbl>, `fBodyGyroscope-mean()-X` <dbl>,
`fBodyGyroscope-mean()-Y` <dbl>, `fBodyGyroscope-mean()-Z` <dbl>,
`fBodyGyroscope-std()-X` <dbl>, `fBodyGyroscope-std()-Y` <dbl>,
`fBodyGyroscope-std()-Z` <dbl>,
`fBodyAccelerometerMagnitude-mean()` <dbl>,
`fBodyAccelerometerMagnitude-std()` <dbl>,
`fBodyAccelerometerJerkMagnitude-mean()` <dbl>,
`fBodyAccelerometerJerkMagnitude-std()` <dbl>,
`fBodyGyroscopeMagnitude-mean()` <dbl>,
`fBodyGyroscopeMagnitude-std()` <dbl>,
`fBodyGyroscopeJerkMagnitude-mean()` <dbl>,
`fBodyGyroscopeJerkMagnitude-std()` <dbl>

---
# Variables

[x_train, y_train, s_train, x_test, y_test, s_test] contain the data from the downloaded files.

[x, y, s] merge the previous datasets to further analysis.

[features] contains the correct columnnames for the [x] dataset

[colselect] contains the columnnames extracting from [x], which only containing the measurements on the mean and std

[xselect] stores the new dataset extracting from [x], which only containing the measurements on the mean and std

[activities] contains the correct variables for [y_test] and [y_train]

[newdataset] merges [xselect, y and s] in a new dataset.

[newdatasetCols] are columnnames of [newdataset]

[data_summary] contains a second, independent tidy set with function summarise_each() and group_by() to 30 subjects x 6 activities and output average of each group, which will be stored in a .txt file.
