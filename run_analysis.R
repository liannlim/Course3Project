# source library
library(dplyr)

# create "data" folder if it doesn't already exist
if( !dir.exists("./data") )
  dir.create("./data")

# download files if it doesn't already exist
if ( !file.exists("./data/projdataset.zip") ) {
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "./data/projdataset.zip", mode="wb")
  unzip("./data/projdataset.zip", exdir = "./data")
}

# reads activity labels and features
activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt", sep = " ", col.names = c("act_id", "activity"))
features <- read.table("./data/UCI HAR Dataset/features.txt", sep = "", col.names = c("feat_id", "feat_desc"))

activity_labels$activity <- gsub("STAIRS", "", gsub("_", " ", activity_labels$activity))

# get test dataset
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", sep = " ", col.names = c("subject"))
labels_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt", sep = " ", col.names = c("act_id"))
dataset_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt", col.names = features$feat_desc)

# relevant columns only: mean(), std()
dataset_test <- dataset_test[, grep("mean\\(\\)|std\\(\\)", features$feat_desc)]

# cbind subject, activity, map to proper activity name, cbind with test result
tidydata_test <- cbind(subject_test, labels_test) %>%
  merge(activity_labels, by.x = "act_id", by.y = "act_id", sort = FALSE) %>%
  select(subject, activity) %>%
  cbind(dataset_test)

# get train dataset
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", sep = " ", col.names = c("subject"))
labels_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt", sep = " ", col.names = c("act_id"))
dataset_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt", col.names = features$feat_desc)

# relevant columns only: mean(), std()
dataset_train <- dataset_train[, grep("mean\\(\\)|std\\(\\)", features$feat_desc)]

# cbind subject, activity, map to proper activity name, cbind with test result
tidydata_train <- cbind(subject_train, labels_train) %>%
  merge(activity_labels, by.x = "act_id", by.y = "act_id", sort = FALSE) %>%
  select(subject, activity) %>%
  cbind(dataset_train)

# combine test and train data
tidydata <- rbind(tidydata_test, tidydata_train)

# tidy column name
names(tidydata) <- gsub("_$", "", gsub("[^0-9a-zA-Z]{1,}", "_", names(tidydata)))

# new dataframe with the average of each variable of each activity and each subject
summarydat <- tidydata %>%
  group_by(subject, activity) %>%
  summarize_all(mean, na.rm = TRUE)

# write summary dataframe into summarydata.txt
write.table(summarydat, file="summarydata.txt", row.names = FALSE)
