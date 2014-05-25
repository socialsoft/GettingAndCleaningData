Course Project - Getting and Cleaning Data
==========================================

The run_analysis.R script uses a data set from the Samsung Galaxy S smartphone and provides a tidy dataset.  The tidy dataset is a merged dataset of extracted measures and averaged on subject and activity.

A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Source data for the project can be found here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

To use run_analysis.R:
* put zip download in the same directory as script
* unzip the data
* run function run_analysis()

run_analysis() will produce:
* merged_dataset.txt, a 10299x68 space separated file with extracted standard deviation and mean data
* tidy_dataset.txt, a 180x68 space separated file containing the tidy data -- see CodeBook.md for details.
