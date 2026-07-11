CREATE TABLE [dbo].[FuelPurchase] (
    [fuelPurchaseId] NVARCHAR (50) NOT NULL,
    [tripId]         NVARCHAR (50) NOT NULL,
    [truckId]        NVARCHAR (50) NULL,
    [driverId]       NVARCHAR (50) NULL,
    [purchaseDate]   DATETIME2 (7) NOT NULL,
    [locationCity]   NVARCHAR (50) NOT NULL,
    [locationState]  NVARCHAR (50) NOT NULL,
    [gallons]        FLOAT (53)    NOT NULL,
    [pricePerGallon] FLOAT (53)    NOT NULL,
    [totalCost]      FLOAT (53)    NOT NULL,
    [fuelCardNumber] MONEY         NOT NULL, 
    CONSTRAINT [PK_FuelPurchase] PRIMARY KEY ([fuelPurchaseId]),
    CONSTRAINT FK_FuelPurchase_Trip FOREIGN KEY (tripId) REFERENCES dbo.Trip(tripId),
    CONSTRAINT FK_FuelPurchase_Truck FOREIGN KEY (truckId) REFERENCES dbo.Truck(truckId),
    CONSTRAINT FK_FuelPurchase_Driver FOREIGN KEY (driverId) REFERENCES dbo.Driver(driverId)
);

