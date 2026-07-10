BULK INSERT dbo.DriverMonthlyMetric
FROM 'C:\Alireza\Learning\DB\driver_monthly_metrics.csv'
WITH
(
ROWTERMINATOR = '0x0a',
FIELDTERMINATOR = ',', 
FIRSTROW = 2
);


