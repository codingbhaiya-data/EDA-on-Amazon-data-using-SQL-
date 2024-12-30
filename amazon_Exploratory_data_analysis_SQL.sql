-- 1. What is the count of distinct cities in the dataset ? ANS : 3 
SELECT COUNT(DISTINCT(City)) FROM amazondb ;

-- 2. For each branch, what is the corresponding city?  
SELECT DISTINCT (Branch) , city FROM amazondb ; 
/*ANS : A	Yangon
C	Naypyitaw
B	Mandalay  */

-- 3. What is the count of distinct product lines in the dataset?  ANS : 6 
SELECT COUNT(DISTINCT(Product_line)) FROM amazondb ;


 -- 4. Which payment method occurs most frequently?  ANS: Credit card = 345 
SELECT DISTINCT (Payment) , COUNT(*) FROM amazondb 
GROUP BY  Payment 
ORDER BY COUNT(*) DESC ; 

 -- 5. Which product line has the highest sales?   ANS :  Fashion accessories = 1042.65
SELECT DISTINCT (Product_line) , MAX(TOTAL) FROM amazondb 
GROUP BY  Product_line
ORDER BY MAX(TOTAL) DESC  ; 

-- 6. How much revenue is generated each month?
SELECT monthname , SUM(Total) AS revenue FROM amazondb 
GROUP BY monthname ; 

-- 7. In which month did the cost of goods sold reach its peak?  ANS : JAN 
SELECT monthname , SUM(Total) AS revenue FROM amazondb 
GROUP BY monthname
ORDER BY revenue DESC 
LIMIT 1 ; 

-- 8.Which product line generated the highest revenue?     ANS : Food and beverages : 56144.844000000005
SELECT Product_line , SUM(Total) AS revenue FROM amazondb 
GROUP BY Product_line
ORDER BY revenue DESC 
LIMIT 1  ; 

-- 9. In which city was the highest revenue recorded?  ANS : Naypyitaw = 110568.70649999994 
SELECT City , SUM(Total) AS revenue FROM amazondb 
GROUP BY City
ORDER BY revenue DESC 
LIMIT 1  ; 

-- 10. Which product line incurred the highest Value Added Tax? ANS : Food and beverages = 2673.5639999999994
SELECT Product_line , SUM(Tax5_percent) AS highest_Value_Added_Tax FROM amazondb 
GROUP BY Product_line
ORDER BY highest_Value_Added_Tax DESC 
LIMIT 1  ; 

 -- 11. For each product line, add a column indicating "Good" if its sales are above average, otherwise "Bad."

ALTER TABLE amazondb ADD COLUMN sales_rating VARCHAR(10);


CREATE TEMPORARY TABLE temp_avg_sales AS
SELECT product_line, AVG(total) AS avg_sales
FROM amazondb
GROUP BY product_line;

UPDATE amazondb a
JOIN temp_avg_sales t
ON a.product_line = t.product_line
SET sales_rating = CASE
    WHEN Total > t.avg_sales THEN 'Good'
    ELSE 'Bad'
END;

SELECT * FROM amazondb ; 

-- 12.Identify the branch that exceeded the average number of products sold.  Branch A 
SELECT Branch
FROM (
    SELECT Branch, COUNT(Product_line) AS product_line_count
    FROM amazondb
    GROUP BY Branch
) branch_counts
WHERE product_line_count > (
    SELECT AVG(product_line_count)
    FROM (
        SELECT COUNT(Product_line) AS product_line_count
        FROM amazondb
        GROUP BY Branch
    ) avg_counts
)
LIMIT 1;


-- 13 Which product line is most frequently associated with each gender? 
-- Step 1: Calculate the count of each product line per gender
-- Step 1: Calculate the count of each product line per gender
SELECT gender, product_line, COUNT(*) AS product_count
FROM amazondb
GROUP BY gender, product_line
INTO @counts;

-- Step 2: Identify the maximum count for each gender
SELECT gender, MAX(product_count) AS max_count
FROM (
    SELECT gender, product_line, COUNT(*) AS product_count
    FROM amazondb
    GROUP BY gender, product_line
) AS subquery
GROUP BY gender
INTO @max_counts;

-- Step 3: Select the product line with the maximum count for each gender
SELECT counts.gender, counts.product_line, counts.product_count
FROM (
    SELECT gender, product_line, COUNT(*) AS product_count
    FROM amazondb
    GROUP BY gender, product_line
) AS counts
JOIN (
    SELECT gender, MAX(product_count) AS max_count
    FROM (
        SELECT gender, product_line, COUNT(*) AS product_count
        FROM amazondb
        GROUP BY gender, product_line
    ) AS subquery
    GROUP BY gender
) AS max_counts
ON counts.gender = max_counts.gender AND counts.product_count = max_counts.max_count;


 -- Calculate the average rating for each product line. 
SELECT product_line, AVG(Rating) AS average_rating
FROM amazondb
GROUP BY product_line;
 
 -- Count the sales occurrences for each time of day on every weekday. 
 SELECT dayname, timeofday, COUNT(*) AS sales_count
FROM amazondb
GROUP BY dayname, timeofday
ORDER BY FIELD(dayname, 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'), timeofday;


-- Identify the customer type contributing the highest revenue. ANS : Member = 164223.44400000002
SELECT Customer_type, SUM(Total) AS total_revenue
FROM amazondb
GROUP BY Customer_type
ORDER BY total_revenue DESC
LIMIT 1;

SELECT * FROM amazondb ; 

-- Determine the city with the highest VAT payment. 
SELECT city , SUM(Tax5_percent) as Highst_VAT 
FROM amazondb 
GROUP BY city 
ORDER BY city DESC
LIMIT 1 ; 

--  Identify the customer type with the highest VAT payments. MEMBER 
SELECT Customer_type FROM amazondb 
GROUP BY  Customer_type 
ORDER BY MAX(Tax5_percent) DESC 
LIMIT 1  ; 

--  What is the count of distinct customer types in the dataset?  ANS = 2 
SELECT COUNT(DISTINCT(Customer_type)) FROM amazondb ; 

--  What is the count of distinct payment methods in the dataset? ANS = 3 
SELECT COUNT(DISTINCT(Payment)) FROM amazondb ; 

 -- Which customer type occurs most frequently? ANS: MEMEBER 
 SELECT Customer_type , COUNT(Customer_type) FROM amazondb  
 GROUP BY Customer_type 
 ORDER BY COUNT(Customer_type) DESC ; 
 
-- Identify the customer type with the highest purchase frequency. ANS : Member 
SELECT Customer_type , COUNT(Customer_type) FROM amazondb  
GROUP BY Customer_type 
ORDER BY COUNT(Customer_type) DESC
LIMIT 1 ; 

-- Determine the predominant gender among customers. ANS : Female 
SELECT Gender , COUNT(Gender) FROM amazondb  
GROUP BY Gender 
ORDER BY COUNT(Gender) DESC 
LIMIT 1 ; 

--  Examine the distribution of genders within each branch. 
SELECT branch , COUNT(Gender) AS distribution_of_genders  FROM amazondb  
GROUP BY Branch 
ORDER BY COUNT(Gender) DESC  ; 

-- Identify the time of day when customers provide the most ratings. Ans : Afternoon 
SELECT timeofday , COUNT(rating) FROM amazondb 
group by timeofday
ORDER BY MAX(rating) DESC ; 

-- Determine the time of day with the highest customer ratings for each branch. 
SELECT timeofday , Branch , MAX(rating) FROM amazondb 
group by branch , timeofday 
ORDER BY MAX(rating) DESC ;

-- Identify the day of the week with the highest average ratings.  
SELECT dayname ,  AVG(rating) as avg_rating FROM amazondb 
GROUP BY dayname 
ORDER BY avg_rating DESC 
LIMIT 1 ; 

-- Determine the day of the week with the highest average ratings for each branch. 
SELECT dayname , branch,  AVG(rating) as avg_rating FROM amazondb 
GROUP BY dayname , branch 
ORDER BY avg_rating DESC ; 
