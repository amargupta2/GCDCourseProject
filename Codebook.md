==================================================================

Codebook.md
Getting and Cleaning Data - Course Project
Final version

==================================================================

Author: Amar Gupta

==================================================================

This file describes the process (Study Design) and then contents and 
structure of the two datasets created by the run_analysis.R script file. The 
first dataset is a data frame named combineddf and the second is a data frame 
named tidyds. 


==================================================================

Study Design

==================================================================

The raw data is part of the project described at this url:

	http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The course project for Getting and Cleaning Data required us to perform two 
manipulations of this original data:

1) Build a unified dataset that combined the training and testing datasets 
created by the researchers.

2) Build a tidy dataset that only includes averages of the values for each 
variable for each subject/activity combination.


For Step 1, my script:

1) Reads the training and testing set into separate variables, then merges 
these into separate data frames and renames the columns using the features.txt 
file.

2) Uses rbind to merge the training and testing set into a single data frame 
named combineddf.

3) Filters the datasets based on string-matching columns that don't have mean 
or std in their name. This choice was based on assignment instructions.

4) Renames the columns to make them more readable. The author chose to substitute
Time for variables prefixed with "t" and Frequency for variables prefixed 
with "f". The author also removed "()" because he felt they hindered readability. 
Note that Acc stands for Accelerometer and Gyro stands for Gyroscope. The 
author felt that expanding these abbreviations would make the variable names 
even longer and harder to read so chose to leave them as is. The author also
replaced duplicate "BodyBody" sequences with a single "Body" because they 
appeared to be an error.


For Step 2, my script:

1) Builds the second dataset requested by the assignment using melt and dcast. 
This dataset follows tidy guidelines as described further below.

2) Writes this data frame to a CSV file named tidyds.csv for easy opening in 
MS Excel.

The data frame tidyds contains the mean for each variable left in the dataset 
after the manipulations performed in Step 1 above by subject and activity 
combination. This dataset is tidy because:

	1) Each fixed and measured variable from the original dataset is in its own 
	column. Fixed variables (subject and activity) are presented first.

	2) Each row represents the summary of observations for a given subject
	and activity combination. (It is assumed that all measurements are linked. For
	example, "TimeBodyAcc-mean-X" and "FrequencyBodyGyroJerkMag-meanFreq" are 
	both recorded for each measurement, which links them as a single observation.)


======Excluded Variables======

Numerous variables were dropped from the original dataset because they didn't 
appear to represent either a mean or standard deviation. They are listed in 
Appendix A. All of these appear to be continuous variables of type numeric.


==================================================================

Code Book

==================================================================

This section describes the variables included in each dataset.


======combineddf (Product of Step 1)======

This dataset contains 10,300 rows: 1 header row and 10,299 rows that represent 
a measured observation for the given subject and activity combination.

This dataset contains 81 columns. They are laid out in the table below. 

----------------------------------------------------------------------------------------------------------------------
Variable Name				Class		Description			Range
----------------------------------------------------------------------------------------------------------------------
subject					integer		Test subject identifier		1 to 30
activity				character	Activity description		LAYING, SITTING, STANDING, 
											WALKING, WALKING_DOWNSTAIRS, 
											WALKING_UPSTAIRS
TimeBodyAcc-mean-X			numeric		Accelerometer measurement	-1 to 1
TimeBodyAcc-mean-Y			numeric		Accelerometer measurement	-1 to 1
TimeBodyAcc-mean-Z			numeric		Accelerometer measurement	-1 to 1
TimeBodyAcc-std-X			numeric		Accelerometer measurement	-1 to 1
TimeBodyAcc-std-Y			numeric		Accelerometer measurement	-1 to 1
TimeBodyAcc-std-Z			numeric		Accelerometer measurement	-1 to 1
TimeGravityAcc-mean-X			numeric		Accelerometer measurement	-1 to 1
TimeGravityAcc-mean-Y			numeric		Accelerometer measurement	-1 to 1
TimeGravityAcc-mean-Z			numeric		Accelerometer measurement	-1 to 1
TimeGravityAcc-std-X			numeric		Accelerometer measurement	-1 to 1
TimeGravityAcc-std-Y			numeric		Accelerometer measurement	-1 to 1
TimeGravityAcc-std-Z			numeric		Accelerometer measurement	-1 to 1
TimeBodyAccJerk-mean-X			numeric		Accelerometer measurement	-1 to 1
TimeBodyAccJerk-mean-Y			numeric		Accelerometer measurement	-1 to 1
TimeBodyAccJerk-mean-Z			numeric		Accelerometer measurement	-1 to 1
TimeBodyAccJerk-std-X			numeric		Accelerometer measurement	-1 to 1
TimeBodyAccJerk-std-Y			numeric		Accelerometer measurement	-1 to 1
TimeBodyAccJerk-std-Z			numeric		Accelerometer measurement	-1 to 1
TimeBodyGyro-mean-X			numeric		Gyroscope measurement		-1 to 1
TimeBodyGyro-mean-Y			numeric		Gyroscope measurement		-1 to 1
TimeBodyGyro-mean-Z			numeric		Gyroscope measurement		-1 to 1
TimeBodyGyro-std-X			numeric		Gyroscope measurement		-1 to 1
TimeBodyGyro-std-Y			numeric		Gyroscope measurement		-1 to 1
TimeBodyGyro-std-Z			numeric		Gyroscope measurement		-1 to 1
TimeBodyGyroJerk-mean-X			numeric		Gyroscope measurement		-1 to 1
TimeBodyGyroJerk-mean-Y			numeric		Gyroscope measurement		-1 to 1
TimeBodyGyroJerk-mean-Z			numeric		Gyroscope measurement		-1 to 1
TimeBodyGyroJerk-std-X			numeric		Gyroscope measurement		-1 to 1
TimeBodyGyroJerk-std-Y			numeric		Gyroscope measurement		-1 to 1
TimeBodyGyroJerk-std-Z			numeric		Gyroscope measurement		-1 to 1
TimeBodyAccMag-mean			numeric		Accelerometer measurement	-1 to 1
TimeBodyAccMag-std			numeric		Accelerometer measurement	-1 to 1
TimeGravityAccMag-mean			numeric		Accelerometer measurement	-1 to 1
TimeGravityAccMag-std			numeric		Accelerometer measurement	-1 to 1
TimeBodyAccJerkMag-mean			numeric		Accelerometer measurement	-1 to 1
TimeBodyAccJerkMag-std			numeric		Accelerometer measurement	-1 to 1
TimeBodyGyroMag-mean			numeric		Gyroscope measurement		-1 to 1
TimeBodyGyroMag-std			numeric		Gyroscope measurement		-1 to 1
TimeBodyGyroJerkMag-mean		numeric		Gyroscope measurement		-1 to 1
TimeBodyGyroJerkMag-std			numeric		Gyroscope measurement		-1 to 1
FrequencyBodyAcc-mean-X			numeric		Accelerometer measurement	-1 to 1
FrequencyBodyAcc-mean-Y			numeric		Accelerometer measurement	-1 to 1
FrequencyBodyAcc-mean-Z			numeric		Accelerometer measurement	-1 to 1
FrequencyBodyAcc-std-X			numeric		Accelerometer measurement	-1 to 1
FrequencyBodyAcc-std-Y			numeric		Accelerometer measurement	-1 to 1
FrequencyBodyAcc-std-Z			numeric		Accelerometer measurement	-1 to 1
FrequencyBodyAcc-meanFreq-X		numeric		Accelerometer measurement	-1 to 1
FrequencyBodyAcc-meanFreq-Y		numeric		Accelerometer measurement	-1 to 1
FrequencyBodyAcc-meanFreq-Z		numeric		Accelerometer measurement	-1 to 1
FrequencyBodyAccJerk-mean-X		numeric		Accelerometer measurement	-1 to 1
FrequencyBodyAccJerk-mean-Y		numeric		Accelerometer measurement	-1 to 1
FrequencyBodyAccJerk-mean-Z		numeric		Accelerometer measurement	-1 to 1
FrequencyBodyAccJerk-std-X		numeric		Accelerometer measurement	-1 to 1
FrequencyBodyAccJerk-std-Y		numeric		Accelerometer measurement	-1 to 1
FrequencyBodyAccJerk-std-Z		numeric		Accelerometer measurement	-1 to 1
FrequencyBodyAccJerk-meanFreq-X		numeric		Accelerometer measurement	-1 to 1
FrequencyBodyAccJerk-meanFreq-Y		numeric		Accelerometer measurement	-1 to 1
FrequencyBodyAccJerk-meanFreq-Z		numeric		Accelerometer measurement	-1 to 1
FrequencyBodyGyro-mean-X		numeric		Gyroscope measurement		-1 to 1
FrequencyBodyGyro-mean-Y		numeric		Gyroscope measurement		-1 to 1
FrequencyBodyGyro-mean-Z		numeric		Gyroscope measurement		-1 to 1
FrequencyBodyGyro-std-X			numeric		Gyroscope measurement		-1 to 1
FrequencyBodyGyro-std-Y			numeric		Gyroscope measurement		-1 to 1
FrequencyBodyGyro-std-Z			numeric		Gyroscope measurement		-1 to 1
FrequencyBodyGyro-meanFreq-X		numeric		Gyroscope measurement		-1 to 1
FrequencyBodyGyro-meanFreq-Y		numeric		Gyroscope measurement		-1 to 1
FrequencyBodyGyro-meanFreq-Z		numeric		Gyroscope measurement		-1 to 1
FrequencyBodyAccMag-mean		numeric		Accelerometer measurement	-1 to 1
FrequencyBodyAccMag-std			numeric		Accelerometer measurement	-1 to 1
FrequencyBodyAccMag-meanFreq		numeric		Accelerometer measurement	-1 to 1
FrequencyBodyAccJerkMag-mean		numeric		Accelerometer measurement	-1 to 1
FrequencyBodyAccJerkMag-std		numeric		Accelerometer measurement	-1 to 1
FrequencyBodyAccJerkMag-meanFreq	numeric		Accelerometer measurement	-1 to 1
FrequencyBodyGyroMag-mean		numeric		Gyroscope measurement		-1 to 1
FrequencyBodyGyroMag-std		numeric		Gyroscope measurement		-1 to 1
FrequencyBodyGyroMag-meanFreq		numeric		Gyroscope measurement		-1 to 1
FrequencyBodyGyroJerkMag-mean		numeric		Gyroscope measurement		-1 to 1
FrequencyBodyGyroJerkMag-std		numeric		Gyroscope measurement		-1 to 1
FrequencyBodyGyroJerkMag-meanFreq	numeric		Gyroscope measurement		-1 to 1
----------------------------------------------------------------------------------------------------------------------


======tidyds (Product of Step 2)======

This dataset contains 181 rows: 1 header row and 180 rows that represent each 
subject (of which there are 30) and activity (of which there are 6) combination. 
Each row includes the average value for each variable for each subject and
activity combination identified in the first two columns of that row. 

This dataset contains 81 columns. They are laid out in the table below. 

----------------------------------------------------------------------------------------------------------------------
Variable Name				Class		Description			Range
----------------------------------------------------------------------------------------------------------------------
subject					integer		Test subject identifier		1 to 30
activity				character	Activity description		LAYING, SITTING, STANDING, 
											WALKING, WALKING_DOWNSTAIRS,
											WALKING_UPSTAIRS
TimeBodyAcc-mean-X			numeric		Accelerometer measurement	0.2215982 to 0.3014610
TimeBodyAcc-mean-Y			numeric		Accelerometer measurement	-0.040513953 to -0.001308288
TimeBodyAcc-mean-Z			numeric		Accelerometer measurement	-0.15251390 to -0.07537847
TimeBodyAcc-std-X			numeric		Accelerometer measurement	-0.9960686 to 0.6269171
TimeBodyAcc-std-Y			numeric		Accelerometer measurement	-0.9902409 to 0.6169370
TimeBodyAcc-std-Z			numeric		Accelerometer measurement	-0.9876587 to 0.6090179
TimeGravityAcc-mean-X			numeric		Accelerometer measurement	-0.6800432 to 0.9745087
TimeGravityAcc-mean-Y			numeric		Accelerometer measurement	-0.4798948 to 0.9565938
TimeGravityAcc-mean-Z			numeric		Accelerometer measurement	-0.4950887 to 0.9578730
TimeGravityAcc-std-X			numeric		Accelerometer measurement	-0.9967642 to -0.8295549
TimeGravityAcc-std-Y			numeric		Accelerometer measurement	-0.9942476 to -0.6435784
TimeGravityAcc-std-Z			numeric		Accelerometer measurement	-0.9909572 to -0.6101612
TimeBodyAccJerk-mean-X			numeric		Accelerometer measurement	0.0426881 to 0.1301930
TimeBodyAccJerk-mean-Y			numeric		Accelerometer measurement	-0.03868721 to 0.05681859
TimeBodyAccJerk-mean-Z			numeric		Accelerometer measurement	-0.06745839 to 0.03805336
TimeBodyAccJerk-std-X			numeric		Accelerometer measurement	-0.9946045 to 0.5442730
TimeBodyAccJerk-std-Y			numeric		Accelerometer measurement	-0.9895136 to 0.3553067
TimeBodyAccJerk-std-Z			numeric		Accelerometer measurement	-0.99328831 to 0.03101571
TimeBodyGyro-mean-X			numeric		Gyroscope measurement		-0.2057754 to 0.1927045
TimeBodyGyro-mean-Y			numeric		Gyroscope measurement		-0.20420536 to 0.02747076
TimeBodyGyro-mean-Z			numeric		Gyroscope measurement		-0.0724546 to 0.1791021
TimeBodyGyro-std-X			numeric		Gyroscope measurement		-0.9942766 to 0.2676572
TimeBodyGyro-std-Y			numeric		Gyroscope measurement		-0.9942105 to 0.4765187
TimeBodyGyro-std-Z			numeric		Gyroscope measurement		-0.9855384 to 0.5648758
TimeBodyGyroJerk-mean-X			numeric		Gyroscope measurement		-0.15721254 to -0.02209163
TimeBodyGyroJerk-mean-Y			numeric		Gyroscope measurement		-0.07680899 to -0.01320228
TimeBodyGyroJerk-mean-Z			numeric		Gyroscope measurement		-0.092499853 to -0.006940664
TimeBodyGyroJerk-std-X			numeric		Gyroscope measurement		-0.9965425 to 0.1791486
TimeBodyGyroJerk-std-Y			numeric		Gyroscope measurement		-0.9970816 to 0.2959459
TimeBodyGyroJerk-std-Z			numeric		Gyroscope measurement		-0.9953808 to 0.1932065
TimeBodyAccMag-mean			numeric		Accelerometer measurement	-0.9864932 to 0.6446043
TimeBodyAccMag-std			numeric		Accelerometer measurement	-0.9864645 to 0.4284059
TimeGravityAccMag-mean			numeric		Accelerometer measurement	-0.9864932 to 0.6446043
TimeGravityAccMag-std			numeric		Accelerometer measurement	-0.9864645 to 0.4284059
TimeBodyAccJerkMag-mean			numeric		Accelerometer measurement	-0.9928147 to 0.4344904
TimeBodyAccJerkMag-std			numeric		Accelerometer measurement	-0.9946469 to 0.4506121
TimeBodyGyroMag-mean			numeric		Gyroscope measurement		-0.9807408 to 0.4180046
TimeBodyGyroMag-std			numeric		Gyroscope measurement		-0.9813727 to 0.2999760
TimeBodyGyroJerkMag-mean		numeric		Gyroscope measurement		-0.99732253 to 0.08758166
TimeBodyGyroJerkMag-std			numeric		Gyroscope measurement		-0.9976661 to 0.2501732
FrequencyBodyAcc-mean-X			numeric		Accelerometer measurement	-0.9952499 to 0.5370120
FrequencyBodyAcc-mean-Y			numeric		Accelerometer measurement	-0.9890343 to 0.5241877
FrequencyBodyAcc-mean-Z			numeric		Accelerometer measurement	-0.9894739 to 0.2807360
FrequencyBodyAcc-std-X			numeric		Accelerometer measurement	-0.9966046 to 0.6585065
FrequencyBodyAcc-std-Y			numeric		Accelerometer measurement	-0.9906804 to 0.5601913
FrequencyBodyAcc-std-Z			numeric		Accelerometer measurement	-0.9872248 to 0.6871242
FrequencyBodyAcc-meanFreq-X		numeric		Accelerometer measurement	-0.6359130 to 0.1591236
FrequencyBodyAcc-meanFreq-Y		numeric		Accelerometer measurement	-0.3795185 to 0.4665282
FrequencyBodyAcc-meanFreq-Z		numeric		Accelerometer measurement	-0.5201148 to 0.4025326
FrequencyBodyAccJerk-mean-X		numeric		Accelerometer measurement	-0.9946308 to 0.4743173
FrequencyBodyAccJerk-mean-Y		numeric		Accelerometer measurement	-0.9893988 to 0.2767169
FrequencyBodyAccJerk-mean-Z		numeric		Accelerometer measurement	-0.9920184 to 0.1577757
FrequencyBodyAccJerk-std-X		numeric		Accelerometer measurement	-0.9950738 to 0.4768039
FrequencyBodyAccJerk-std-Y		numeric		Accelerometer measurement	-0.9904681 to 0.3497713
FrequencyBodyAccJerk-std-Z		numeric		Accelerometer measurement	-0.993107760 to -0.006236475
FrequencyBodyAccJerk-meanFreq-X		numeric		Accelerometer measurement	-0.5760440 to 0.3314493
FrequencyBodyAccJerk-meanFreq-Y		numeric		Accelerometer measurement	-0.6019714 to 0.1956773
FrequencyBodyAccJerk-meanFreq-Z		numeric		Accelerometer measurement	-0.6275555 to 0.2301079
FrequencyBodyGyro-mean-X		numeric		Gyroscope measurement		-0.9931226 to 0.4749624
FrequencyBodyGyro-mean-Y		numeric		Gyroscope measurement		-0.9940255 to 0.3288170
FrequencyBodyGyro-mean-Z		numeric		Gyroscope measurement		-0.9859578 to 0.4924144
FrequencyBodyGyro-std-X			numeric		Gyroscope measurement		-0.9946522 to 0.1966133
FrequencyBodyGyro-std-Y			numeric		Gyroscope measurement		-0.9943531 to 0.6462336
FrequencyBodyGyro-std-Z			numeric		Gyroscope measurement		-0.9867253 to 0.5224542
FrequencyBodyGyro-meanFreq-X		numeric		Gyroscope measurement		-0.3957702 to 0.2492094
FrequencyBodyGyro-meanFreq-Y		numeric		Gyroscope measurement		-0.6668148 to 0.2731413
FrequencyBodyGyro-meanFreq-Z		numeric		Gyroscope measurement		-0.5074909 to 0.3770741
FrequencyBodyAccMag-mean		numeric		Accelerometer measurement	-0.9868006 to 0.5866376
FrequencyBodyAccMag-std			numeric		Accelerometer measurement	-0.9876485 to 0.1786846
FrequencyBodyAccMag-meanFreq		numeric		Accelerometer measurement	-0.3123380 to 0.4358469
FrequencyBodyAccJerkMag-mean		numeric		Accelerometer measurement	-0.9939983 to 0.5384048
FrequencyBodyAccJerkMag-std		numeric		Accelerometer measurement	-0.9943667 to 0.3163464
FrequencyBodyAccJerkMag-meanFreq	numeric		Accelerometer measurement	-0.1252104 to 0.4880885
FrequencyBodyGyroMag-mean		numeric		Gyroscope measurement		-0.9865352 to 0.2039798
FrequencyBodyGyroMag-std		numeric		Gyroscope measurement		-0.9814688 to 0.2366597
FrequencyBodyGyroMag-meanFreq		numeric		Gyroscope measurement		-0.4566387 to 0.4095216
FrequencyBodyGyroJerkMag-mean		numeric		Gyroscope measurement		-0.9976174 to 0.1466186
FrequencyBodyGyroJerkMag-std		numeric		Gyroscope measurement		-0.9975852 to 0.2878346
FrequencyBodyGyroJerkMag-meanFreq	numeric		Gyroscope measurement		-0.1829236 to 0.4263017
----------------------------------------------------------------------------------------------------------------------


==================================================================

Appendix A - Excluded Variables

==================================================================

The Excluded variables are all of type numeric.

  [1] tBodyAcc-mad()-X                     tBodyAcc-mad()-Y                     tBodyAcc-mad()-Z                     tBodyAcc-max()-X                    
  [5] tBodyAcc-max()-Y                     tBodyAcc-max()-Z                     tBodyAcc-min()-X                     tBodyAcc-min()-Y                    
  [9] tBodyAcc-min()-Z                     tBodyAcc-sma()                       tBodyAcc-energy()-X                  tBodyAcc-energy()-Y                 
 [13] tBodyAcc-energy()-Z                  tBodyAcc-iqr()-X                     tBodyAcc-iqr()-Y                     tBodyAcc-iqr()-Z                    
 [17] tBodyAcc-entropy()-X                 tBodyAcc-entropy()-Y                 tBodyAcc-entropy()-Z                 tBodyAcc-arCoeff()-X,1              
 [21] tBodyAcc-arCoeff()-X,2               tBodyAcc-arCoeff()-X,3               tBodyAcc-arCoeff()-X,4               tBodyAcc-arCoeff()-Y,1              
 [25] tBodyAcc-arCoeff()-Y,2               tBodyAcc-arCoeff()-Y,3               tBodyAcc-arCoeff()-Y,4               tBodyAcc-arCoeff()-Z,1              
 [29] tBodyAcc-arCoeff()-Z,2               tBodyAcc-arCoeff()-Z,3               tBodyAcc-arCoeff()-Z,4               tBodyAcc-correlation()-X,Y          
 [33] tBodyAcc-correlation()-X,Z           tBodyAcc-correlation()-Y,Z           tGravityAcc-mad()-X                  tGravityAcc-mad()-Y                 
 [37] tGravityAcc-mad()-Z                  tGravityAcc-max()-X                  tGravityAcc-max()-Y                  tGravityAcc-max()-Z                 
 [41] tGravityAcc-min()-X                  tGravityAcc-min()-Y                  tGravityAcc-min()-Z                  tGravityAcc-sma()                   
 [45] tGravityAcc-energy()-X               tGravityAcc-energy()-Y               tGravityAcc-energy()-Z               tGravityAcc-iqr()-X                 
 [49] tGravityAcc-iqr()-Y                  tGravityAcc-iqr()-Z                  tGravityAcc-entropy()-X              tGravityAcc-entropy()-Y             
 [53] tGravityAcc-entropy()-Z              tGravityAcc-arCoeff()-X,1            tGravityAcc-arCoeff()-X,2            tGravityAcc-arCoeff()-X,3           
 [57] tGravityAcc-arCoeff()-X,4            tGravityAcc-arCoeff()-Y,1            tGravityAcc-arCoeff()-Y,2            tGravityAcc-arCoeff()-Y,3           
 [61] tGravityAcc-arCoeff()-Y,4            tGravityAcc-arCoeff()-Z,1            tGravityAcc-arCoeff()-Z,2            tGravityAcc-arCoeff()-Z,3           
 [65] tGravityAcc-arCoeff()-Z,4            tGravityAcc-correlation()-X,Y        tGravityAcc-correlation()-X,Z        tGravityAcc-correlation()-Y,Z       
 [69] tBodyAccJerk-mad()-X                 tBodyAccJerk-mad()-Y                 tBodyAccJerk-mad()-Z                 tBodyAccJerk-max()-X                
 [73] tBodyAccJerk-max()-Y                 tBodyAccJerk-max()-Z                 tBodyAccJerk-min()-X                 tBodyAccJerk-min()-Y                
 [77] tBodyAccJerk-min()-Z                 tBodyAccJerk-sma()                   tBodyAccJerk-energy()-X              tBodyAccJerk-energy()-Y             
 [81] tBodyAccJerk-energy()-Z              tBodyAccJerk-iqr()-X                 tBodyAccJerk-iqr()-Y                 tBodyAccJerk-iqr()-Z                
 [85] tBodyAccJerk-entropy()-X             tBodyAccJerk-entropy()-Y             tBodyAccJerk-entropy()-Z             tBodyAccJerk-arCoeff()-X,1          
 [89] tBodyAccJerk-arCoeff()-X,2           tBodyAccJerk-arCoeff()-X,3           tBodyAccJerk-arCoeff()-X,4           tBodyAccJerk-arCoeff()-Y,1          
 [93] tBodyAccJerk-arCoeff()-Y,2           tBodyAccJerk-arCoeff()-Y,3           tBodyAccJerk-arCoeff()-Y,4           tBodyAccJerk-arCoeff()-Z,1          
 [97] tBodyAccJerk-arCoeff()-Z,2           tBodyAccJerk-arCoeff()-Z,3           tBodyAccJerk-arCoeff()-Z,4           tBodyAccJerk-correlation()-X,Y      
[101] tBodyAccJerk-correlation()-X,Z       tBodyAccJerk-correlation()-Y,Z       tBodyGyro-mad()-X                    tBodyGyro-mad()-Y                   
[105] tBodyGyro-mad()-Z                    tBodyGyro-max()-X                    tBodyGyro-max()-Y                    tBodyGyro-max()-Z                   
[109] tBodyGyro-min()-X                    tBodyGyro-min()-Y                    tBodyGyro-min()-Z                    tBodyGyro-sma()                     
[113] tBodyGyro-energy()-X                 tBodyGyro-energy()-Y                 tBodyGyro-energy()-Z                 tBodyGyro-iqr()-X                   
[117] tBodyGyro-iqr()-Y                    tBodyGyro-iqr()-Z                    tBodyGyro-entropy()-X                tBodyGyro-entropy()-Y               
[121] tBodyGyro-entropy()-Z                tBodyGyro-arCoeff()-X,1              tBodyGyro-arCoeff()-X,2              tBodyGyro-arCoeff()-X,3             
[125] tBodyGyro-arCoeff()-X,4              tBodyGyro-arCoeff()-Y,1              tBodyGyro-arCoeff()-Y,2              tBodyGyro-arCoeff()-Y,3             
[129] tBodyGyro-arCoeff()-Y,4              tBodyGyro-arCoeff()-Z,1              tBodyGyro-arCoeff()-Z,2              tBodyGyro-arCoeff()-Z,3             
[133] tBodyGyro-arCoeff()-Z,4              tBodyGyro-correlation()-X,Y          tBodyGyro-correlation()-X,Z          tBodyGyro-correlation()-Y,Z         
[137] tBodyGyroJerk-mad()-X                tBodyGyroJerk-mad()-Y                tBodyGyroJerk-mad()-Z                tBodyGyroJerk-max()-X               
[141] tBodyGyroJerk-max()-Y                tBodyGyroJerk-max()-Z                tBodyGyroJerk-min()-X                tBodyGyroJerk-min()-Y               
[145] tBodyGyroJerk-min()-Z                tBodyGyroJerk-sma()                  tBodyGyroJerk-energy()-X             tBodyGyroJerk-energy()-Y            
[149] tBodyGyroJerk-energy()-Z             tBodyGyroJerk-iqr()-X                tBodyGyroJerk-iqr()-Y                tBodyGyroJerk-iqr()-Z               
[153] tBodyGyroJerk-entropy()-X            tBodyGyroJerk-entropy()-Y            tBodyGyroJerk-entropy()-Z            tBodyGyroJerk-arCoeff()-X,1         
[157] tBodyGyroJerk-arCoeff()-X,2          tBodyGyroJerk-arCoeff()-X,3          tBodyGyroJerk-arCoeff()-X,4          tBodyGyroJerk-arCoeff()-Y,1         
[161] tBodyGyroJerk-arCoeff()-Y,2          tBodyGyroJerk-arCoeff()-Y,3          tBodyGyroJerk-arCoeff()-Y,4          tBodyGyroJerk-arCoeff()-Z,1         
[165] tBodyGyroJerk-arCoeff()-Z,2          tBodyGyroJerk-arCoeff()-Z,3          tBodyGyroJerk-arCoeff()-Z,4          tBodyGyroJerk-correlation()-X,Y     
[169] tBodyGyroJerk-correlation()-X,Z      tBodyGyroJerk-correlation()-Y,Z      tBodyAccMag-mad()                    tBodyAccMag-max()                   
[173] tBodyAccMag-min()                    tBodyAccMag-sma()                    tBodyAccMag-energy()                 tBodyAccMag-iqr()                   
[177] tBodyAccMag-entropy()                tBodyAccMag-arCoeff()1               tBodyAccMag-arCoeff()2               tBodyAccMag-arCoeff()3              
[181] tBodyAccMag-arCoeff()4               tGravityAccMag-mad()                 tGravityAccMag-max()                 tGravityAccMag-min()                
[185] tGravityAccMag-sma()                 tGravityAccMag-energy()              tGravityAccMag-iqr()                 tGravityAccMag-entropy()            
[189] tGravityAccMag-arCoeff()1            tGravityAccMag-arCoeff()2            tGravityAccMag-arCoeff()3            tGravityAccMag-arCoeff()4           
[193] tBodyAccJerkMag-mad()                tBodyAccJerkMag-max()                tBodyAccJerkMag-min()                tBodyAccJerkMag-sma()               
[197] tBodyAccJerkMag-energy()             tBodyAccJerkMag-iqr()                tBodyAccJerkMag-entropy()            tBodyAccJerkMag-arCoeff()1          
[201] tBodyAccJerkMag-arCoeff()2           tBodyAccJerkMag-arCoeff()3           tBodyAccJerkMag-arCoeff()4           tBodyGyroMag-mad()                  
[205] tBodyGyroMag-max()                   tBodyGyroMag-min()                   tBodyGyroMag-sma()                   tBodyGyroMag-energy()               
[209] tBodyGyroMag-iqr()                   tBodyGyroMag-entropy()               tBodyGyroMag-arCoeff()1              tBodyGyroMag-arCoeff()2             
[213] tBodyGyroMag-arCoeff()3              tBodyGyroMag-arCoeff()4              tBodyGyroJerkMag-mad()               tBodyGyroJerkMag-max()              
[217] tBodyGyroJerkMag-min()               tBodyGyroJerkMag-sma()               tBodyGyroJerkMag-energy()            tBodyGyroJerkMag-iqr()              
[221] tBodyGyroJerkMag-entropy()           tBodyGyroJerkMag-arCoeff()1          tBodyGyroJerkMag-arCoeff()2          tBodyGyroJerkMag-arCoeff()3         
[225] tBodyGyroJerkMag-arCoeff()4          fBodyAcc-mad()-X                     fBodyAcc-mad()-Y                     fBodyAcc-mad()-Z                    
[229] fBodyAcc-max()-X                     fBodyAcc-max()-Y                     fBodyAcc-max()-Z                     fBodyAcc-min()-X                    
[233] fBodyAcc-min()-Y                     fBodyAcc-min()-Z                     fBodyAcc-sma()                       fBodyAcc-energy()-X                 
[237] fBodyAcc-energy()-Y                  fBodyAcc-energy()-Z                  fBodyAcc-iqr()-X                     fBodyAcc-iqr()-Y                    
[241] fBodyAcc-iqr()-Z                     fBodyAcc-entropy()-X                 fBodyAcc-entropy()-Y                 fBodyAcc-entropy()-Z                
[245] fBodyAcc-maxInds-X                   fBodyAcc-maxInds-Y                   fBodyAcc-maxInds-Z                   fBodyAcc-skewness()-X               
[249] fBodyAcc-kurtosis()-X                fBodyAcc-skewness()-Y                fBodyAcc-kurtosis()-Y                fBodyAcc-skewness()-Z               
[253] fBodyAcc-kurtosis()-Z                fBodyAcc-bandsEnergy()-1,8           fBodyAcc-bandsEnergy()-9,16          fBodyAcc-bandsEnergy()-17,24        
[257] fBodyAcc-bandsEnergy()-25,32         fBodyAcc-bandsEnergy()-33,40         fBodyAcc-bandsEnergy()-41,48         fBodyAcc-bandsEnergy()-49,56        
[261] fBodyAcc-bandsEnergy()-57,64         fBodyAcc-bandsEnergy()-1,16          fBodyAcc-bandsEnergy()-17,32         fBodyAcc-bandsEnergy()-33,48        
[265] fBodyAcc-bandsEnergy()-49,64         fBodyAcc-bandsEnergy()-1,24          fBodyAcc-bandsEnergy()-25,48         fBodyAcc-bandsEnergy()-1,8          
[269] fBodyAcc-bandsEnergy()-9,16          fBodyAcc-bandsEnergy()-17,24         fBodyAcc-bandsEnergy()-25,32         fBodyAcc-bandsEnergy()-33,40        
[273] fBodyAcc-bandsEnergy()-41,48         fBodyAcc-bandsEnergy()-49,56         fBodyAcc-bandsEnergy()-57,64         fBodyAcc-bandsEnergy()-1,16         
[277] fBodyAcc-bandsEnergy()-17,32         fBodyAcc-bandsEnergy()-33,48         fBodyAcc-bandsEnergy()-49,64         fBodyAcc-bandsEnergy()-1,24         
[281] fBodyAcc-bandsEnergy()-25,48         fBodyAcc-bandsEnergy()-1,8           fBodyAcc-bandsEnergy()-9,16          fBodyAcc-bandsEnergy()-17,24        
[285] fBodyAcc-bandsEnergy()-25,32         fBodyAcc-bandsEnergy()-33,40         fBodyAcc-bandsEnergy()-41,48         fBodyAcc-bandsEnergy()-49,56        
[289] fBodyAcc-bandsEnergy()-57,64         fBodyAcc-bandsEnergy()-1,16          fBodyAcc-bandsEnergy()-17,32         fBodyAcc-bandsEnergy()-33,48        
[293] fBodyAcc-bandsEnergy()-49,64         fBodyAcc-bandsEnergy()-1,24          fBodyAcc-bandsEnergy()-25,48         fBodyAccJerk-mad()-X                
[297] fBodyAccJerk-mad()-Y                 fBodyAccJerk-mad()-Z                 fBodyAccJerk-max()-X                 fBodyAccJerk-max()-Y                
[301] fBodyAccJerk-max()-Z                 fBodyAccJerk-min()-X                 fBodyAccJerk-min()-Y                 fBodyAccJerk-min()-Z                
[305] fBodyAccJerk-sma()                   fBodyAccJerk-energy()-X              fBodyAccJerk-energy()-Y              fBodyAccJerk-energy()-Z             
[309] fBodyAccJerk-iqr()-X                 fBodyAccJerk-iqr()-Y                 fBodyAccJerk-iqr()-Z                 fBodyAccJerk-entropy()-X            
[313] fBodyAccJerk-entropy()-Y             fBodyAccJerk-entropy()-Z             fBodyAccJerk-maxInds-X               fBodyAccJerk-maxInds-Y              
[317] fBodyAccJerk-maxInds-Z               fBodyAccJerk-skewness()-X            fBodyAccJerk-kurtosis()-X            fBodyAccJerk-skewness()-Y           
[321] fBodyAccJerk-kurtosis()-Y            fBodyAccJerk-skewness()-Z            fBodyAccJerk-kurtosis()-Z            fBodyAccJerk-bandsEnergy()-1,8      
[325] fBodyAccJerk-bandsEnergy()-9,16      fBodyAccJerk-bandsEnergy()-17,24     fBodyAccJerk-bandsEnergy()-25,32     fBodyAccJerk-bandsEnergy()-33,40    
[329] fBodyAccJerk-bandsEnergy()-41,48     fBodyAccJerk-bandsEnergy()-49,56     fBodyAccJerk-bandsEnergy()-57,64     fBodyAccJerk-bandsEnergy()-1,16     
[333] fBodyAccJerk-bandsEnergy()-17,32     fBodyAccJerk-bandsEnergy()-33,48     fBodyAccJerk-bandsEnergy()-49,64     fBodyAccJerk-bandsEnergy()-1,24     
[337] fBodyAccJerk-bandsEnergy()-25,48     fBodyAccJerk-bandsEnergy()-1,8       fBodyAccJerk-bandsEnergy()-9,16      fBodyAccJerk-bandsEnergy()-17,24    
[341] fBodyAccJerk-bandsEnergy()-25,32     fBodyAccJerk-bandsEnergy()-33,40     fBodyAccJerk-bandsEnergy()-41,48     fBodyAccJerk-bandsEnergy()-49,56    
[345] fBodyAccJerk-bandsEnergy()-57,64     fBodyAccJerk-bandsEnergy()-1,16      fBodyAccJerk-bandsEnergy()-17,32     fBodyAccJerk-bandsEnergy()-33,48    
[349] fBodyAccJerk-bandsEnergy()-49,64     fBodyAccJerk-bandsEnergy()-1,24      fBodyAccJerk-bandsEnergy()-25,48     fBodyAccJerk-bandsEnergy()-1,8      
[353] fBodyAccJerk-bandsEnergy()-9,16      fBodyAccJerk-bandsEnergy()-17,24     fBodyAccJerk-bandsEnergy()-25,32     fBodyAccJerk-bandsEnergy()-33,40    
[357] fBodyAccJerk-bandsEnergy()-41,48     fBodyAccJerk-bandsEnergy()-49,56     fBodyAccJerk-bandsEnergy()-57,64     fBodyAccJerk-bandsEnergy()-1,16     
[361] fBodyAccJerk-bandsEnergy()-17,32     fBodyAccJerk-bandsEnergy()-33,48     fBodyAccJerk-bandsEnergy()-49,64     fBodyAccJerk-bandsEnergy()-1,24     
[365] fBodyAccJerk-bandsEnergy()-25,48     fBodyGyro-mad()-X                    fBodyGyro-mad()-Y                    fBodyGyro-mad()-Z                   
[369] fBodyGyro-max()-X                    fBodyGyro-max()-Y                    fBodyGyro-max()-Z                    fBodyGyro-min()-X                   
[373] fBodyGyro-min()-Y                    fBodyGyro-min()-Z                    fBodyGyro-sma()                      fBodyGyro-energy()-X                
[377] fBodyGyro-energy()-Y                 fBodyGyro-energy()-Z                 fBodyGyro-iqr()-X                    fBodyGyro-iqr()-Y                   
[381] fBodyGyro-iqr()-Z                    fBodyGyro-entropy()-X                fBodyGyro-entropy()-Y                fBodyGyro-entropy()-Z               
[385] fBodyGyro-maxInds-X                  fBodyGyro-maxInds-Y                  fBodyGyro-maxInds-Z                  fBodyGyro-skewness()-X              
[389] fBodyGyro-kurtosis()-X               fBodyGyro-skewness()-Y               fBodyGyro-kurtosis()-Y               fBodyGyro-skewness()-Z              
[393] fBodyGyro-kurtosis()-Z               fBodyGyro-bandsEnergy()-1,8          fBodyGyro-bandsEnergy()-9,16         fBodyGyro-bandsEnergy()-17,24       
[397] fBodyGyro-bandsEnergy()-25,32        fBodyGyro-bandsEnergy()-33,40        fBodyGyro-bandsEnergy()-41,48        fBodyGyro-bandsEnergy()-49,56       
[401] fBodyGyro-bandsEnergy()-57,64        fBodyGyro-bandsEnergy()-1,16         fBodyGyro-bandsEnergy()-17,32        fBodyGyro-bandsEnergy()-33,48       
[405] fBodyGyro-bandsEnergy()-49,64        fBodyGyro-bandsEnergy()-1,24         fBodyGyro-bandsEnergy()-25,48        fBodyGyro-bandsEnergy()-1,8         
[409] fBodyGyro-bandsEnergy()-9,16         fBodyGyro-bandsEnergy()-17,24        fBodyGyro-bandsEnergy()-25,32        fBodyGyro-bandsEnergy()-33,40       
[413] fBodyGyro-bandsEnergy()-41,48        fBodyGyro-bandsEnergy()-49,56        fBodyGyro-bandsEnergy()-57,64        fBodyGyro-bandsEnergy()-1,16        
[417] fBodyGyro-bandsEnergy()-17,32        fBodyGyro-bandsEnergy()-33,48        fBodyGyro-bandsEnergy()-49,64        fBodyGyro-bandsEnergy()-1,24        
[421] fBodyGyro-bandsEnergy()-25,48        fBodyGyro-bandsEnergy()-1,8          fBodyGyro-bandsEnergy()-9,16         fBodyGyro-bandsEnergy()-17,24       
[425] fBodyGyro-bandsEnergy()-25,32        fBodyGyro-bandsEnergy()-33,40        fBodyGyro-bandsEnergy()-41,48        fBodyGyro-bandsEnergy()-49,56       
[429] fBodyGyro-bandsEnergy()-57,64        fBodyGyro-bandsEnergy()-1,16         fBodyGyro-bandsEnergy()-17,32        fBodyGyro-bandsEnergy()-33,48       
[433] fBodyGyro-bandsEnergy()-49,64        fBodyGyro-bandsEnergy()-1,24         fBodyGyro-bandsEnergy()-25,48        fBodyAccMag-mad()                   
[437] fBodyAccMag-max()                    fBodyAccMag-min()                    fBodyAccMag-sma()                    fBodyAccMag-energy()                
[441] fBodyAccMag-iqr()                    fBodyAccMag-entropy()                fBodyAccMag-maxInds                  fBodyAccMag-skewness()              
[445] fBodyAccMag-kurtosis()               fBodyBodyAccJerkMag-mad()            fBodyBodyAccJerkMag-max()            fBodyBodyAccJerkMag-min()           
[449] fBodyBodyAccJerkMag-sma()            fBodyBodyAccJerkMag-energy()         fBodyBodyAccJerkMag-iqr()            fBodyBodyAccJerkMag-entropy()       
[453] fBodyBodyAccJerkMag-maxInds          fBodyBodyAccJerkMag-skewness()       fBodyBodyAccJerkMag-kurtosis()       fBodyBodyGyroMag-mad()              
[457] fBodyBodyGyroMag-max()               fBodyBodyGyroMag-min()               fBodyBodyGyroMag-sma()               fBodyBodyGyroMag-energy()           
[461] fBodyBodyGyroMag-iqr()               fBodyBodyGyroMag-entropy()           fBodyBodyGyroMag-maxInds             fBodyBodyGyroMag-skewness()         
[465] fBodyBodyGyroMag-kurtosis()          fBodyBodyGyroJerkMag-mad()           fBodyBodyGyroJerkMag-max()           fBodyBodyGyroJerkMag-min()          
[469] fBodyBodyGyroJerkMag-sma()           fBodyBodyGyroJerkMag-energy()        fBodyBodyGyroJerkMag-iqr()           fBodyBodyGyroJerkMag-entropy()      
[473] fBodyBodyGyroJerkMag-maxInds         fBodyBodyGyroJerkMag-skewness()      fBodyBodyGyroJerkMag-kurtosis()      angle(tBodyAccMean,gravity)         
[477] angle(tBodyAccJerkMean),gravityMean) angle(tBodyGyroMean,gravityMean)     angle(tBodyGyroJerkMean,gravityMean) angle(X,gravityMean)                
[481] angle(Y,gravityMean)                 angle(Z,gravityMean)   
