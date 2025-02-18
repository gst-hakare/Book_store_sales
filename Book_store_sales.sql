create database book_store;
use book_store;


-- 1) Retrieve all books in the "Fiction" genre. 

select * from books
where genre = 'fiction';


-- 2) Find books published after the year 1950.

select * from books
where Published_Year > 1950;


-- 3) List all customers from Canada.

select * from customers 
where Country = 'Canada';


-- 4) Show orders placed in November 2023.

select * from orders 
where Order_Date like '2023-11-%%';


-- 5) Retrieve the total stock of books available.

select sum(stock) as total_stocks
from books 


-- 6) Find the details of the most expensive book.

select top 1 * from books 
order by price desc

-- 7) Show customer name who ordered more than 1 quantity of a book.

select Name,quantity from customers
inner join orders
on customers.customer_id = orders.customer_id
where quantity > 1;

-- 8) Retrieve all orders where the total amount exceeds $20.

select * from orders where 
Total_Amount > 20;


-- 9) List all genres available in the Books table.

select distinct genre from books;


-- 10) Find the book with the lowest stock.

select top 1 title,stock from books
order by stock;

-- 11) Calculate the total revenue generated from all orders.

select round(sum(total_amount),2) as revenue from orders;


-- 1) Retrieve the total number of books sold for each genre.

select genre,sum(quantity) as Total_books from books
inner join orders
on books.book_id = orders.book_id
group by genre;


-- 2) Find the average price of books in the "Fantasy" genre.

select round(avg(price),2) avg_fantasy_price from books
where genre = 'Fantasy';




-- 3) Find the most frequently ordered book.


select top 1 orders.book_id,books.title,count(order_id) as order_count from orders
inner join books
on orders.book_id = books.book_id
group by orders.book_id,books.title
order by order_count desc


-- 4) Show the top 3 most expensive books of the "Fantasy" genre.


select top 3 title,genre,price from books
where genre = 'fantasy'
order by price desc;
 

 -- 5) Retrieve the total quantity of books sold by each author.

 select author,sum(quantity) as quantity from books
 inner join orders
 on books.book_id = orders.book_id
 group by author
 order by quantity desc


 -- 6) List the cities where customers who spent over 400 are located.

 select distinct city,total_amount from customers
 inner join orders
 on customers.customer_id = orders.customer_id
 where Total_Amount > 400
 order by total_amount desc;


 -- 7) Find the customer who spent the most on orders.

 select top 1 customers.customer_id,customers.name,round(sum(orders.total_amount),2) as amount from Customers
 inner join orders
 on Customers.Customer_ID = Orders.Customer_ID
 group by customers.customer_id,customers.name
 order by amount desc

-- 8) Calculate the stock remaining after fulfilling all orders.


SELECT b.book_id,b.title,(b.stock - COALESCE(SUM(o.quantity), 0)) AS remain_stock
FROM books b
LEFT JOIN orders o ON b.book_id = o.book_id
GROUP BY b.book_id, b.title, b.stock;



select * from orders
select * from books
select * from customers


