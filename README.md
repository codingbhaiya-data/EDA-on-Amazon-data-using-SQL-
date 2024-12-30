# EDA-on-Amazon-data-using-SQL 
The major aim of this project is to gain insight into the sales data of Amazon to understand the different factors that affect sales of the different branches.
### About Data
This dataset contains sales transactions from three different branches of Amazon, respectively located in Mandalay, Yangon and Naypyitaw. The data contains 17 columns and 1000 rows:
| Column | Description | Data Type |
|--------|-------------|-----------|
| invoice_id |Invoice of the sales made | VARCHAR(30)|
| branch | Branch at which sales were made | VARCHAR(5) | 
| city | The location of the branch | VARCHAR(30) | 
| customer_type | The type of the customer| VARCHAR(30) |
| gender | Gender of the customer making purchase | VARCHAR(10) | 
| product_line | Product line of the product sold | VARCHAR(100) | 
| unit_price | The price of each product | DECIMAL(10, 2) | 
| quantity | The amount of the product sold | INT | 
| VAT |The amount of tax on the purchase |FLOAT(6, 4) |
| total | The total cost of the purchase |DECIMAL(10, 2) | 
| date | The date on which the purchase was made | DATE |
| time | The time at which the purchase was made | TIMESTAMP | 
| payment_method | The total amount paid | DECIMAL(10, 2) | 
| cogs | Cost Of Goods sold | DECIMAL(10, 2) | 
| gross_margin_percentage| Gross margin percentage | FLOAT(11, 9) | 
| gross_income | Gross Income | DECIMAL(10, 2) | 
| rating | Rating | FLOAT(2, 1) | 

### Approach Used
- *Data Wrangling:* This is the first step where inspection of data is done to make sure NULL values and missing values are detected and data replacement methods are used to replace missing or NULL values.
1.1 Build a database
1.2 Create a table and insert the data.
1.3 Select columns with null values in them. There are no null values in our database as in creating the tables, we set NOT  NULL for each field, hence null values are filtered out.
  
- *Feature Engineering:* This will help us generate some new columns from existing ones.
2.1 Add a new column named timeofday to give insight of sales in the Morning, Afternoon and Evening. This will help answer the question on which part of the day most sales are made.
2.2 Add a new column named dayname that contains the extracted days of the week on which the given transaction took place (Mon, Tue, Wed, Thur, Fri). This will help answer the question on which week of the day each branch is busiest.
2.3 Add a new column named monthname that contains the extracted months of the year on which the given transaction took place (Jan, Feb, Mar). Help determine which month of the year has the most sales and profit.

- *Exploratory Data Analysis (EDA):* Exploratory data analysis is done to answer the listed questions and aims of this project.

 - *Presentation and story telling*
![Screenshot 2024-12-30 094030](https://github.com/user-attachments/assets/4aa8e6ff-d46d-48f0-8245-51797f562e0f)
![Screenshot 2024-12-30 094035](https://github.com/user-attachments/assets/9de32512-ab92-42d1-ad20-7b27c8cbc35e)
![Screenshot 2024-12-30 094040](https://github.com/user-attachments/assets/59b4f683-af22-46fe-8888-600c609f6f9d)
![Screenshot 2024-12-30 094044](https://github.com/user-attachments/assets/0556e43f-e651-4782-9425-feec65976bde)
![Screenshot 2024-12-30 094049](https://github.com/user-attachments/assets/87b1c459-4edf-44fd-8470-8d61d87ff93f)
![Screenshot 2024-12-30 094054](https://github.com/user-attachments/assets/6c0901bb-544e-4317-941f-3eb51781b248)
![Screenshot 2024-12-30 094057](https://github.com/user-attachments/assets/fb81f36c-aded-4422-9214-7c0a85274e39)
![Screenshot 2024-12-30 094103](https://github.com/user-attachments/assets/fc17c5f1-162a-4e2e-addf-6f1426fa9da3)
![Screenshot 2024-12-30 094107](https://github.com/user-attachments/assets/d3c46a21-ca73-4cfa-aed0-eb6b37bd66b5)
![Screenshot 2024-12-30 094111](https://github.com/user-attachments/assets/75fd5124-0be8-4a28-88b4-030c29cf28b3)
![Screenshot 2024-12-30 094124](https://github.com/user-attachments/assets/108fec18-0fab-4226-b84b-3b84dba482c6)
![Screenshot 2024-12-30 094129](https://github.com/user-attachments/assets/c58b084a-b40b-4603-9d52-de0b14e3284c)
![Screenshot 2024-12-30 094134](https://github.com/user-attachments/assets/c4008485-57d5-4dc7-bea0-dce566dddc1b)
![Screenshot 2024-12-30 094138](https://github.com/user-attachments/assets/4392531c-efd9-4117-af9a-8f0b20c62d76)


