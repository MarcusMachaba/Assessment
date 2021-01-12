Use northwind;

--Remove duplicate rows using an intermediate table
--This is done by transferring only the unique rows to the newly created table and deleting the original one (with the remaining duplicate rows).



--1. Create an intermediate table that has the same structure as the source table and transfer the unique rows found in the source:
--    create a copy of the structure of the orders table
CREATE TABLE copy_of_orders SELECT DISTINCT id, employee_id, customer_id, order_date, shipped_date, ship_name, ship_address1, ship_address2, ship_city, ship_state, ship_postal_code, ship_country, shipping_fee, payment_type, paid_date, order_status FROM orders;


--2. With that done, you can delete the source table with the drop command and rename the new one:
DROP TABLE orders;
ALTER TABLE copy_of_orders RENAME TO orders;


    
