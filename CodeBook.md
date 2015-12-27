## Code Book
### Introduction. Script Workflow
The script uploaded in this repo performs the 5 steps assigned in the Project Course.
* First, data is merged using `rbind()` function.
* Second, I subset the data to obtain only the measurements with mean and standard deviation. After this, the correct names are extracted from `features.txt`.
* Third, I take the activity names from `activity_labels.txt` and I change it into dataset.
* Fourth, I perform a correction into vague columns in whole dataset.
* Fifth, I generate a new dataset with the average measures for each individual and type of activity (180 rows). The output file is `average_data.txt`.

### Variables
* `x_train`, `y_train`, `x_test`, `y_test`, `subject_train` and `subject_test` contain the data from the zip files downloaded previously.
* `x_data`, `y_data` and `subject_data` are created from merging the previous dataset.
* `features` are the correct names for the `x_data` dataset, which will be the column names stored in `mean_and_std_features`. 
* `all_data` merges `x_data`, `y_data` and `subject_data` in a dataset.
* `averages_data` contains the relevant averages which will be stored in a `.txt` file. I use `ddply()` from the plyr package is used to apply `colMeans()`.