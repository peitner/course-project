Course-Project
==============
This Code Book describes data inputs, outputs, and processing performed by the script run_analysis.R.  Important variables and data structures internal to the script will also be described.

Input data are all taken from the following 6 files:
* test/subject_test.txt
* test/y_test.txt
* test/X_test.txt
* train/subject_train.txt
* train/y_train.txt
* train/X_train.txt

The processing result is an output file tidystats.csv summarizing some aspects of the full input dataset.

The files subject_test.txt and subject_train.txt contain the subject identifiers for 2947 test and 7352 training records respectively.  Total number of records for the test+training merged dataset is 10299.  The files y_test.txt and y_train.txt contain numerical activity identifiers 1 through 6 which are mapped to the 6 activity states as follows:

6 -> LAYING

4 -> SITTING

5 -> STANDING

1 -> WALKING

3 -> WALKING_DOWNSTAIRS

2 -> WALKING_UPSTAIRS

The y_test activity file contains 2947 identifiers and the y_test training file contains 7352 indentifiers, adding up to the 2947+7352 = 10299 records in the merged dataset.

The first processing step performed by the run_analysis script is to replace the numerical activity identifiers with the text activity labels, as listed above.  This is performed by an internally defined function activities() included in the run_analysis.R file, and it is done separately on test and train datasets, before they are merged.

The 561 motion parameter features in the full dataset are reduced down to a subset of 66 features for averaging and inclusion in the file tidystats.csv.  The features list to be included in the subset is captured in two hardcoded vectors feature.indices and the corresponding feature.names.  These lists are used to select and label the 66 feature columns that are stored in the data frames "test" and "train", along with corresponding subject identifiers and activity labels for each data record.  The separate test and train frames are merged via R's rbind() function into a combined data frame "merge".  At this point, the merge data frame consists of 10299 rows and 68 columns (subject & activity identifiers plus 66 features for each row).

A factor variable f3 is created consisting of all 180 possible combinations of subject identifier and activity state.  Means are computed for the 66 features, averaging all data available for each of the subject/activity state pairings, this data being selected accoring to the factor variable.  Factoring and avaraging are performed using the R functions split() and lapply(), with results going into the list-of-lists "t".

Finally the 180 averages for each feature are combined together with subject and activity identifiers and labels in a data frame and output in the file tidystats.csv. 

For reference, here is the list of 66 features selected for averaging from the full dataset.  These are all the features from the original data set that are measurements of either mean or standard deviation:

tBodyAcc.meanX

tBodyAcc.meanY

tBodyAcc.meanZ

tBodyAcc.stdX

tBodyAcc.stdY

tBodyAcc.stdZ

tGravityAcc.meanX

tGravityAcc.meanY

tGravityAcc.meanZ

tGravityAcc.stdX

tGravityAcc.stdY

tGravityAcc.stdZ

tBodyAccJerk.meanX

tBodyAccJerk.meanY

tBodyAccJerk.meanZ

tBodyAccJerk.stdX

tBodyAccJerk.stdY

tBodyAccJerk.stdZ

tBodyGyro.meanX

tBodyGyro.meanY

tBodyGyro.meanZ

tBodyGyro.stdX

tBodyGyro.stdY

tBodyGyro.stdZ

tBodyGyroJerk.meanX

tBodyGyroJerk.meanY

tBodyGyroJerk.meanZ

tBodyGyroJerk.stdX

tBodyGyroJerk.stdY

tBodyGyroJerk.stdZ

tBodyAccMag.mean

tBodyAccMag.std

tGravityAccMag.mean

tGravityAccMag.std

tBodyAccJerkMag.mean

tBodyAccJerkMag.std

tBodyGyroMag.mean

tBodyGyroMag.std

tBodyGyroJerkMag.mean

tBodyGyroJerkMag.std

fBodyAcc.meanX

fBodyAcc.meanY

fBodyAcc.meanZ

fBodyAcc.stdX

fBodyAcc.stdY

fBodyAcc.stdZ

fBodyAccJerk.meanX

fBodyAccJerk.meanY

fBodyAccJerk.meanZ

fBodyAccJerk.stdX

fBodyAccJerk.stdY

fBodyAccJerk.stdZ

fBodyGyro.meanX

fBodyGyro.meanY

fBodyGyro.meanZ

fBodyGyro.stdX

fBodyGyro.stdY

fBodyGyro.stdZ

fBodyAccMag.mean

fBodyAccMag.std

fBodyBodyAccJerkMag.mean

fBodyBodyAccJerkMag.std

fBodyBodyGyroMag.mean

fBodyBodyGyroMag.std

fBodyBodyGyroJerkMag.mean

fBodyBodyGyroJerkMag.std


