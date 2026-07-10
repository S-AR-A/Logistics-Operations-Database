CREATE TABLE [dbo].[Route] (
    [routeId]              NVARCHAR (50) NOT NULL,
    [originCity]           NVARCHAR (50) NOT NULL,
    [originState]          NVARCHAR (50) NOT NULL,
    [destinationCity]      NVARCHAR (50) NOT NULL,
    [destinationState]     NVARCHAR (50) NOT NULL,
    [typicalDistanceMiles] SMALLINT      NOT NULL,
    [baseRatePerMile]      FLOAT (53)    NOT NULL,
    [fuelSurchargeRate]    TIME (7)      NOT NULL,
    [typicalTransitDays]   TINYINT       NOT NULL
);

