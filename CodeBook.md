Code Book for the final course project.

Overview:

The source of the original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip the detail description of the study is available from the below site:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
	
The script run_analysis.R executes the following tasks in sequence to:
	a) clean up the data downloaded data
	b) add meaningful names to the dataset
	c) and create aggregated small dataset
		
Below are details documentions of the program - run_analysis.R. A readme.md is also provided explaining how to run the program.

Preprocessing:

1. Download the original data from the site - https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and save it under work user’s work directory - “data” folder. A new folder “data” will be created the program, when executed first time.

2. The program prepares the data analysis process by unzipping the files.

Data Analysis:

1.	Merge the training and test sets to create one data set.

	2. Reads features.txt and uses only the measurements on the mean and standard deviation 
                   for each measurement.

2.	Reads activity_labels.txt and applies understandable activity names in the data set.

3.	Labels the data set with descriptive names.
 
4.	Merges the features with activity labels and subject IDs. The result is saved as in a           dataset named - avg_df, average data frame.

	6. Calculate the average of each measurement for each activity and each subject is merged to
                  a second data set. The result is saved as TidyFinalAverageDS.txt.






Variables:

The following section describes the name of the major variables that used in the program.

	- destZDir 	- Destination directory where Zip is downloaded from the website.
	- trg_dir 	– variable name that stores path of target directory
	- train_dir	 - variable name that stores the path for training data directory
	- test_dir 	- variable name that stores the path for test  data directory
	- t1 		- temporary variable to hold training data set
	- t2 		- temporary variable to hold teast  data set
	- X_DF 		- contains data frame for combined training and test X datasets
                                            (test/X_test.txt, train/X_train.txt)
	- S_DF 		- contains data frame for combined training and test subject datasets
                                              (test/subject_test.txt, train/subject_train.txt)
	- Y_DF		- contains data frame for combined training and test Y datasets
                                             (test/Y_test.txt, train/Y_train.txt)
	- feat_ds 	- variable to hold features data table
	- mean_std_idx - variable to hold the indices of mean and std measurement from feature data 
                                          table
	- act_df 	- variable to hold activity_label data table
	- avg_ds 	- variable to hold the data set with average of each variable for each activity 
                                        and subject


Output:  
	The final dataset name is TidyFinalAverageDS.txt, will be available in the user's work 
               directory's "data" folder.
	: The table is of a 180x68 data frame
	: The first column contains subject IDs.
	: The second column contains activity names.
	: The averages for each of the 66 attributes are in columns 3 to 68.

