CREATE TABLE [dbo].[Truck] (
    [truckId]             NVARCHAR (50) NOT NULL,
    [unitNumber]          SMALLINT      NOT NULL,
    [make]                NVARCHAR (50) NOT NULL,
    [modelYear]           SMALLINT      NOT NULL,
    [vin]                 NVARCHAR (50) NOT NULL,
    [acquisitionDate]     DATE          NOT NULL,
    [acquisitionMileage]  INT           NOT NULL,
    [fuelType]            NVARCHAR (50) NOT NULL,
    [tankCapacityGallons] TINYINT       NOT NULL,
    [status]              NVARCHAR (50) NOT NULL,
    [homeTerminal]        NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_truck] PRIMARY KEY CLUSTERED ([truckId] ASC)
);

