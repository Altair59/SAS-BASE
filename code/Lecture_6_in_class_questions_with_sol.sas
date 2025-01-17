/* Specify the libname*/

libname walmart '/folders/myfolders/Walmart';

/* 1. Create two datasets data_a and data_b based on slide 4. */

data walmart.data_a;
input order_id order_time MMDDYY10.;
format order_time MMDDYY10.;
cards;
1001 10/5/2017
1002 10/5/2017
1004 10/7/2017
1003 10/6/2017 
1005 10/8/2017
;
run;

data walmart.data_b;
input order_id fulfill_time MMDDYY10.;
format fulfill_time MMDDYY10.;
cards;
1001 10/6/2017
1004 10/9/2017
1002 10/7/2017
2001 10/15/2017
;
run;

/* 2. Sorted both of the datasets by order_id.*/

proc sort data=walmart.data_a;
by /*DESCENDING*/ order_id;
run;

proc sort data=walmart.data_b;
by order_id;
run;

/* 3. Try to use inner join, left join, right join, and full join for  */
/* data_a and data_b. */

data walmart.inner_join;
merge walmart.data_a (in = x) walmart.data_b (in = y);
by order_id;
if x and y;
run;

data walmart.left_join;
merge walmart.data_a (in = x) walmart.data_b (in = y);
by order_id;
if x;
run;

data walmart.right_join;
merge walmart.data_a (in = x) walmart.data_b (in = y);
by order_id;
if y;
run;

data walmart.full_join;
merge walmart.data_a (in = x) walmart.data_b (in = y);
by order_id;
if x or y;
run;

/* 4. Now, merge the Walmart train data and features data together and 
create a new dataset. */

data walmart.multi_set_1;
set walmart.data_a walmart.data_b; 
run;

data walmart.multi_set_2;
set walmart.data_a;
set walmart.data_b;
run;

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

proc sort data = walmart.walmart_sales nodup;
by store date;
run;

proc sort data = walmart.features nodup;
by store date;
run;

data walmart.walmart_join;
merge walmart.walmart_sales (in = x) walmart.features (in = y);
by store date;
if x and y;
run;





