/* Specify the libname */

libname walmart '/folders/myfolders/Walmart';

proc import datafile='/folders/myfolders/Walmart/walmart_train.csv'
dbms = csv
out= walmart.walmart_sales
replace;
getnames= yes;
run;

data walmart.walmart_sales_datechar;
set walmart.walmart_sales;
date_char = put(date, YYMMDD10.);
run;

/* 1. Use proc contents to understand the data types*/

proc contents data = walmart.walmart_sales_datechar;
run;

/* 2.  Create a new variable store_char with store info but a characteristic variable */

data walmart.walmart_sales;
set walmart.walmart_sales;
store_char = put(store, $2.);
run;

/* 3. Change the format of weekly_sales into dollar value (the format is DOLLARw.d) */

data walmart.walmart_sales;
set walmart.walmart_sales;
format weekly_sales dollar10.2;
run;

/* 4.  Create a new variable datev2 from datewith the format like '05MAY10'*/

data walmart.walmart_sales;
set walmart.walmart_sales;
format datev2 DATE7.;
datev2=date;
run;




/* 5. Now use proc contents to understand the structure of the dataset walmart.walmart_sales_chardat. */
/* What is the problem with the data_char variable? */

proc contents data = walmart.walmart_sales_chardat;
run;

/* 6. Now create a data variable in walmart.walmart_sales_chardat with the date format YYMMDD10. */

data walmart.walmart_sales_chardat;
set walmart.walmart_sales_chardat;
format datev2 YYMMDD10.;
datev2 = input(date_char, YYMMDD10.);
run;

/* 7. Assume that 2010-02-05 is week zero, create a new variable week_num which calculates the number of weeks 
between 2010-02-05 and the date.*/

data walmart.walmart_sales;
set walmart.walmart_sales;
week_num = intck('week', MDY(2,05,2010), date);
run;

/* 8. Now we plan to summarize the data by month, can you create a new variable mth_end_date which 
is the end of month date for the data variable?*/

data walmart.walmart_sales;
set walmart.walmart_sales;
format mth_end_date YYMMDD10.;
mth_end_date = intnx('month', date, 0, 'end');
/* drop week_num week_num2; */
run;

