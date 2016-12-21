---
title: "CodeBook.md"
author: "Peter van der Linden"
date: "21 december 2016"
output: html_document
---

## R Markdown


Here are the data for the project:
        https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

download and unpack to local file system.

performed goals:
a. Merges the training and the test sets to create one data set.
b. Extracts only the measurements on the mean and standard deviation for each measurement.
c. Uses descriptive activity names to name the activities in the data set
d. Appropriately labels the data set with descriptive variable names.
e. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

...as follows:
open file 1
open file 2
merge file1, file2
add column names
select columns by name (only std, mean)
merge with activity labels and subjects
merge with activity names
create summary:  average of each variable for each activity and each subject.
create output file (output.txt)

input files:

\\getdata_projectfiles_UCI HAR Dataset\\UCI HAR Dataset\\test\\X_test.txt               test results
\\getdata_projectfiles_UCI HAR Dataset\\UCI HAR Dataset\\train\\X_train.txt             train results
\\getdata_projectfiles_UCI HAR Dataset\\UCI HAR Dataset\\features.txt                   names for the measurement columns  
\\getdata_projectfiles_UCI HAR Dataset\\UCI HAR Dataset\\test\\y_test.txt               activity labels
\\getdata_projectfiles_UCI HAR Dataset\\UCI HAR Dataset\\train\\y_train.txt             activity labels
\\getdata_projectfiles_UCI HAR Dataset\\UCI HAR Dataset\\test\\subject_test.txt         subject id's for test data
\\getdata_projectfiles_UCI HAR Dataset\\UCI HAR Dataset\\train\\subject_train.txt       subject id's for train data
\\getdata_projectfiles_UCI HAR Dataset\\UCI HAR Dataset\\activity_labels.txt            meaningfull names for the activities

output file:   \\getdata_projectfiles_UCI HAR Dataset\\UCI HAR Dataset\\output.txt


