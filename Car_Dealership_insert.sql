-- Insert data into Salesperson table
INSERT INTO Salesperson (SalespersonID, Name)
VALUES
    (1, 'John Doe'),
    (2, 'Jane Smith');

   
   
-- Insert data into Customer table
INSERT INTO Customer (CustomerID, Name)
VALUES
    (101, 'Alice Johnson'),
    (102, 'Bob Williams');
   
   

-- Insert data into CarType table
INSERT INTO CarType (CarTypeID, TypeName)
VALUES
    (1, 'New'),
    (2, 'Used');
   
   

-- Insert data into Car table
INSERT INTO Car (CarID, SerialNumber, Model, Year, CustomerID, SalespersonID, CarTypeID)
VALUES
    (1001, 'ABC123', 'Toyota Camry', 2020, 101, 1, 1),
    (1002, 'XYZ789', 'Honda Accord', 2019, 102, 2, 2);
   
   

-- Insert data into Invoice table
INSERT INTO Invoice (InvoiceID, Date, TotalAmount, SalespersonID, CarID)
VALUES
    (501, '2024-01-10', 25000.00, 1, 1001),
    (502, '2024-01-11', 22000.00, 2, 1002);
   
   

-- Insert data into Payment table
INSERT INTO Payment (PaymentID, CustomerID, Amount)
VALUES
    (10001, 101, 25000.00),
    (10002, 102, 22000.00);
   
   
   
-- Late fee charge using stored procedure

CREATE OR REPLACE PROCEDURE latefee(
    customer INTEGER,
    lateFeeAmount DECIMAL
)
LANGUAGE plpgsql
AS $$
BEGIN
    -- Add late fee to customer payment amount
    UPDATE Payment
    SET Amount = Amount + lateFeeAmount
    WHERE CustomerID = customer;

    -- Commit the above statement inside of a transaction
    COMMIT;
END;
$$;

-- Calling the Stored Procedure
CALL lateFee(101, 5.00);



-- Validate the late fee has been posted
SELECT *
FROM Payment
WHERE CustomerID = 101;





-- DROP the stored procedure
DROP PROCEDURE latefee;