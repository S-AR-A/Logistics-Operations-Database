BULK INSERT dbo.Customer
FROM 'C:\Alireza\Learning\DB\customers.csv'
WITH
(
	FORMAT = 'CSV',
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '0x0a'
);
