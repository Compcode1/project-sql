-- This file contains the SQL queries for the project.

-- Description of the tables and their relationships:

-- Table: customers
-- Contains customer information such as customerNumber, customerName, contact details, etc.
-- Primary Key: customerNumber
-- Relationships: 
--   - salesRepEmployeeNumber references employees(employeeNumber)

-- Table: employees
-- Contains employee information including their office and reporting structure.
-- Primary Key: employeeNumber
-- Relationships:
--   - reportsTo references employees(employeeNumber) for managerial hierarchy.
--   - officeCode references offices(officeCode)

-- Table: offices
-- Contains office information including address and territory.
-- Primary Key: officeCode
-- Relationships: None

-- Table: orders
-- Contains order information including dates and status.
-- Primary Key: orderNumber
-- Relationships:
--   - customerNumber references customers(customerNumber)

-- Table: payments
-- Contains payment details made by customers.
-- Primary Key: (customerNumber, checkNumber)
-- Relationships:
--   - customerNumber references customers(customerNumber)

-- Table: productlines
-- Contains product line information including descriptions and images.
-- Primary Key: productLine
-- Relationships: None

-- Table: products
-- Contains product information including vendor and pricing details.
-- Primary Key: productCode
-- Relationships:
--   - productLine references productlines(productLine)

-- Table: orderdetails
-- Contains details for each order, including product and quantity information.
-- Primary Key: (orderNumber, productCode)
-- Relationships:
--   - orderNumber references orders(orderNumber)
--   - productCode references products(productCode)

-- Query to display the table name, number of attributes, and number of rows

SELECT 
    'customers' AS table_name,
    (SELECT COUNT(*) 
     FROM pragma_table_info('customers')) AS number_of_attributes,
    (SELECT COUNT(*) 
     FROM customers) AS number_of_rows
UNION ALL
SELECT 
    'employees' AS table_name,
    (SELECT COUNT(*) 
     FROM pragma_table_info('employees')) AS number_of_attributes,
    (SELECT COUNT(*) 
     FROM employees) AS number_of_rows
UNION ALL
SELECT 
    'offices' AS table_name,
    (SELECT COUNT(*) 
     FROM pragma_table_info('offices')) AS number_of_attributes,
    (SELECT COUNT(*) 
     FROM offices) AS number_of_rows
UNION ALL
SELECT 
    'orders' AS table_name,
    (SELECT COUNT(*) 
     FROM pragma_table_info('orders')) AS number_of_attributes,
    (SELECT COUNT(*) 
     FROM orders) AS number_of_rows
UNION ALL
SELECT 
    'payments' AS table_name,
    (SELECT COUNT(*) 
     FROM pragma_table_info('payments')) AS number_of_attributes,
    (SELECT COUNT(*) 
     FROM payments) AS number_of_rows
UNION ALL
SELECT 
    'productlines' AS table_name,
    (SELECT COUNT(*) 
     FROM pragma_table_info('productlines')) AS number_of_attributes,
    (SELECT COUNT(*) 
     FROM productlines) AS number_of_rows
UNION ALL
SELECT 
    'products' AS table_name,
    (SELECT COUNT(*) 
     FROM pragma_table_info('products')) AS number_of_attributes,
    (SELECT COUNT(*) 
     FROM products) AS number_of_rows
UNION ALL
SELECT 
    'orderdetails' AS table_name,
    (SELECT COUNT(*) 
     FROM pragma_table_info('orderdetails')) AS number_of_attributes,
    (SELECT COUNT(*) 
     FROM orderdetails) AS number_of_rows;
     -- Query to join the products, orders, and orderdetails tables to include customer and product information
-- and to compute the profit for each customer.

SELECT 
    c.customerNumber,
    SUM(od.quantityOrdered * (od.priceEach - p.buyPrice)) AS profit
FROM
    customers c
    JOIN orders o ON c.customerNumber = o.customerNumber
    JOIN orderdetails od ON o.orderNumber = od.orderNumber
    JOIN products p ON od.productCode = p.productCode
GROUP BY 
    c.customerNumber;
-- Using the previous query as a CTE to find VIP customers and least-engaged customers

-- Query to find the top five VIP customers
WITH CustomerProfit AS (
    SELECT 
        c.customerNumber,
        SUM(od.quantityOrdered * (od.priceEach - p.buyPrice)) AS profit
    FROM
        customers c
        JOIN orders o ON c.customerNumber = o.customerNumber
        JOIN orderdetails od ON o.orderNumber = od.orderNumber
        JOIN products p ON od.productCode = p.productCode
    GROUP BY 
        c.customerNumber
)
SELECT 
    c.contactLastName,
    c.contactFirstName,
    c.city,
    c.country,
    cp.profit
FROM 
    CustomerProfit cp
    JOIN customers c ON cp.customerNumber = c.customerNumber
ORDER BY 
    cp.profit DESC
LIMIT 5;

-- Query to find the top five least-engaged customers
WITH CustomerProfit AS (
    SELECT 
        c.customerNumber,
        SUM(od.quantityOrdered * (od.priceEach - p.buyPrice)) AS profit
    FROM
        customers c
        JOIN orders o ON c.customerNumber = o.customerNumber
        JOIN orderdetails od ON o.orderNumber = od.orderNumber
        JOIN products p ON od.productCode = p.productCode
    GROUP BY 
        c.customerNumber
)
SELECT 
    c.contactLastName,
    c.contactFirstName,
    c.city,
    c.country,
    cp.profit
FROM 
    CustomerProfit cp
    JOIN customers c ON cp.customerNumber = c.customerNumber
ORDER BY 
    cp.profit ASC
LIMIT 5;
-- Query to compute the average customer profit
WITH CustomerProfit AS (
    SELECT 
        c.customerNumber,
        SUM(od.quantityOrdered * (od.priceEach - p.buyPrice)) AS profit
    FROM
        customers c
        JOIN orders o ON c.customerNumber = o.customerNumber
        JOIN orderdetails od ON o.orderNumber = od.orderNumber
        JOIN products p ON od.productCode = p.productCode
    GROUP BY 
        c.customerNumber
)
SELECT 
    AVG(cp.profit) AS average_profit
FROM 
    CustomerProfit cp;

