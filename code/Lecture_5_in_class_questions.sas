/* Specify the libname */

libname text '/folders/myfolders/Text';


/* 1. Remove the extra spaces between David and Cui */

Data text.demo;
Input Name $ 1-8;
Cards;
Jim Johns
Dora Lee
Peppa Pig
;
Run;

Data text.compbl;
Input Name $ 1-50 ;
Cards;
David          Cui
;
Run;

data text.compbl;
set text.compbl;
Name = compbl(Name);
run;

/* 2. Combine first name and last name to get the full name */

data text.name_combine;
input first_name $ last_name $;
Cards;
David Cui
John Doe
Jimmy Sinclair
Kate Lawrance
Lucy Xie
Ray Freeman
;
run;

/* 3. Find the length of each name from text.name_combine (space is counted into the 
length.) */

/* 4. Find the last name from the following names */

data text.name_split;
input name $ 1-25;
Cards;
David Cui
John Doe
Jimmy Sinclair
Kate Lawrance
Lucy Xie
Ray Freeman
;
run;

/* 5. Find the location of "c" from text.name_split */

/* 6. Replace space with "-" in text.name_split */
