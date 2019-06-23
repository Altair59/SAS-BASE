/* Specify the libname */

libname walmart '/folders/myfolders/Walmart';

proc import datafile='/folders/myfolders/Walmart/walmart_train.csv'
dbms = csv
out= walmart.walmart_sales
replace;
getnames= yes;
run;

/* 1. Use proc contents to understand the data types*/

/* 2.  Create a new variable store_char with store info but a characteristic variable */

/* 3. Change the format of weekly_sales into dollar value (the format is DOLLARw.d) */

/* 4.  Create a new variable datev2 from datewith the format like '05MAY10'*/

/* 5. Now use proc contents to understand the structure of the dataset walmart.walmart_sales_chardat. */
/* What is the problem with the data_char variable? */

/* 6. Now create a data variable in walmart.walmart_sales_chardat with the date format YYMMDD10. */

/* 7. Assume that 2010-02-05 is week zero, create a new variable week_num which calculates the number of weeks 
between 2010-02-05 and the date.*/

/* 8. Now we plan to summarize the data by month, can you create a new variable mth_end_date which 
is the end of month date for the data variable?*/
