# Course3Project README 

This repository contains the following files:

* run_analysis.R - R script that processes input files from UCI HAR Dataset. Details below.
* summarydata.txt - output from run_analysis.R
* CodeBook.md - the Data Dictionary for summarydata.txt

## run_analysis.R
This section describes process in R script run_analysis.R.
The purpose of this script is to reads multiple input files and produce a single tidy data set, with the following principles of tidy data sets:

* Each variable forms a column.
* Each observation forms a row.
* Each type of observational unit forms a table.

**Breakdown of process in run_analysis.R:**

1. Prepares source data files:
    1. Creates "data" folder if it doesn't already exist.
    2. Downloads source zip file "projdataset.zip" into data folder if it doesn't already exist
    3. Unzips projdataset.zip


2. Reads the following files into dataframes 
    * activity_labels.txt into `activity_labels` dataframe - which contains the labels of activities performed by subjects. Activities descriptions are formatted to meaningful activity names.
    * features.txt into `feature` dataframe - which contains the signals collected in the study


3. Prepares test dataset:
    1. Reads input files: `subject_test.txt, y_test.txt, X_test.txt` into individual dataframes: `subject_test, labels_test, dataset_test`
    2. Select relevant columns from `dataset_test`, ie. columns with `mean()` and `std()`
    3. Combines `subject_test`, `labels_test` and `dataset_test`, activity ID is mapped to activity name from `activity_labels`


4. Prepares train dataset: 
    1.  Reads input files: `subject_train.txt, y_train.txt, X_train.txt` into individual dataframes: `subject_train, labels_train, dataset_train`
    2. Select relevant columns from `dataset_train`, ie. columns with `mean()` and `std()`
    3. Combines `subject_train`, `labels_train` and `dataset_train`, activity ID is mapped to activity name from `activity_labels`


5. Combines test and train datasets

6. Renames column(variables) to the following format

    ` [t|f][Body|Gravity][Acc|Gyro][|Jerk][|Mag]_[mean|std][|_X|_Y|_Z] `

7. Creates a new dataframe with the average of each variable of each activity and each subject.

8. Writes dataframe from step 7 into "summarydata.txt" 


## summarydata.txt
summarydata.txt is the output of run_analysis.R.

It contains the average of each statistic collected for each subject performing each activity.

To read the file:
```
dat <- read.table("summarydata.txt", sep=" ", header = TRUE)
View(dat)
```

## CodeBook.md
CodeBook.md is the Data Dictionary for summarydata.txt