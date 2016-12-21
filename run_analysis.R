#Here are the data for the project:
#        https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#
#a. Merges the training and the test sets to create one data set.
#b. Extracts only the measurements on the mean and standard deviation for each measurement.
#c. Uses descriptive activity names to name the activities in the data set
#d. Appropriately labels the data set with descriptive variable names.
#e. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.



library(dplyr)

workdir <- getwd()
## private location Peter:  
#workdir <- paste(workdir,"/Coursera/DST/Getting and Cleaning Data",sep="")

#a. Merges the training and the test sets to create one data set.
#open file 1
file1 <- paste(workdir,"/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt",sep="")
file_test <- read.table(file1) 
#open file 2
file2 <- paste(workdir,"/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt",sep="")
file_train <- read.table(file2) 
#merge file1, file2
file_totaal <- rbind(file_test, file_train) 

#column names
column_names <- read.table(paste(workdir,"/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt",sep=""))
#columns to select
column_names_sel <- filter(column_names, grepl(".*mean.*|.*std.*", V2)) 

#select columns by name (std, mean)
file_totaal_1 <- select(file_totaal, column_names_sel[,1]) 

names(file_totaal_1) <- column_names_sel[,2] 

#open activity labels
labels1 <- paste(workdir,"/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt",sep="") 
labels_test <- read.table(labels1) 
#open activity labels
labels2 <- paste(workdir,"/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt",sep="")
labels_train <- read.table(labels2)
#merge
labels_totaal <- rbind(labels_test, labels_train)
names(labels_totaal) <- c("ActivityId")

#open subjects
subjects1 <- paste(workdir,"/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt",sep="")
subjects_test <- read.table(subjects1)
#open subjects
subjects2 <- paste(workdir,"/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt",sep="")
subjects_train <- read.table(subjects2)
#merge
subjects_totaal <- rbind(subjects_test, subjects_train)
names(subjects_totaal) <- c("SubjectId")


#add labels and subjects to data
file_totaal_2 <- cbind(subjects_totaal, labels_totaal, file_totaal_1) 

#read activity names
act_names_file <- paste(workdir,"/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt",sep="") 
act_names <- read.table(act_names_file) 
names(act_names) <- c("ActivityId","ActivityName")  

#merge file met activity names
file_totaal_3 <- merge(file_totaal_2, act_names, by.x="ActivityId",by.y="ActivityId", all=TRUE) 



#create summary:  average of each variable for each activity and each subject.
file_summary <- aggregate(file_totaal_3, list(actName = file_totaal_3$ActivityName, subject = file_totaal_3$SubjectId), mean) 
file_summary_sel <- select(file_summary, -(ActivityName)) 

#create output file (output.txt)
write.table(file_summary_sel, file = paste(workdir,"/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/output.txt",sep=""))


