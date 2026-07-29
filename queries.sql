--1. Identify the Top 3 customer states based on the number of registered customers.
select customer_state , count(*) as total_customers
from olist_customers_dataset
group by customer_state
order by total_customers DESC
limit 3;



--2. Find the Top 5 product categories based on total sales revenue.
SELECT product_category, SUM(price)
FROM olist_order_items_dataset AS OI
INNER JOIN olist_products_dataset AS P
ON OI.product_id=P.product_id
GROUP BY product_category
ORDER BY SUM(price) DESC
LIMIT 5;

--3. Display the Top 5 highest-priced products.
select product_id, price
from olist_order_items_dataset
order by price DESC
LIMIT 5;

--4. Count the number of orders in each order_status.
SELECT order_status,COUNT(order_id) AS TOTAL_ORDERS
FROM olist_orders_dataset
GROUP BY order_status;


--5. Find the average product price.
SELECT AVG(PRICE)
FROM olist_order_items_dataset;


--6. Display 8 states having more than 500 registered customers.
SELECT customer_state, COUNT(customer_id) AS TOTAL_CUSTOMERS
FROM olist_customers_dataset
GROUP BY customer_state
HAVING TOTAL_CUSTOMERS>500
LIMIT 8;


--7. Display the Top 5 products with the highest freight charges.
SELECT freight_value,PRODUCT_ID
FROM olist_order_items_dataset
ORDER BY freight_value DESC
LIMIT 5;


--8. Count the number of products in each category limit 7.
SELECT product_category, COUNT(product_id) as total_products
from olist_products_dataset
group by product_category
order by product_id DESC
limit 7
;


--9. Create a VIEW to display total revenue for each product category.
CREATE VIEW category_revenue AS
SELECT p.product_category, SUM(oi.price) AS total_price
FROM olist_products_dataset AS p
INNER JOIN olist_order_items_dataset AS oi
ON p.product_id = oi.product_id
GROUP BY p.product_category;


10. Create an INDEX on customer_id.
CREATE INDEX idx_customer_id
ON olist_customers_dataset(customer_id);
