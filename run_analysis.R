run_analysis <- function() {
    # Import X_train and X_Test data
    X_train_data <- read.table("UCI HAR Dataset/train/X_train.txt")
    X_test_data <- read.table("UCI HAR Dataset/test/X_test.txt")
    X_data <- rbind(X_test_data, X_train_data)
    
    
    # Import Y_train and Y_Test data
    Y_train_data <- read.table("UCI HAR Dataset/train/y_train.txt")
    Y_test_data <- read.table("UCI HAR Dataset/test/y_test.txt")
    Y_data <- rbind(Y_test_data, Y_train_data)
    
    
    # Import subject_train and subject_test data
    Sub_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
    Sub_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
    Sub_data <- rbind(Sub_train, Sub_test)
    
    
    # Import activities data and label Y_data  file
    activities <- read.table("UCI HAR Dataset/activity_labels.txt")
    activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
    Y_data [,1] = activities[Y_data[,1], 2]
    names(Y_data) <- "activity"
    
    
    # Import features.txt file. Extracts only the measurements on the mean and standard 
    # deviation for each measurement. Label the mean and std data set (X_data_m_s) dataset
    features <- read.table("UCI HAR Dataset/features.txt")
    m_s_features <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
    X_data_m_s<-X_data[,m_s_features]
    names(X_data_m_s)<-tolower(gsub("\\(|\\)", "",  features[m_s_features, 2]))
    
    # Label sub_data and combine the datasets to create the tidy data set which is merged 
    # data of test and training data
    names(Sub_data) <- "subject"
    tidy_dataset_A <- cbind(Sub_data, Y_data, X_data_m_s)
    write.table(tidy_dataset_A, "merged_dataset.txt")
    
    # Creates a second, independent tidy data set with the average of each variable 
    # for each activity and each subject. 
    require(reshape2)
    m_data <- melt(tidy_dataset_A, id=c("subject","activity"))
    tidy_avg_data <- dcast(m_data, formula = subject + activity ~ variable, mean)
    write.table(tidy_avg_data, "tidy_dataset.txt")
}
