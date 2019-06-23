/* Specify the libname */

libname walmart '/folders/myfolders/Walmart';

/* 1. Import the data features.csv into SAS and check its data structure. */

proc import datafile='/folders/myfolders/Walmart/features.csv'
dbms = csv
out= walmart.features
replace;
getnames= yes;
run;

proc contents data= walmart.features;
run;

/* 2. Change fuel price into dollar format. */

data walmart.features;
set walmart.features;
format fuel_price dollar10.2;
run;

/* 3. Change Unemployment into the percentage format. 
Note: You will need to do some calculation first. Also for percentage format, use Google :)*/

data walmart.features;
set walmart.features;
unemployment = unemployment/100.00;
run;

data walmart.features;
set walmart.features;
format unemployment percent8.2;
run;

/* 4. To analyze the data by year and quarter, create a variable date_year and 
date_quarter that captures the year and quarter of the date.*/

data walmart.features;
set walmart.features;
date_year = year(date);
date_qtr = qtr(date);
run;

/* 5. To analyze the data by quarter, we need a variable that can be used to 
identify the year and quarter. Can you try to create such a variable?
Note: There are several ways to accompolish this. Try to come out with more than
one method.*/

data walmart.features;
set walmart.features;
format date yyq5.;
run;


data walmart.features;
set walmart.features;
format qtr_end_date YYMMDD10.;
qtr_end_date = intnx('qtr', date, 0, 'end');
run;

data walmart.features;
set walmart.features;
drop quater_var;
run;


data walmart.features;
set walmart.features;
quarter_var = date_year ||'-Q'|| date_qtr;
run;

/* 6. To analyze the data by month, we would like to treat Feb 2010 as month 0 and create a new 
variable month_num as the number of months since Feb 2010. Can you create such a variable?*/

data walmart.features;
set walmart.features;
month_num = intck('month', mdy(2,1,2010), date);
run;


