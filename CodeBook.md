#Code Book for run_analysis.R

##Variables

The final dataset contains the following variables:

**subject** - an ID of the subject from which the data was collected.  **Units:** No units.  Ranges from 1 to 30.

**activity** - a character string indicating the activity that was being performed when the sample was collected.  **Units:** **activity** will have one of the following values:

- WALKING
- WALKING_UPSTAIRS
- WALKING_DOWNSTAIRS
- SITTING
- STANDING
- LAYING

**sensorname** - an identifier indicating the measurand associated with the measurement.  The name is in the format of:

*<measurement_domain\>.<instrument\>[.axis].<statistic\>* where:

*measurement_domain* is the measurement domain (time or frequency), 

*instrument* is the measurement sensor (accelerometer or gyroscope), 

*axis* is the measurement axis (X,Y,Z) if applicable, and 

*statistic* is the statistical computation applied to the original data (mean or standard deviation).

**sensormean** is the calculated mean for the collection of measurements for the associated **sensorname**, **activity**, and **subject** .  **Units:** For accelerometer data, the units are standard gravity units (*g*).  For gyroscopic data, the units are radians / sec.  

##Data

The original data is available at: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##Data Preparation

All data preparation is performed by the script *run_analysis.R* which is contained in this package.  The operation of this script is described in the associated README.md file.  No other preparation or clean up work was performed on this data set.
