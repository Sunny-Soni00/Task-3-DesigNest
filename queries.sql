--sign up
INSERT INTO customer_table(name, email, password, location, state)
VALUES ('John Doe', 'john.doe@example.com', 'securepassword123', 'New York', 'NY');

--user profile 
Select *
FROM customer_table;

--product_details 
--seller point of view: he will be adding products to the collection and the clothing items for the buyer to view
INSERT INTO collection_table(name, type, colour, price)
VALUES ('Street style', 'Seasonal', 'Black', 250);

INSERT INTO clothing_item_table(name, type, size, colour)
VALUES ('Shorts', 'Comfort to wear', 250, 100);

--Product_details(buyer point of view: customer will be adding products to the cart)
--customer will be adding products to the cart from the collection table and the clothing item table
SELECT id 
FROM collection_table
JOIN clothing_item_table ON collection_table.collection_id = clothing_item_table.collection_id;

--product_search: the customer will be able to search for products by name, type, colour, and price
SELECT *
FROM collection_table
JOIN clothing_item_table ON collection_table.collection_id = clothing_item_table.item_id
JOIN Customized_table ON collection_table.collection_id = Customized_table.custom_id
WHERE clothing_item_table.name LIKE '%search_name%'
  AND clothing_item_table.type LIKE '%search_type%'
  AND clothing_item_table.color LIKE '%search_color%'
  AND clothing_item_table.price <= search_price;

--add_to_cart: the customer will be able to add products to the cart
--It will help to add the price by id from the table
INSERT INTO cart_table(customer_id, item_id)
VALUES (1, 1);

--view_cart: the customer will be able to view the products in the cart
SELECT *
FROM cart_table;

--place_order: the customer will be able to place an order
--Calculate the total amount for the order by summing the prices of all items in the cart for a specific customer
INSERT INTO order_table(customer_id, total_amount)
VALUES (1, (SELECT SUM(price) FROM cart_table WHERE customer_id = 1));


--order_history: the customer will be able to view their order history
SELECT *
FROM order_table
WHERE customer_id = 1;  --customer_id is the id of the customer who placed the order 