##Data Source

Source of the original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

The attached R script (run_analysis.R) performs the following 

##A.Import of files and merge

1. Merges the training and test sets to create one data set, namely
X_test and X_train merged into X_data
Y_test and Y_Train merged into Y_data
subject_Test and subject_Train into Sub_Data

##B.Transformations

Appends the label to each of the file and then merge X_data_m_s, Y_data and Sub_Data to make it as single tidy data set.

1.Reads file features.txt and extracts only the measurements on the mean and standard deviation for each measurement.
The result is stored in X_data_m_s a 10299 x 66 data frame. All measurements appear to be floating point numbers in the range (-1, 1).

2.Reads activity_labels.txt and applies descriptive activity names to name the activities in the data set. All names() are converted into lowercase
 
3.Then it merges the 10299x66 data frame containing features with 10299x1 data frames containing activity labels and subject IDs.The result is saved as merged_tidy_data.txt, a 10299x68 data frame.

##C.Final Computation

Finally, the script creates a second, independent tidy data set with the average of each measurement for each activity and each subject.

This uses melt function for transposing the data. Then uses dcast function to calcuate averages grouped on the basis of activity and subject.

The result is saved as tidy_dataset.txt, a 180x68 data frame. There are 30 subjects and 6 activities, thus 180 rows in this dataset.

##D.Variables Description in tidy_data.txt
* subject -- The Id of each subject        
* activity
  * walking
  * walkingupstairs
  * walkingdownstairs
  * sitting
  * standing
  * laying				
* The mean for each measure for the combination of subject and activity
  * tbodyacc-mean-x
  * tbodyacc-mean-y
  * tbodyacc-mean-z
  * tbodyacc-std-x
  * tbodyacc-std-y
  * tbodyacc-std-z
  * tgravityacc-mean-x
  * tgravityacc-mean-y
  * tgravityacc-mean-z
  * tgravityacc-std-x
  * tgravityacc-std-y
  * tgravityacc-std-z
  * tbodyaccjerk-mean-x
  * tbodyaccjerk-mean-y
  * tbodyaccjerk-mean-z
  * tbodyaccjerk-std-x
  * tbodyaccjerk-std-y
  * tbodyaccjerk-std-z
  * tbodygyro-mean-x
  * tbodygyro-mean-y
  * tbodygyro-mean-z
  * tbodygyro-std-x
  * tbodygyro-std-y
  * tbodygyro-std-z
  * tbodygyrojerk-mean-x
  * tbodygyrojerk-mean-y
  * tbodygyrojerk-mean-z
  * tbodygyrojerk-std-x
  * tbodygyrojerk-std-y
  * tbodygyrojerk-std-z
  * tbodyaccmag-mean
  * tbodyaccmag-std
  * tgravityaccmag-mean
  * tgravityaccmag-std
  * tbodyaccjerkmag-mean
  * tbodyaccjerkmag-std
  * tbodygyromag-mean
  * tbodygyromag-std
  * tbodygyrojerkmag-mean
  * tbodygyrojerkmag-std
  * fbodyacc-mean-x
  * fbodyacc-mean-y
  * fbodyacc-mean-z
  * fbodyacc-std-x
  * fbodyacc-std-y
  * fbodyacc-std-z
  * fbodyaccjerk-mean-x
  * fbodyaccjerk-mean-y
  * fbodyaccjerk-mean-z
  * fbodyaccjerk-std-x
  * fbodyaccjerk-std-y
  * fbodyaccjerk-std-z
  * fbodygyro-mean-x
  * fbodygyro-mean-y
  * fbodygyro-mean-z
  * fbodygyro-std-x
  * fbodygyro-std-y
  * fbodygyro-std-z
  * fbodyaccmag-mean
  * fbodyaccmag-std
  * fbodybodyaccjerkmag-mean
  * fbodybodyaccjerkmag-std
  * fbodybodygyromag-mean
  * fbodybodygyromag-std
  * fbodybodygyrojerkmag-mean
  * fbodybodygyrojerkmag-std
