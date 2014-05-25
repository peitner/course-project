## 
## Initialize rowsize of test, training, and merged datasets
ntest<-2947
ntrain<-7352
nmrg<-ntest+ntrain
##
## Initialize column indices & names for mean, stdev values in
## feature files X_train.txt, X_test.txt
feature.indices<-c(1,2,3,4,5,6,41,42,43,44,45,46,81,82,83,84,85,86,121,122,123,124,
125,126,161,162,163,164,165,166,201,202,214,215,227,228,240,241,
253,254,266,267,268,269,270,271,345,346,347,348,349,350,424,425,
426,427,428,429,503,504,516,517,529,530,542,543)
feature.names<-c("tBodyAcc.meanX","tBodyAcc.meanY","tBodyAcc.meanZ","tBodyAcc.stdX",
"tBodyAcc.stdY","tBodyAcc.stdZ","tGravityAcc.meanX","tGravityAcc.meanY","tGravityAcc.meanZ",
"tGravityAcc.stdX","tGravityAcc.stdY","tGravityAcc.stdZ","tBodyAccJerk.meanX",
"tBodyAccJerk.meanY","tBodyAccJerk.meanZ","tBodyAccJerk.stdX","tBodyAccJerk.stdY",
"tBodyAccJerk.stdZ","tBodyGyro.meanX","tBodyGyro.meanY","tBodyGyro.meanZ",
"tBodyGyro.stdX","tBodyGyro.stdY","tBodyGyro.stdZ","tBodyGyroJerk.meanX",
"tBodyGyroJerk.meanY","tBodyGyroJerk.meanZ","tBodyGyroJerk.stdX",
"tBodyGyroJerk.stdY","tBodyGyroJerk.stdZ","tBodyAccMag.mean","tBodyAccMag.std",
"tGravityAccMag.mean","tGravityAccMag.std","tBodyAccJerkMag.mean",
"tBodyAccJerkMag.std","tBodyGyroMag.mean","tBodyGyroMag.std","tBodyGyroJerkMag.mean",
"tBodyGyroJerkMag.std","fBodyAcc.meanX","fBodyAcc.meanY","fBodyAcc.meanZ",
"fBodyAcc.stdX","fBodyAcc.stdY","fBodyAcc.stdZ","fBodyAccJerk.meanX","fBodyAccJerk.meanY",
"fBodyAccJerk.meanZ","fBodyAccJerk.stdX","fBodyAccJerk.stdY","fBodyAccJerk.stdZ",
"fBodyGyro.meanX","fBodyGyro.meanY","fBodyGyro.meanZ","fBodyGyro.stdX",
"fBodyGyro.stdY","fBodyGyro.stdZ","fBodyAccMag.mean","fBodyAccMag.std",
"fBodyBodyAccJerkMag.mean","fBodyBodyAccJerkMag.std","fBodyBodyGyroMag.mean",
"fBodyBodyGyroMag.std","fBodyBodyGyroJerkMag.mean","fBodyBodyGyroJerkMag.std")
##
## Read subject and activity for each test sample and each training sample
subject.test<-read.table("test/subject_test.txt")
activity.test<-read.table("test/y_test.txt")
subject.train<-read.table("train/subject_train.txt")
activity.train<-read.table("train/y_train.txt")
##
## Map activity indices to activity labels using function "activities()"
act.list<-c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")
activities<-function(x,act.list){
  act.list[x]
}
activity.test<-lapply(activity.test,activities,act.list)
activity.train<-lapply(activity.train,activities,act.list)
##
## Read features for each test sample, extract mean & std columns, and
## create "test" data frame 
features.test<-read.table("test/X_test.txt")
test<-data.frame(subject.test,activity.test,features.test[feature.indices])
##
## Read features for each training sample, extract mean & std columns, and 
## create "train" data frame 
features.train<-read.table("train/X_train.txt")
train<-data.frame(subject.train,activity.train,features.train[feature.indices])
##
## Merge test and training data frames
merge<-rbind(test,train)
colnames(merge)<-c("subj","activ",feature.names)
##
## Create factor consisting of subject and activity level
f1<-factor(merge$subj)
f2<-factor(merge$activ)
f3<-interaction(f1,f2)
##
## Get column means by factor
s<-split(merge,f3)
t<-lapply(s, function(x) colMeans(x[,feature.names]))
##
## Create tidy data set and output to file "tidystats.csv"
subject<-rep(c(1:30),6)
activity<-c(rep("LAYING",30),rep("SITTING",30),rep("STANDING",30),rep("WALKING",30),
	rep("WALKING_DOWNSTAIRS",30),rep("WALKING_UPSTAIRS",30))
features<-do.call(rbind,t)
write.csv(data.frame(subject,activity,features),file="tidystats.csv",row.names=FALSE)
