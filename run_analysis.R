## Download data files and extract datasets
download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
              destfile = "Dataset.zip", method = "curl")
unzip("Dataset.zip")

## Step 1
# Merging the training and test sets
setwd("~/Desktop/Coursera/UCI HAR Dataset/train")
x_train <- read.table("X_train.txt")
y_train <- read.table("y_train.txt")
subject_train <- read.table("subject_train.txt")

setwd("~/Desktop/Coursera/UCI HAR Dataset/test")
x_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")
subject_test <- read.table("subject_test.txt")

x_data <- rbind(x_train, x_test)

y_data <- rbind(y_train, y_test)

subject_data <- rbind(subject_train, subject_test)

## Step 2
# Extracting only the measurements on the mean and standard deviation for each measurement
setwd("~/Desktop/Coursera/UCI HAR Dataset")
features <- read.table("features.txt")

mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

x_data <- x_data[, mean_and_std_features]

names(x_data) <- features[mean_and_std_features, 2]

## Step 3
# Using descriptive activity names to name the activities in the data set
activities <- read.table("activity_labels.txt")

y_data[, 1] <- activities[y_data[, 1], 2]

names(y_data) <- "activity"

## Step 4
# Labelling appropriately the data set with descriptive variable names
names(subject_data) <- "subject"

all_data <- cbind(x_data, y_data, subject_data)

## Step 5
# Creating an independent tidy data set with the average of each variable for each activity and each subject.
averages_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(averages_data, "averages_data.txt", row.name=FALSE)