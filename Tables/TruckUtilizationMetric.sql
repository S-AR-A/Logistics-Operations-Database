CREATE TABLE [dbo].[TruckUtilizationMetric] (
    [truckId]           NVARCHAR (50) NOT NULL,
    [month]             DATE          NOT NULL,
    [tripsCompleted]    TINYINT       NOT NULL,
    [totalMiles]        INT           NOT NULL,
    [totalRevenue]      FLOAT (53)    NOT NULL,
    [averageMpg]        FLOAT (53)    NOT NULL,
    [maintenanceEvents] TINYINT       NOT NULL,
    [maintenanceCost]   FLOAT (53)    NOT NULL,
    [downtimeHours]     FLOAT (53)    NOT NULL,
    [utilizationRate]   FLOAT (53)    NOT NULL,
    CONSTRAINT [PK_TruckUtilizationMetric] PRIMARY KEY CLUSTERED ([truckId] ASC, [month] ASC)
);

