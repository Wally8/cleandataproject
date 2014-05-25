# setwd("./Coursera/Getting and Cleaning Data/UCI HAR Dataset") 	# I've excluded the whole folder structure.
xTrain <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE) # Read the X_train file into a data frame
xTest <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)	# Read the X_test file into a data frame
xCombined <- rbind(xTrain, xTest)							# Combine Training and Test sets
features <- read.csv("features.txt", header = FALSE, sep="\t")	# Read the Features.txt file into a list to use for naming columns
colnames(xCombined) <- c(as.character(features$V1[1:561]))	# Name columns with descriptive names from features.txt
stdmean1 <- grepl("std|mean", colnames(xCombined))			# Finds the columns that have Standard Deviation or Mean values of all types
cleanset <- xCombined										# Creates a copy of the combined set to create the start of the clean set
index <- vector(mode = "numeric", length(stdmean1))			# Sets an empty vector of proper length
for (i in 1:length(stdmean1)) {								# Loop that will set values in index for columns that are not standard or mean
	if (stdmean1[i] == FALSE) {
		index[i] <- -i
	}
}
indexval <- index[which(index != 0)]						# Removes 0 values
cleansetfinal <- subset(cleanset, select = c(indexval))		# creates final data set with just standard deviation and means columns
yTrain <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE) # Read the y_train file into a data frame
yTest <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)	# Read the y_test file into a data frame
yCombined <- rbind(yTrain, yTest)							# Combine the y_train and y_test files to on set
cleansetfinal$activities <- yCombined$V1					# Adds activities column to the final clean set
for (i in 1:length(cleansetfinal$activities)) {				# Iterates through Activities column and changes numeric value to 
	if (cleansetfinal$activities[i] == 1) {					# descriptive label
		cleansetfinal$activities[i] <- "WALKING"
	} else if (cleansetfinal$activities[i] == 2) {
		cleansetfinal$activities[i] <- "WALKING_UPSTAIRS"
	} else if (cleansetfinal$activities[i] == 3) {
		cleansetfinal$activities[i] <- "WALKING_DOWNSTAIRS"
	} else if (cleansetfinal$activities[i] == 4) {
		cleansetfinal$activities[i] <- "SITTING"
	} else if (cleansetfinal$activities[i] == 5) {
		cleansetfinal$activities[i] <- "STANDING"
	} else {
		cleansetfinal$activities[i] <- "LAYING"
	}
}
subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE) # Read the subject_train file into a data frame
subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)	# Read the subject_test file into a data frame
subjectCombined <- rbind(subjectTrain, subjectTest)						# Combine the subject_train and subject_test files to on set
cleansetfinal$subject <- subjectCombined$V1								# Adds subject column to the final clean set
write.csv(cleansetfinal, file = "cleansetfinal.csv")


# working folder  "c:/users/%user%/documents/Coursera/Getting and Cleaning Data/UCI HAR Dataset"