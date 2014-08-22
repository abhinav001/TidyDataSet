
## Read feature names and ientify indices for relevant features to subset X dataframes
features <- read.table("features.txt")

## identify relevant features - i.e. the features with mean and std in their names
## METHOD 1: Identifies all feature indexes that contain mean and std in names - returns 79 matches - NOT USED IN THIS ASSIGNMENT
## f1<- grep("-mean()|-std()", features$V2) 

## METHOD 2: Identifies all feature indexes that contain mean() and std() in names only at the end - returns 66 matches
f2<- sort(c(grep("-mean()", features$V2, fixed = TRUE), grep("-std()", features$V2, fixed = TRUE)))

col_headers <- c("SubjectID", "Activity", as.character(features$V2[f2]))
col_headers <- gsub("-", "_", col_headers)
col_headers <- gsub("\\()", "", col_headers)

## Prepare Train set for merging with test set
X_train <- read.table("./train/X_train.txt") ## dim(X_train) is 7352 x 561
X_train <- X_train[,f2]						 ## dim(X_train) is 7352 x 66 due to subsetting
train_set <- cbind(SubjectID = read.table("./train/subject_train.txt"), Activity=read.table("./train/y_train.txt"), X_train,  deparse.level = 1)
# names(train_set)<- col_headers

## Prepare Test set for merging with train set
X_test <- read.table("./test/X_test.txt")	 ## dim(X_train) is 2947 x 561
X_test <- X_test[,f2]						 ## dim(X_train) is 2947 x 66 due to subsetting
test_set <- cbind(SubjectID = read.table("./test/subject_test.txt"), Activity=read.table("./test/y_test.txt"), X_test,  deparse.level = 1)
# names(test_set)<- col_headers

## Merge train and test datasets to create a total_set
total_set <- rbind(train_set, test_set)

## Assign descriptive column names
names(total_set)<- col_headers

## Order total_set by Subject ID and Activity type
ordered_set <- total_set[order(total_set$SubjectID, total_set$Activity),]

## Assign descriptive names to Activity Labels
activity_labels = read.table("activity_labels.txt")
ordered_set$Activity <- activity_labels$V2[ordered_set$Activity]

## Creating Independent Tidy Dataset for Step 5
tidy_data <- aggregate(ordered_set, by=list(ordered_set$SubjectID, ordered_set$Activity), FUN = mean)
tidy_data$SubjectID <- NULL
tidy_data$Activity <- NULL
names(tidy_data)<- col_headers

## Save tidy data to a text file
write.table(tidy_data, file = "ActivityData.txt")





