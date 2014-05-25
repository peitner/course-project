Course-Project
==============
This repo contains an R script "run_analysis.R" and corresponding code book for creation of a tidy dataset summarizing a larger dataset of human movement collected by monitoring smartphone accelerometers.  The full dataset consists of 10299 records of accelerometer data for 30 human subjects as they peform various activities.  The records in the full dataset are partitioned into test and training subsets which are merged back into a single datset for the purpose of this analysis.  There are 6 possible activity states:
* LAYING
* SITTING
* STANDING
* WALKING
* WALKING_DOWNSTAIRS
* WALKING_UPSTAIRS

There are 561 features (motion parameters) provided in each record in the full dataset.  The summary dataset contains averages computed by run_analysis.R of 66 of these features.  Averages are calculated for all the data available for each combination of subject and activity state.  This results in a tabulation of 180 records, each containing 66 features, in the output file tidystats.csv.

The run_analysis script can be run via the following command at the R console:

source("run_analysis.R")

The following data files are read and assumed to be in subfolders /test and /train of the folder where the run_analysis.R script resides:
* test/subject_test.txt
* test/y_test.txt
* test/X_test.txt
* train/subject_train.txt
* train/y_train.txt
* train/X_train.txt

The resulting summary data file tidystats.csv is output to the folder where the run_analysis.R script resides.
