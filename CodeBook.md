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
