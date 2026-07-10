CREATE TABLE DriverMonthlyMetric
(
    driverId                   NVARCHAR(50) NOT NULL ,
    month                      DATE NOT NULL,
    tripsCompleted             TINYINT,
    totalMiles                 INT,
    totalRevenue               FLOAT(53),
    averageMpg                 FLOAT(53),
    totalFuelGallons           FLOAT(53),
    onTimeDeliveryRate         FLOAT(53),
    averageIdleHours           FLOAT(53), 
    PRIMARY KEY (month,driverId)
)
