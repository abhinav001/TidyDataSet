README for SCRIPT: run_analysis.r 

	HIGH LEVEL DESCRIPTION
	Reads in the "Human Activity Recognition Using Smartphones Dataset Version 1.0" dataset and creates two tidy datasets.
		1. Merges the training and testing datasets with select features for each measurement with descriptive labels and variable names
		2. A dataset with the average values of selected features for each activity aand subject pair. 

	ANALYSIS PROCESS FLOW
	Following steps are taken in creating the datasets per specified requirements
		Step 1: Load original dataset in 
		Step 2: Identify all feature indexes that contain mean() and std() in names only at the end. 
				If mean and std appear in the middle they are not included
		Step 3: Create a name vector for column names including ID variables and clean up variable names
				remove special characters such as "()" and replace "-" by "_"
				Name conventions are kept largely the same to keep it intuitive when referencing original set. Just special characters are removed to avoid interpretation issues by R
		Step 4: Prepare Train set for merging with test set
				Subset train data by relevant features identified in Step 2
				Add identifier columns for Subject ID, and Activity labels
		Step 5: Prepare test dataset for merging following actions in Step 4
		Step 6: Merge processed train and test data to form a single dataset
		Step 7: Assign descriptive column names prepared in Step 3
		Step 8: Order merged data by Subject ID and Activity type
		Step 9: Assign descriptive names to Activity Labels as given in activity_labels.txt
		Step10: Create independent Tidy Dataset for Step 5 by computing mean for each combination pair of SubjectID and Activity type
		Step11: Write data to "ActivityData.txt"
		
	RECORD DESCRIPTION
	In the first tidy dataset for each record following is included:
		- Subject ID: an integer in range 1 to 30 idntifying 30 participants of the study
		- Activity: an activity label from possible 6 activity types 
		- 66 Feature Vectors that include only mean and standard deviation features computed on Accelerometer and Gyroscope signals preprocessed in time and frequency domains
		- Each feature vector contains 10299 time series elements
		
	In the second tidy dataset for each record following is included:
		- Subject ID: an integer in range 1 to 30 idntifying 30 participants of the study
		- Activity: an activity label from possible 6 activity types 
		- 66 Feature Values that compute the average of all feature vectors for each combination pair of SubjectID and Activity type 
		
	FILE LIST
		The submission includes the following files:
		- 'README.txt'
		- 'run_analysis.r': The primary script that reads, merges, and reshapes data as decribed in requirements
		- original dataset (are expected to be in the working directory) so those files are not listed here	

	REFERENCE TO ORIGINAL DATASET
		Dataset Name: 
			Human Activity Recognition Using Smartphones Dataset Version 1.0
		Point of Contact:
			Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
			Smartlab - Non Linear Complex Systems Laboratory
			DITEN - Università degli Studi di Genova.
			Via Opera Pia 11A, I-16145, Genoa, Italy.
			activityrecognition@smartlab.ws
			www.smartlab.ws
		Experiment Description:
			The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

			The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 



