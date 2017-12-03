=============================================================
run_analysis.R - v1.0
Gene Place
2017.12.03
=============================================================

This script was written to satisfy the course project requirements
for the Getting/Cleaning Data course from Johns Hopkins University
delivered by coursera.org (https://www.coursera.org/learn/data-cleaning/home/welcome).

Usage: run_analysis

This script performs the following actions:
(1) downloads the zipped data set and supporting materials from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
	into the current working directory
(2) unzips the downloaded file into a new 'courseproject' directory
(3) cleans, joins, and performs calculations on the data per the course requirements:
	(a) Merges the training and the test sets to create one data set.
    	(b) Extracts only the measurements on the mean and standard deviation for each measurement.
    	(c) Uses descriptive activity names to name the activities in the data set
    	(d) Appropriately labels the data set with descriptive variable names.
    	(e) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
(4) writes the final data set into the current working directory with the name "tidy.tbl"

BUGS:
This script currently performs no error checking of the download process or the contents of the download, so a failed download will likely cause the script to 
fail as well.
