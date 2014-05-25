## Documentation for run_analysis.R script

### Description

The exercise is to take various files containing pieces of data and combine it into one tidy data set.

The script "run_analysis.R" will read in and combine the training and test data files and combine them as well as add descriptive column names. 
Addtionally it will strip out all but the columns that have Mean and Standard Deviation values as required by the assignment. 
Then it will add columns for the Activities with descriptive names and for the subject who performed the activities. 
Finally it will write a "cleansetfinal.csv" file to the working directory that will be the final tidy data set.

The script will run through a series of operations that will do the following:

* Read the X_train file into a data frame

* Read the X_test file into a data frame

* Combine Training and Test sets

* Read the Features.txt file into a list to use for naming columns

* Name columns with descriptive names from features.txt

* Finds the columns that have Standard Deviation or Mean values of all types

* Creates a copy of the combined set to create the start of the clean set

* Sets an empty vector of proper length

* Loop that will set values in index for columns that are not standard or mean

* Removes 0 values from index vector

* creates final data set with just standard deviation and means columns

* Read the y_train file into a data frame

* Read the y_test file into a data frame

* Combine the y_train and y_test files to on set

* Adds activities column to the final clean set

* Iterates through Activities column and changes numeric value to descriptive label

* Read the subject_train file into a data frame

* Read the subject_test file into a data frame

* Combine the subject_train and subject_test files to on set

* Adds subject column to the final clean set

* Writes a .CSV file that contains the final tidy data set

This completes the process to turn the various files into a tidy data set