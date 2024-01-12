-- Create Salesperson table
CREATE TABLE Salesperson (
    SalespersonID INT PRIMARY KEY,
    Name VARCHAR(255)
);

select * from salesperson s 

-- Create Customer table
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(255)
);

select * from customer c 

-- Create CarType table
CREATE TABLE CarType (
    CarTypeID INT PRIMARY KEY,
    TypeName VARCHAR(255)
);

select * from cartype c 

-- Create Car table
CREATE TABLE Car (
    CarID INT PRIMARY KEY,
    SerialNumber VARCHAR(255),
    Model VARCHAR(255),
    Year INT,
    CustomerID INT,
    SalespersonID INT,
    CarTypeID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (SalespersonID) REFERENCES Salesperson(SalespersonID),
    FOREIGN KEY (CarTypeID) REFERENCES CarType(CarTypeID)
);

select * from car c 


-- Create Invoice table
CREATE TABLE Invoice (
    InvoiceID INT PRIMARY KEY,
    Date DATE,
    TotalAmount DECIMAL(10, 2),
    SalespersonID INT,
    CarID INT,
    FOREIGN KEY (SalespersonID) REFERENCES Salesperson(SalespersonID),
    FOREIGN KEY (CarID) REFERENCES Car(CarID)
);

select * from invoice i 


-- Create Payment table
CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    CustomerID INT,
    Amount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

select * from payment p 


