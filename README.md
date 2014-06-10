==================================================================

README.md
Getting and Cleaning Data - Course Project
Final version

==================================================================

Author: Amar Gupta

==================================================================


This Course Project submission includes the following files. The Codebook is 
best viewed in Notepad (the Github online view drops this file's formatting).

1) README.md (this file) - Explains the components being submitted as well 
as provides details on running the script.

2) run_analysis.R - The script which processes the raw data into two datasets 
as described by the assignment instructions. Heavily commented.

3) CodeBook.md - Describes the final two datasets as well as the process 
performed to derive them.

4) tidyds.csv - A CSV file containing the second dataset specified in the 
assignment instructions.


==================================================================

Notes on run_analysis.R

==================================================================

The raw data can be transformed into the final two datasets by executing the 
single source file included named "run_analysis.R". 

This script requires:

1) Data is unzipped and file structure hasn't been altered.

2) Data folder (titled "UCI HAR Dataset") is in the root R working directory.

3) "reshape2" library is installed (it doesn't have to be loaded as the script 
will attempt to load it).

At completion, the first dataset will be named "combineddf" and the second 
will be named "tidyds". The script will also output tidyds to a file named 
"tidyds.csv", which is identical to the file named "tidyds.csv" that is 
available in the author's Github repository.