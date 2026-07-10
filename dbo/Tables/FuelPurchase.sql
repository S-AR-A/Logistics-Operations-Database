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
    [fuelCardNumber] MONEY         NOT NULL
);

