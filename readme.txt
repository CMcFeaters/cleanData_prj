THe R script "run analysis" does the following:

DOwnloads the zip file from "-"http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"


THe zip file is then connected to and the datafiles contained within are manipulated.

All test data and training data files are combined together to create dataframes of 10K plus rows.  Particular files such as label and subject are used as identifiers for the values in the data tables.

The values in the (9) data tables are used to determine the mean and standard deviation of each row.  these values are then bound into a single dataframe of 10K+ rows and 18 columns.  The identifies of label and user are then appended.

Finally, column names reflecitng the STD and Mean activity values are added.

From this finished dataset, the average values for each of the 18 data values are determined for each Subject then for each activity.  THe outputs are then merged into a single finished dataset.