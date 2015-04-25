########Program: run_analysis.R

########### Prepare the environment 
cat("*** Start the Program ** \n")
Sys.time()
if(!file.exists("./data")){dir.create("./data")}

Url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zFile <- "getdata-projectfiles-UCI-HAR-Dataset.zip"
destZDir <- paste("data", zFile, sep="/")
cat("*** Downloading the file please wait for few...\n")
download.file(Url, destZDir , method="auto")
cat("*** Unzipping the file ..\n")

unzip(destZDir, exdir="data")

trg_dir <- setdiff(dir("data"), zFile )
dateDownloaded <- date()
dateDownloaded

####### Merge the training and the test sets to create one data set.

train_dir <-paste("data",trg_dir,"train", sep="/")
test_dir  <-paste("data",trg_dir,"test", sep="/")

t1 <- read.table(paste(train_dir, "X_train.txt", sep="/"))
t2 <- read.table(paste(test_dir, "X_test.txt", sep="/"))
X_DF <- rbind(t1,t2)

t1 <- read.table(paste(train_dir, "subject_train.txt", sep="/"))
t2 <- read.table(paste(test_dir, "subject_test.txt", sep="/"))
S_DF <- rbind(t1,t2)

t1 <- read.table(paste(train_dir, "y_train.txt", sep="/"))
t2 <- read.table(paste(test_dir, "y_test.txt", sep="/"))
Y_DF <- rbind(t1,t2)


### Extracts only the measurements on the mean and standard deviation for each measurement. 
## read features text
feat_ds <- read.table(paste("data", trg_dir, "features.txt", sep="/"))
# grep mean and std measures form features
mean_std_idx <- grep("mean\\(|std\\(", feat_ds[,2])

X_DF <- X_DF[, mean_std_idx]
names(X_DF) <- feat_ds [mean_std_idx, 2]
names(X_DF) <- gsub("\\(|\\)", "", names(X_DF))
names(X_DF) <- toupper(names(X_DF))

#### Uses descriptive activity names to name the activities in the data set

act_df <- read.table(paste("data", trg_dir, "activity_labels.txt", sep="/")) 

act_df[, 2] = gsub("_", "", tolower(as.character(act_df[, 2])))
Y_DF[,1] = act_df[Y_DF[,1], 2]
names(Y_DF) <- "activity"

# 4. Appropriately labels the data set with descriptive activity names.

names(S_DF) <- "subject"
combined <- cbind(S_DF, Y_DF, X_DF)
names(combined ) <- toupper(names(combined )) ## bring the informaty in the column names
###write.table(combined, paste("data", trg_dir,  "tidy_merged_data.txt", sep="/"))

# 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject:
avg_df <- combined [, 3:dim(combined )[2]] 
avg_ds <- aggregate(avg_df,list(combined$SUBJECT, combined$ACTIVITY), mean)
##avg_ds 
##write.csv(avg_ds, paste("data", trg_dir,  "FinalAverageDS.csv", sep="/"))
write.table(avg_ds, paste("data", trg_dir,  "TidyFinalAverageDS.txt", sep="/"),row.name=FALSE)
cat( "** End of process \n\n")
Sys.time()
## end of program
