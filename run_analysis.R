test <- read.table("./UCI HAR Dataset/test/X_test.txt")
train <- read.table("./UCI HAR Dataset/train/X_train.txt")

library(dplyr)
activity_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")[[1]]
test <- mutate(test, activity = activity_test, .before = 1)
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")[[1]]
test <- mutate(test, subject = subject_test, .before = 1)

activity_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")[[1]]
train <- mutate(train, activity = activity_train, .before = 1)
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")[[1]]
train <- mutate(train, subject = subject_train, .before = 1)

data <- rbind(test, train)


variable_names <- read.table("./UCI HAR Dataset/features.txt")
data <- data[grepl("mean|std", variable_names[[2]])]
names(data) <- c("subject", 
                 "activity", 
                 variable_names[[2]][grepl("mean|std", variable_names[[2]])]
                 )

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
data$activity <- as.character(data$activity)

for (i in as.character(1:6)) {
    data$activity[data$activity == i] <- activity_labels[[2]][as.numeric(i)]
}
data$activity <- factor(data$activity, levels = activity_labels[[2]])

data <- group_by(data, activity, subject)
new_data <- summarise_all(data, mean)
data <- ungroup(data)
new_data