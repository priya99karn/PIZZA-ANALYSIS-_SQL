-- Basic:
-- 1) Retrieve the total number of orders placed.
-- 2) Calculate the total revenue generated from pizza sales.
-- 3) Identify the highest-priced pizza.
-- 4) Identify the most common pizza size ordered.
-- 5) List the top 5 most ordered pizza types along with their quantities.

-- 1) Retrieve the total number of orders placed.
select count(order_ID) as total_orders from orders;

-- 2) Calculate the total revenue generated from pizza sales
-- to calculate revenue we need quantity and prize and here we join 2 table to find it 

SELECT 
    round(sum(orders_details.quantity * pizzas.price),2) AS total_revenue
FROM
    orders_details
        JOIN
    pizzas ON pizzas.pizza_id = orders_details.pizza_id
    
-- 3) Identify the highest-priced pizza.

select pizza_types.name, pizzas.price
from pizza_types join pizzas
on pizza_types.pizza_type_id= pizzas.pizza_type_id
order By pizzas.price desc limit 1;

-- 4) Identify the most common pizza size ordered.

select quantity, count(order_details_id)
from orders_details group by quantity;

-- 4) Identify the most common pizza size ordered.
select pizzas.size, count(orders_details.order_details_id) as order_count
from pizzas join orders_details
on pizzas.pizza_id= orders_details.pizza_id
group by pizzas.size order by order_count desc;

-- 5) List the top 5 most ordered pizza types along with their quantities.
select pizza_types.name,
sum(orders_details.quantity)
from pizza_types join pizzas
on pizza_types.pizza_type_id= pizzas.pizza_type_id
join orders_details 
on orders_details.pizza_id= pizzas.pizza_id
group by pizza_types.name
limit 5;

-- -- -- -- -- --- --- --- -- -- -- -- -- - - - - - - - - - - - - - - - - --



