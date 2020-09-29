# Data Dictionary for summarydata.txt

summarydata.txt consist of the average of each signal variable collected for each activity and each subject.

|COLUMN NAME|DATATYPE|COLUMN DESCRIPTION|
|-----------|--------|------------------|
|Subject|integer|Subject who performs the activity. Its range is from 1 to 30|
|Activity|character|One of the activities performed by subject: Walking, Walking Up, Walking Down, Sitting, Standing, Laying|
|Feature Variables|numeric|66 feature variables from signals collected in the study. **Please see details below**|

### Feature Variables 

Feature variables have the following format:

` [t|f][Body|Gravity][Acc|Gyro][|Jerk][|Mag]_[mean|std][|_X|_Y|_Z] `

Description of the abbreviations:

```
[t|f]
t=Time domain
f=Frequency domain

[Body|Gravity]
Body=Body
Gravity=Gravity

[Acc|Gyro]
Acc=Accelerometer
Gyro=Gyroscope

[|Jerk]
Jerk=Jerk

[|Mag]
Mag=magnitude

[mean|std]
mean=Mean value
std=Standard deviation

[|-X|Y|Z]
X|Y|Z=3-axial signals in X, Y and Z directions
```

Complete list of Feature Variables:
```
tBodyAcc_mean_X
tBodyAcc_mean_Y
tBodyAcc_mean_Z
tBodyAcc_std_X
tBodyAcc_std_Y
tBodyAcc_std_Z
tGravityAcc_mean_X
tGravityAcc_mean_Y
tGravityAcc_mean_Z
tGravityAcc_std_X
tGravityAcc_std_Y
tGravityAcc_std_Z
tBodyAccJerk_mean_X
tBodyAccJerk_mean_Y
tBodyAccJerk_mean_Z
tBodyAccJerk_std_X
tBodyAccJerk_std_Y
tBodyAccJerk_std_Z
tBodyGyro_mean_X
tBodyGyro_mean_Y
tBodyGyro_mean_Z
tBodyGyro_std_X
tBodyGyro_std_Y
tBodyGyro_std_Z
tBodyGyroJerk_mean_X
tBodyGyroJerk_mean_Y
tBodyGyroJerk_mean_Z
tBodyGyroJerk_std_X
tBodyGyroJerk_std_Y
tBodyGyroJerk_std_Z
tBodyAccMag_mean
tBodyAccMag_std
tGravityAccMag_mean
tGravityAccMag_std
tBodyAccJerkMag_mean
tBodyAccJerkMag_std
tBodyGyroMag_mean
tBodyGyroMag_std
tBodyGyroJerkMag_mean
tBodyGyroJerkMag_std
fBodyAcc_mean_X
fBodyAcc_mean_Y
fBodyAcc_mean_Z
fBodyAcc_std_X
fBodyAcc_std_Y
fBodyAcc_std_Z
fBodyAccJerk_mean_X
fBodyAccJerk_mean_Y
fBodyAccJerk_mean_Z
fBodyAccJerk_std_X
fBodyAccJerk_std_Y
fBodyAccJerk_std_Z
fBodyGyro_mean_X
fBodyGyro_mean_Y
fBodyGyro_mean_Z
fBodyGyro_std_X
fBodyGyro_std_Y
fBodyGyro_std_Z
fBodyAccMag_mean
fBodyAccMag_std
fBodyBodyAccJerkMag_mean
fBodyBodyAccJerkMag_std
fBodyBodyGyroMag_mean
fBodyBodyGyroMag_std
fBodyBodyGyroJerkMag_mean
fBodyBodyGyroJerkMag_std
```

---
Note:

- Details on how the data is collected are available in the README of UCI HAR Dataset