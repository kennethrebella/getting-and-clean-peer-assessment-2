# Getting and Cleaning Data Peer Assessment 

## Downloading 

**Source:** https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

## Processing Data

###Step 1 

Reads feature names and subsets the applicable columns based on mean and standard deviation 

###Step 2 

Reads the train and test feature data sets and subsets only the desired features using the data from previous step 

### Step 3

Merges the subsetted train and test data frames 

### Step 4 

Steps the merged data column names to the feature names from step 1 

### Step 5 

Reads and merges the train and test activity codes

### Step 6 

Reads activity labels and attaches it the to merged activity codes from step 5

### Step 7 

Reads and merges the train and test subject ids

### Step 8 

Combine the merged subjects and merged activities name subjects.  Adds column names.

### Step 9 

Combines need measures for final data frame

### Step 10 

Aggregates by subject id and activity id, adds column names, and finally writes the data to a file. 

