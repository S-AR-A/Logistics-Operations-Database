CREATE TABLE DriverMonthlyMetric
(
    driverId                   NVARCHAR(50) NOT NULL ,
    month                      DATE NOT NULL,
    tripsCompleted             TINYINT NOT NULL,
    totalMiles                 INT NOT NULL,
    totalRevenue               FLOAT(53) NOT NULL,
    averageMpg                 FLOAT(53) NOT NULL,
    totalFuelGallons           FLOAT(53) NOT NULL,
    onTimeDeliveryRate         FLOAT(53) NOT NULL,
    averageIdleHours           FLOAT(53) NOT NULL, 
    PRIMARY KEY (month,driverId)
)
