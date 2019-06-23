/* Specify the libname */

libname bh '/folders/myfolders/Boston House';

/* 1. Read the Boston House Pricing training data into SAS and name it boston_house*/


/* 2. Read through the data dictionary to make sure that you are familiar with the data. 
Now, Create another new dataset with ID and price only, name it boston_house_price. */




/* 4. Create a dataset (name boston_house_edu) which only contains records with pupil_teacher less than 10.
How many records are there?*/

data bh.boston_house_edu;
set bh.boston_house;
where ptratio < 18;
run;


/* 5. Create a dataset (name boston_house_age_ind) which contains a new variable age_ind that distinguishes
whether the age is higher than 30 or not */

/* 6. Read through the following SAS script and find if there is a problem with the logic. */

data bh.boston_house_age_ind_2;
set bh.boston_house;
if age > 100 then age_ind = 1;
else if age < 100 then age_ind = 0;
run;

/* 7. Now run the script from question 6. Create a new dataset (name boston_hourse_null_ind) which contains all of the 
data with missing age indicator*/
