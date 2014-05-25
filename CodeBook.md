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

The files subject_test.txt and subject_train.txt contain the subject identifiers for 2947 test and 7352 training records respectively.  Total number of records for the test+training merged dataset is 10299.  The files y_test.txt and y_train.txt contain numerical activity identifiers 1 through 6 which are mapped to the 6 activity states as follows:
* 6 -> LAYING
* 4 -> SITTING
* 5 -> STANDING
* 1 -> WALKING
* 3 -> WALKING_DOWNSTAIRS
* 2 -> WALKING_UPSTAIRS
The y_test activity file contains 2947 identifiers and the y_test training file contains 7352 indentifiers, adding up to the 2947+7352 = 10299 records in the merged dataset.

The first processing step performed by the run_analysis script is to replace the numerical activity identifiers with the text activity labels, as listed above.  This is performed by an internally defined function activities() included in the run_analysis.R file.
