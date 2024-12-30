SELECT * FROM amazondb ; 
/* Feature engineering : 
1. Add a new column named timeofday to give insight of sales in the Morning, Afternoon and Evening.
 This will help answer the question on which part of the day most sales are made. */  
 
 ALTER TABLE amazondb
 ADD COLUMN timeofday VARCHAR(15) ; 
 
 SET SQL_SAFE_UPDATES = 0;
 UPDATE amazondb 
 SET timeofday = CASE 
	WHEN HOUR(Tr_Time) BETWEEN 6 AND 11 THEN 'Morning'
	WHEN HOUR(Tr_Time) BETWEEN 12 AND 17 THEN 'Afternoon'
	WHEN HOUR(Tr_Time) BETWEEN 18 AND 23 THEN 'Evening'
    ELSE 'Night' 
END ; 

SELECT * FROM amazondb ;  

/* 2. Add a new column named dayname that contains the extracted days of the week
on which the given transaction took place (Mon, Tue, Wed, Thur, Fri). 
This will help answer the question on which week of the day each branch is busiest. */ 
 
-- Step 1: Adding the 'dayname' column
ALTER TABLE amazondb ADD COLUMN dayname VARCHAR(10); 
-- Step 2: Update the 'dayname' column with abbreviated day names 
UPDATE amazondb
SET dayname = DATE_FORMAT( Transition_Date , '%a'); 

/* 3. Add a new column named monthname that contains the extracted months of the year 
on which the given transaction took place (Jan, Feb, Mar). 
Help determine which month of the year has the most sales and profit. */ 

-- Step 1: Add the 'monthname' column
ALTER TABLE amazondb ADD COLUMN monthname VARCHAR(10);

-- Step 2: Update the 'monthname' column based on the 'transaction_date'
UPDATE amazondb
SET monthname = DATE_FORMAT(STR_TO_DATE(Transition_Date, '%Y-%m-%d'), '%b')
WHERE STR_TO_DATE(Transition_Date, '%Y-%m-%d') IS NOT NULL; 

Select * from amazondb ; 

-- Step 3: Query to find the month with the most sales and profit
SELECT monthname, SUM(Total) AS total_sales, SUM(gross_income) AS total_profit 
FROM amazondb
GROUP BY monthname
ORDER BY total_sales DESC 
LIMIT 5 ;



