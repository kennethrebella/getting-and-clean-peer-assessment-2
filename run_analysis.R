## Set working Directory 

setwd("~/Documents/Coursera/getting-and-clean-peer-assessment-2")

##Step 1 
### Reading feature names and subsetting the applicable columns 
feature_names <- read.table("UCI HAR Dataset/features.txt")
subset <- grep("std|mean", feature_names$V2)

##Step 2
## Reading the train and test feature data sets and subset only the desired features
train <- read.table("UCI HAR Dataset/train/X_train.txt")
train_subset <- train[,subset]
test <- read.table("UCI HAR Dataset/test/X_test.txt")
test_subset <- test[,subset]

##Step 3 
## merge the two subsets 
merged_x <- rbind(train_subset, test_subset)

## Step 4 
## Set column names 
colnames(merged_x) <- feature_names[subset, 2]

## Step 5 
## Reads and combine the train and test activity codes
train_y <- read.table("UCI HAR Dataset/train/y_train.txt")
test_y <- read.table("UCI HAR Dataset/test/y_test.txt")
merged_y <- rbind(train_y, test_y)

## Step 6
## Reads activity labels and attach to activity codes
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
merged_y$activity <- factor(merged_y$V1, levels = activity_labels$V1, labels = activity_labels$V2)

## Step 7
# Reads and merges the train and test subject ids
train_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
merged_subjects <- rbind(train_subjects, test_subjects)

## Step 8
## Combine the merged subjects and merged activities name subjects. Adds column names
sub_act <- cbind(merged_subjects, merged_activities$activity)
colnames(sub_act) <- c("subject_id", "activity_id")

## Step 9
## Combines need measures for final data frame
final <- cbind(sub_act, merged_x)

## Step 10 
## Aggregates by subject id and activity id, adds column names, and finally writes the data to a file. 
result <- aggregate(final[,3:81], by = list(final$subject_id, final$activity_id), FUN = mean)
colnames(result)[1:2] <- c("subject.id", "activity")
write.table(result, file="final_data.txt", row.names = FALSE)


