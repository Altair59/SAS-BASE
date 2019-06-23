/* Specify the libname */

libname text '/folders/myfolders/Text';

/* 1. Remove the extra spaces between David and Cui */

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

data text.name_combine;
set text.name_combine;
name = cat(first_name,last_name);
name1 = compbl(cat(first_name,last_name));
name2 = catx("-", first_name, last_name);
run;

/* 3. Find the length of each name from text.name_combine (space is counted into the 
length.) */

data text.name_combine;
set text.name_combine;
length_name = length(name);
run;

/* 4. Find the last name from the following names */

data text.name_split;
input name $ 1-25;
Cards;
David Johns Cui
John Doe
Jimmy Geroge Sinclair
Kate Lawrance
Lucy Xie
Ray Freeman
;
run;

data text.name_split;
set text.name_split;
last_name = scan(name, countw(name), " ");
run;

data text.name_split;
set text.name_split;
last_name2 = substr(name, find(name, " ") +1, length(name) - find(name, " "));
run;

data text.name_split;
set text.name_split;
last_name = scan(name, 2, " ");
run;

data text.name_combine;
set text.name_combine;
last_name = scan(name2, 2, "-");
run;

/* 5. Find the location of "c" from text.name_split */

data text.name_split;
set text.name_split;
c_loc = index(lowcase(name), "c");
drop last_name;
run;

data text.name_split;
set text.name_split;
c_loc = find(name, "c", -4);
run;

/* 6. Replace space with "-" in text.name_split */

data text.name_split;
set text.name_split;
name = tranwrd(strip(name), " ", "-");
run;


data text.name_split;
set text.name_split;
cnt = countw(name);
run;