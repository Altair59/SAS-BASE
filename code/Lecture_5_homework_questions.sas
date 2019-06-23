/* Specify the libname */

libname text '/folders/myfolders/Text';

/* 1. Use the following code to create the name_split. Can you chang the format of the name  */
/* from David Cui to CUI, David? */

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

data text.name_split;
set text.name_split;
first_name = scan(name, 1, " ");
last_name = scan(name, 2, " ");
run;

data text.name_split;
set text.name_split;
new_name = compbl(upcase(last_name) || ", " || first_name);
run;



/* 2. Use the following code to generate an address dataset. Can you find the State of those  */
/* addresses? */

data text.address;
input address $ 1-50;
cards;
23 Lower River Street Rockaway, NY 11691
955 Sherman Court Plattsburgh, NY 12901
33 Taylor Lane Downingtown, PA 19335
9053 W. Willow Rd. Bemidji, MN 56601
69 Edgefield Rd. Duluth, GA 30096
9124 Woodside Lane Dundalk, MD 21222
8410 Gulf Street Park, FL 32065
225 Fairview Street Stoughton, MA 02072
;
run;

data text.address;
set text.address;
state = substr(address, length(address) -7, 2);
run;


/* 3 (Challenging). Use the address dataset again. Can you find the city of those addresses  */
/* (like Rockaway, Plattsburgh)? */
/* Hint: this is a challenging question. You may need to use COUNTW or COUNT functions which  */
/* are not covered in the lecture. However, I recommend you to do some research on those functions */
/* and try this question if you have time.  */

data text.address;
set text.address;
before_comma = scan(address, 1, ",");
run;

data text.address;
set text.address;
city = scan(before_comma, countw(before_comma), " ");
run;

/* Recommended by David */

data text.address;
set text.address;
city_2 = scan(address, countw(address)-2, " ");
run;

data text.address;
set text.address;
city_3 = tranwrd(city_2, ",", "");
run;

/* Recommended by Eve */

data text.address;
set text.address;
city_4 = tranwrd(scan(address, -3, " "), ",", "");
run;

