# CookBook

## The raw data structure
The raw data have been organized as below:

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

**Note:** Inertial Signals are excluded and not used in this project.

## Featuers Information
According to the researchers' description, the features are introduced as below:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ</br>
tGravityAcc-XYZ</br>
tBodyAccJerk-XYZ</br>
tBodyGyro-XYZ</br>
tBodyGyroJerk-XYZ</br>
tBodyAccMag</br>
tGravityAccMag</br>
tBodyAccJerkMag</br>
tBodyGyroMag</br>
tBodyGyroJerkMag</br>
fBodyAcc-XYZ</br>
fBodyAccJerk-XYZ</br>
fBodyGyro-XYZ</br>
fBodyAccMag</br>
fBodyAccJerkMag</br>
fBodyGyroMag</br>
fBodyGyroJerkMag</br>

The set of variables that were estimated from these signals are: 

mean(): Mean value</br>
std(): Standard deviation</br>
mad(): Median absolute deviation</br>
max(): Largest value in array</br>
min(): Smallest value in array</br>
sma(): Signal magnitude area</br>
energy(): Energy measure. Sum of the squares divided by the number of values.</br>
iqr(): Interquartile range</br>
entropy(): Signal entropy</br>
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals</br>
maxInds(): index of the frequency component with largest magnitude</br>
meanFreq(): Weighted average of the frequency components to obtain a mean frequency</br>
skewness(): skewness of the frequency domain signal</br>
kurtosis(): kurtosis of the frequency domain signal</br>
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.</br>
angle(): Angle between to vectors.</br>

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean</br>
tBodyAccMean</br>
tBodyAccJerkMean</br>
tBodyGyroMean</br>
tBodyGyroJerkMean</br>

The complete list of variables of each feature vector is available in 'features.txt'

## Steps of the run_analysis.R script
The script works in 6 steps to make a tidy data set:

0- Downloading the data files as a zip file.

1- Merging the training and the test sets to create one data set.

2- Extracting only the measurements on the mean and standard deviation for each measurement.

3- Using descriptive activity names to name the activities in the data set.

4- Labeling the data set with descriptive variable names.

5- Creating a tidy data set with the average of each variable for each activity and each subject.

