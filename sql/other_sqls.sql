#select all foods (SELECT ...)
SELECT * FROM FOOD;

#select all vegan foods (SELECT ... WHERE ...)
SELECT * FROM FOOD WHERE ISVEGAN = TRUE;

#select all foods order by price (SELECT ... ORDER BY ...)
SELECT * FROM FOOD order BY PRICE;

#select highest price food (SELECT MAX(...))
SELECT CALORIES, ISVEGAN, NAME, max(PRICE) AS PRICE, NAME FROM FOOD;

#select number of foods by menu (SELECT COUNT(1), MENU_ID FROM ... GROUP BY ...)
SELECT MENU_ID, COUNT(*) AS NUMBER_OF_FOOD FROM MENU_FOOD GROUP BY MENU_ID;

#select all restaurants WITH address (SELECT ... FROM ... JOIN ...)
SELECT R.ID AS RESTAURANT_ID, R.NAME, A.CITY, A.COUNTRY, A.STREET, A.ZIPCODE
FROM RESTAURANT R, ADDRESS A 
WHERE R.ID = A.ID;

#select foods available today (SELECT ... FROM ... JOIN ... WHERE ... curdate() BETWEEN FROMDATE AND TODATE)
SELECT * FROM MENU_FOOD MF JOIN FOOD F ON MF.FOODS_ID = F.ID 
JOIN MENU M ON M.ID = MF.MENU_ID
WHERE curdate() BETWEEN FROMDATE AND TODATE;

#update address data of restaurant
UPDATE ADDRESS SET CITY = "budapest" WHERE ID = 1;

#update price of any food
UPDATE FOOD SET PRICE = 850 WHERE NAME LIKE "GULYAS";

#index foods by name to find them very quickly
CREATE INDEX FOOD_NAME_INDEX ON FOOD (NAME);

#CREATE view the select all the foods of all the restaurants with address availabe today.
CREATE OR REPLACE VIEW ALL_FOOD_TODAY AS 
SELECT F.* FROM FOOD F 
JOIN MENU_FOOD all_food_todayMF ON F.ID = MF.FOODS_ID
JOIN MENU M ON M.ID = MF.MENU_ID
WHERE CURRENT_DATE() BETWEEN FROMDATE AND TODATE;

#remove menu #2
DELETE FROM MENU_FOOD WHERE MENU_ID = 2;
DELETE FROM MENU WHERE ID = 2;

#remove all the data from the tables
DELETE FROM MENU_FOOD;
DELETE FROM MENU;
DELETE FROM FOOD;
DELETE FROM RESTAURANT;
DELETE FROM ADDRESS;

#drop all the tables
DROP TABLE MENU_FOOD;
DROP TABLE MENU;
DROP TABLE FOOD;
DROP TABLE RESTAURANT;
DROP TABLE ADDRESS;