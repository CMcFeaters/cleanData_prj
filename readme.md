THe R script "run analysis" does the following:

DOwnloads the zip file from "-"http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"


THe zip file is then connected to and the datafiles contained within are manipulated.

AlTThe test and training data, subjects and activities  are combined to make 3  test/train data files.
THe activity numbers are replaced with activity names.
The data files are grep'd to find only mean and std files.
The 3 files are then combined to create a complete tidy data set.

From this set, the files are melted with the ID=subject and activity and the variables being all remaining columns

These are then cast between to show the mean of each subject for each activity

