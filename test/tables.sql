--first table
CREATE TABLE Customer (
  CustomerID INT PRIMARY KEY,
  Name VARCHAR(50) NOT NULL,
  Email VARCHAR(50) NOT NULL,
  Phone VARCHAR(20) NOT NULL,
  Address VARCHAR(100) NOT NULL
);

INSERT INTO Customer (CustomerID, Name, Email, Phone, Address)
VALUES
(1, 'John Smith', 'john.smith@example.com', '123-456-7890', '123 Main St'),
(2, 'Jane Doe', 'jane.doe@example.com', '555-555-1212', '456 Maple Ave'),
(3, 'Bob Johnson', 'bob.johnson@example.com', '555-123-4567', '789 Oak Dr'),
(4, 'Sara Lee', 'sara.lee@example.com', '555-987-6543', '321 Elm St'),
(5, 'Tom Jones', 'tom.jones@example.com', '555-555-5555', '555 Pine Rd'),
(6, 'Amy Brown', 'amy.brown@example.com', '555-111-2222', '777 Cedar Ln'),
(7, 'Chris Green', 'chris.green@example.com', '555-222-3333', '999 Maple St'),
(8, 'Karen White', 'karen.white@example.com', '555-444-5555', '111 Oak Ave'),
(9, 'Mike Black', 'mike.black@example.com', '555-666-7777', '222 Pine St'),
(10, 'Lisa Grey', 'lisa.grey@example.com', '555-888-9999', '333 Elm Rd');

--second table

CREATE TABLE Product (
  ProductID INT PRIMARY KEY,
  Name VARCHAR(50) NOT NULL,
  Description VARCHAR(255) NOT NULL,
  Price DECIMAL(10,2) NOT NULL,
  Quantity INT NOT NULL,
  CategoryID INT,
  FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

INSERT INTO Product (ProductID, Name, Description, Price, Quantity, CategoryID)
VALUES
(1, 'The Great Gatsby', 'A novel by F. Scott Fitzgerald', 12.99, 50, 1),
(2, 'Dark Chocolate Bar', 'Dark chocolate with 70% cocoa', 3.99, 100, 2),
(3, 'iPhone 12 Pro', 'Apple smartphone with 5G capability', 1099.00, 20, 3),
(4, 'Milk Chocolate Truffles', 'Assorted milk chocolate truffles', 14.99, 75, 2),
(5, 'The Catcher in the Rye', 'A novel by J.D. Salinger', 9.99, 40, 1),
(6, 'Assorted Nuts and Dried Fruit', 'Variety of nuts and dried fruits', 19.99, 60, 4),
(7, 'Kindle Paperwhite', 'Waterproof e-reader with adjustable light', 139.99, 10, 3),
(8, 'Assorted Candy', 'Variety of candy, including gummies and hard candy', 7.99, 150, 2),
(9, 'Bluetooth Headphones', 'Wireless headphones with noise-cancellation', 99.99, 25, 3),
(10, 'Assorted Tea', 'Variety of tea, including black, green, and herbal teas', 12.99, 80, 5);


--third table
CREATE TABLE Orders (
OrderID INT PRIMARY KEY,
CustomerID INT NOT NULL,
Date DATE NOT NULL,
Status VARCHAR(50) NOT NULL,
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);


INSERT INTO Orders (OrderID, CustomerID, Date, Status)
VALUES
(1, 1, '2023-04-19', 'Pending'),
(2, 1, '2023-04-19', 'Pending'),
(3, 2, '2023-04-19', 'Shipped'),
(4, 3, '2023-04-18', 'Delivered'),
(5, 3, '2023-04-18', 'Delivered'),
(6, 4, '2023-04-17', 'Pending'),
(7, 5, '2023-04-17', 'Shipped'),
(8, 6, '2023-04-16', 'Delivered'),
(9, 6, '2023-04-16', 'Delivered'),
(10, 7, '2023-04-15', 'Shipped');




--4 table
CREATE TABLE Payment (
  PaymentID INT PRIMARY KEY,
  OrderID INT NOT NULL,
  Amount DECIMAL(10,2) NOT NULL,
  PaymentMethod VARCHAR(50) NOT NULL,
  FOREIGN KEY (OrderID) REFERENCES Order(OrderID)
);


INSERT INTO Payment (PaymentID, OrderID, Amount, PaymentMethod)
VALUES (1, 1, 50.00, 'Credit Card'),
       (2, 2, 20.00, 'PayPal'),
       (3, 2, 30.00, 'Credit Card'),
       (4, 3, 10.00, 'Debit Card'),
       (5, 4, 25.00, 'Credit Card'),
       (6, 4, 15.00, 'PayPal'),
       (7, 5, 40.00, 'Credit Card'),
       (8, 5, 10.00, 'PayPal'),
       (9, 6, 15.00, 'Debit Card'),
       (10, 6, 20.00, 'Credit Card');


--5 table
CREATE TABLE Category (
  CategoryID INT PRIMARY KEY,
  Name VARCHAR(50) NOT NULL
);

INSERT INTO Category (CategoryID, Name) VALUES (1, 'Books');
INSERT INTO Category (CategoryID, Name) VALUES (2, 'Electronics');
INSERT INTO Category (CategoryID, Name) VALUES (3, 'Clothing');
INSERT INTO Category (CategoryID, Name) VALUES (4, 'Home and Garden');
INSERT INTO Category (CategoryID, Name) VALUES (5, 'Sports and Outdoors');
INSERT INTO Category (CategoryID, Name) VALUES (6, 'Beauty and Personal Care');
INSERT INTO Category (CategoryID, Name) VALUES (7, 'Toys and Games');
INSERT INTO Category (CategoryID, Name) VALUES (8, 'Food and Beverages');
INSERT INTO Category (CategoryID, Name) VALUES (9, 'Health and Wellness');
INSERT INTO Category (CategoryID, Name) VALUES (10, 'Pet Supplies');


--6 table
CREATE TABLE Book (
  BookID INT PRIMARY KEY,
  Title VARCHAR(100) NOT NULL,
  Author VARCHAR(50) NOT NULL,
  Publisher VARCHAR(50) NOT NULL,
  ISBN VARCHAR(20) NOT NULL,
  Pages INT NOT NULL,
  ProductID INT,
  FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);


INSERT INTO Book (BookID, Title, Author, Publisher, ISBN, Pages, ProductID)
VALUES
  (1, 'To Kill a Mockingbird', 'Harper Lee', 'HarperCollins Publishers', '9780061120084', 336, 1),
  (2, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Scribner', '9780743273565', 180, 2),
  (3, '1984', 'George Orwell', 'Secker & Warburg', '9780451524935', 328, 3),
  (4, 'Animal Farm', 'George Orwell', 'Secker & Warburg', '9780451526342', 144, 3),
  (5, 'The Catcher in the Rye', 'J.D. Salinger', 'Little, Brown and Company', '9780316769488', 224, 4),
  (6, 'One Hundred Years of Solitude', 'Gabriel Garcia Marquez', 'HarperCollins', '9780060883287', 417, 5),
  (7, 'Brave New World', 'Aldous Huxley', 'Chatto & Windus', '9780060850524', 288, 3),
  (8, 'Lord of the Flies', 'William Golding', 'Faber and Faber', '9780571056866', 224, 4),
  (9, 'Pride and Prejudice', 'Jane Austen', 'T. Egerton, Whitehall', '9780141439518', 435, 6),
  (10, 'Jane Eyre', 'Charlotte Bronte', 'Smith, Elder & Co.', '9780141441146', 507, 6);


--7 table
CREATE TABLE Chocolate (
  ChocolateID INT PRIMARY KEY,
  Name VARCHAR(50) NOT NULL,
  Brand VARCHAR(50) NOT NULL,
  Weight INT NOT NULL,
  ProductID INT,
  FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);


INSERT INTO Chocolate (ChocolateID, Name, Brand, Weight, ProductID)
VALUES (1, 'Dark Chocolate', 'Lindt', 100, 1),
(2, 'Milk Chocolate', 'Cadbury', 200, 2),
(3, 'White Chocolate', 'Hershey', 150, 3),
(4, 'Hazelnut Chocolate', 'Ferrero Rocher', 200, 4),
(5, 'Mint Chocolate', 'Nestle', 100, 5),
(6, 'Chocolate Fudge', 'Ghirardelli', 150, 6),
(7, 'Almond Chocolate', 'Hershey', 200, 7),
(8, 'Caramel Chocolate', 'Milka', 100, 8),
(9, 'Peanut Butter Chocolate', 'Reese''s', 150, 9),
(10, 'Dark Chocolate with Sea Salt', 'Ghirardelli', 100, 10);


--Procedure which does group by information:

CREATE OR REPLACE PROCEDURE get_product_category_summary IS
BEGIN
  FOR c IN (SELECT Category.Name, COUNT(*) AS ProductCount, SUM(Quantity) AS TotalQuantity, AVG(Price) AS AveragePrice
            FROM Product
            JOIN Category ON Product.CategoryID = Category.CategoryID
            GROUP BY Category.Name)
  LOOP
    DBMS_OUTPUT.PUT_LINE(c.Name || ': ' || c.ProductCount || ' products, ' || c.TotalQuantity || ' total quantity, average price: ' || c.AveragePrice);
  END LOOP;
END;

begin 
    get_product_category_summary;
end;


--Function which counts the number of records:

CREATE OR REPLACE FUNCTION get_record_count(p_table_name IN VARCHAR2) RETURN NUMBER IS
  l_count NUMBER;
BEGIN
  EXECUTE IMMEDIATE 'SELECT COUNT(*) FROM ' || p_table_name INTO l_count;
  RETURN l_count;
END;

DECLARE
  l_count NUMBER;
BEGIN
  l_count := count_records('');
  DBMS_OUTPUT.PUT_LINE('Number of records in Orders table: ' || l_count);
END;


--Procedure which uses SQL%ROWCOUNT to determine the number of rows affected:

CREATE OR REPLACE PROCEDURE update_product_price(p_product_id IN NUMBER, p_new_price IN NUMBER) IS
BEGIN
  UPDATE Product SET Price = p_new_price WHERE ProductID = p_product_id;
  IF SQL%ROWCOUNT = 0 THEN
    DBMS_OUTPUT.PUT_LINE('No product found with ID ' || p_product_id);
  ELSE
    DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT || ' product(s) updated with new price');
  END IF;
END;


BEGIN
  update_product_price(p_product_id => 3, p_new_price => 9.99);
END;


--Add user-defined exception which disallows to enter title of item (e.g. book) to be less than 5 characters:

CREATE OR REPLACE PROCEDURE insert_product(p_productid IN varchar2, p_name IN VARCHAR2, p_description IN VARCHAR2, p_price IN NUMBER, p_Quantity IN number) IS
  name_length EXCEPTION;
  PRAGMA EXCEPTION_INIT(name_length, -20001);
BEGIN
  IF LENGTH(p_name) < 5 THEN
    RAISE name_length;
  END IF;
  
  IF p_description IS NULL THEN
    RAISE_APPLICATION_ERROR(-20001, 'Description cannot be NULL');
  END IF;

  INSERT INTO Product (productid, Name, Description, Price, Quantity)
  VALUES (p_productid, p_name, p_description, p_price, p_Quantity);
EXCEPTION
  WHEN name_length THEN
    DBMS_OUTPUT.PUT_LINE('Name must be at least 5 characters');
END;

BEGIN
  insert_product(13, 'Yera', ' Rauan ' ,10, 123);
END;




--Create a trigger before insert on any entity which will show the current number of rows in the table:

CREATE OR REPLACE TRIGGER display_row_count
BEFORE INSERT ON product
DECLARE
  l_table_name VARCHAR2(30);
  l_row_count NUMBER;
BEGIN
  l_table_name := UPPER(SQL%ROWCOUNT);
  EXECUTE IMMEDIATE 'SELECT COUNT(*) FROM '  l_table_name INTO l_row_count;
  DBMS_OUTPUT.PUT_LINE('The current row count in '  l_table_name  ' is '  l_row_count);
END;


--SELECT query

DECLARE
  v_customer_name VARCHAR2(50);
BEGIN
  SELECT name INTO v_customer_name FROM customer WHERE customer_id = 123;
  DBMS_OUTPUT.PUT_LINE('Customer name: ' || v_customer_name);
END;


--ALTER TABLE query:

DECLARE
  v_table_name VARCHAR2(50) := 'customer';
BEGIN
  EXECUTE IMMEDIATE 'ALTER TABLE ' || v_table_name || ' ADD (age NUMBER)';
END;


--INSERT query

DECLARE
  v_customer_id NUMBER := 123;
  v_name VARCHAR2(50) := 'John Smith';
  v_email VARCHAR2(50) := 'john.smith@example.com';
  v_phone VARCHAR2(20) := '123-456-7890';
  v_address VARCHAR2(100) := '123 Main St, Anytown, USA';
BEGIN
  INSERT INTO customer (customer_id, name, email, phone, address)
  VALUES (v_customer_id, v_name, v_email, v_phone, v_address);
END;



--update query

DECLARE
  v_customer_id NUMBER := 123;
BEGIN
  UPDATE customer SET phone = '555-555-5555' WHERE customer_id = v_customer_id;
END;


--DELETE query:


DECLARE
  v_customer_id NUMBER := 123;
BEGIN
  DELETE FROM customer WHERE customer_id = v_customer_id;
END;
