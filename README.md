# TidyDataSet
Contains scripts to tidy data from UCI Machine learning repository. Source: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

## run_analysis.R
This file takes the raw data provided from the source cited above and transforms it into a a tidy dataset.
It does this first by collapsing the many files into a single data frame mostly using functions provided in the dplyr package.
Then we labels variables and activities to make them more readable.
Finally it removes all variables not relating to mean or standard deviation measurements.
The output new_data is a table of the mean of each of the variables relating to mean and standard deviation grouped by the subject for which those measurements were taken and the activity the subject was doing.

## Code Book
This file contains a list of all the variables in new_data as well as information on how the measurements were taken provided by the original source.

## Acknowledgments
This data set as well as much of the information contained in these files was provided by the following:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
