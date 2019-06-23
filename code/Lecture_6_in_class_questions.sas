/* Specify the libname */

libname walmart '/folders/myfolders/Walmart';

/* 1. Create two datasets data_a and data_b based on slide 4. */

/* 2. Sorted both of the datasets by order_id.*/

/* 3. Try to use inner join, left join, right join, and full join for  */
/* data_a and data_b. */

/* 4. Now, merge the Walmart train data and features data together and 
create a new dataset. */

/* 5. Now, merge the Walmart train data and features data together and 
create a new dataset. */

proc import datafile='/folders/myfolders/Walmart/walmart_train.csv'
dbms = csv
out= walmart.walmart_sales
replace;
getnames= yes;
run;

proc import datafile='/folders/myfolders/Walmart/features.csv'
dbms = csv
out= walmart.features
replace;
getnames= yes;
run;