CREATE TABLE [dbo].[Load] (
    [loadId]             NVARCHAR (50) NOT NULL,
    [customerId]         NVARCHAR (50) NOT NULL,
    [routeId]            NVARCHAR (50) NOT NULL,
    [loadDate]           DATE          NOT NULL,
    [loadType]           NVARCHAR (50) NOT NULL,
    [weightLbs]          INT           NOT NULL,
    [pieces]             TINYINT       NOT NULL,
    [revenue]            FLOAT (53)    NOT NULL,
    [fuelSurcharge]      FLOAT (53)    NOT NULL,
    [accessorialCharges] TINYINT       NOT NULL,
    [loadStatus]         NVARCHAR (50) NOT NULL,
    [bookingType]        NVARCHAR (50) NOT NULL
);

