#Getting and Cleaning Data - Course Project - Code Book

####Data source:

Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2)
1 - Smartlab - Non-Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova, Genoa (I-16145), Italy. 
2 - CETpD - Technical Research Centre for Dependency Care and Autonomous Living
Universitat Politècnica de Catalunya (BarcelonaTech). Vilanova i la Geltrú (08800), Spain
activityrecognition '@' smartlab.ws 


####Data Set Information:
#######The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
#######The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.
#######Check the README.txt file for further details about this dataset. 


####The set of variables that were estimated from these signals are: 
######mean(): Mean value
######std(): Standard deviation
######mad(): Median absolute deviation 
######max(): Largest value in array
######min(): Smallest value in array
######sma(): Signal magnitude area
######energy(): Energy measure. Sum of the squares divided by the number of values. 
######iqr(): Interquartile range 
######entropy(): Signal entropy
######arCoeff(): Autoregression coefficients with Burg order equal to 4
######correlation(): Correlation coefficient between two signals
######maxInds(): Index of the frequency component with largest magnitude
######meanFreq(): Weighted average of the frequency components to obtain a mean frequency
######skewness(): Skewness of the frequency domain signal 
######kurtosis(): Kurtosis of the frequency domain signal 
######bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
######angle(): Angle between some vectors.
######Unit
No unit of measures is reported as all features were normalized and bounded within [-1,1].

####Getting and Cleaning Data

The raw data sets are download and processed with run_analisys.R script to create a tidy data set.

#####1. Merges the training and the test sets to create one data set.
######Download the data and put the data in the "projectData" folder
######Unzip the data
######Read the test and train data into the variables
######Combine the train and test data
######Give names from feature.txt to variables
######Combine col of datasets to get all data

#####2. Extracts only the measurements on the mean and standard deviation for each measurement. 
######Use grepl function to extract the mean and standard deviation for each measurement

#####3. Uses descriptive activity names from activity_labels.txt to name the activities in the data set

#####4. Use gsub function to appropriately labels the data set with descriptive variable names

#####5.Use aggregate function in plyr package to create a second, independent tidy data set with the average of each variable for each activity and each subject.
All the values are means and standard deviation, aggregated over 30 subjects and 6 activities, hence the resulting dataset is 180 rows by 68 columns:
######1) 6 activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
######2) 30 subjects: 1, 3, 5, 6, 7, 8, 11, 14, 15, 16, 17, 19, 21, 22, 23, 25, 26, 27, 28, 29, 30


