CREATE TABLE [dbo].[Load] (
    [loadId]             NVARCHAR (50) NOT NULL,
    [customerId]         NVARCHAR (50) NOT NULL,
    [routeId]            NVARCHAR (50) NOT NULL,
    [loadDate]           DATE          NOT NULL,
    [loadType]           NVARCHAR (50) NOT NULL,
    [weightLbs]          INT           NOT NULL,
    [pieces]             TINYINT       NOT NULL,
    [revenue]            DECIMAL(19,4) NOT NULL,
    [fuelSurcharge]      FLOAT (53)    NOT NULL,
    [accessorialCharges] TINYINT       NOT NULL,
    [loadStatus]         NVARCHAR (50) NOT NULL,
    [bookingType]        NVARCHAR (50) NOT NULL, 
    CONSTRAINT [PK_Load] PRIMARY KEY ([loadId]), 
    CONSTRAINT [FK_Load_Customer] FOREIGN KEY (customerId) REFERENCES dbo.Customer([customerId]), 
    CONSTRAINT [FK_Load_Route] FOREIGN KEY (routeId) REFERENCES dbo.Route(routeId)
);

