-- creating and using the database
CREATE DATABASE portfolio;
USE portfolio;




DESCRIBE marketing;




-- converting Dt_customer to (date) data type
update marketing
set Dt_customer = date_format(str_to_date(Dt_Customer, '%d/%m/%Y'), '%Y-%m-%d'); 





-- renaming columns of the data
ALTER TABLE marketing RENAME COLUMN MntWines TO Wines;
ALTER TABLE marketing RENAME COLUMN MntFruits TO Fruits;
ALTER TABLE marketing RENAME COLUMN MntFishProducts TO Fish;
ALTER TABLE marketing RENAME COLUMN MntSweetProducts TO Sweets;
ALTER TABLE marketing RENAME COLUMN MntGoldProds TO Gold;
ALTER TABLE marketing RENAME COLUMN MntMeatProducts TO Meat;
ALTER TABLE marketing RENAME COLUMN Dt_Customer TO Date_joined;





-- creating age segment and querying the marital status column
SELECT ID, Year_Birth, Marital_Status,  (2021 - extract(Year from Year_Birth)) AS Age, 
Wines, Fruits, Fish, Sweets, Gold, Meat, Education, Income, Date_Joined,
CASE
	WHEN (2021 - (extract(Year from Year_Birth))) >= 65 THEN "65+"
    WHEN (2021 - (extract(Year from Year_Birth))) >= 55 THEN "55-64"
    WHEN (2021 - (extract(Year from Year_Birth))) >= 45 THEN "45-54"
    WHEN (2021 - (extract(Year from Year_Birth))) >= 35 THEN "35-44"
    ELSE "25-34"
END AS Age_segment
FROM marketing
WHERE Marital_Status = 'Married' OR Marital_Status = 'Single' OR Marital_Status = 'Widow'
OR Marital_Status = 'Divorced'
ORDER BY ID DESC;










