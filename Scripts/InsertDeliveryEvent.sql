BULK INSERT dbo.DeliveryEvent
FROM 'C:\Alireza\Learning\DB\delivery_events.csv'
WITH
(
	FORMAT = 'CSV',
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '0x0a'
);
