CREATE TABLE [dbo].[MaintenanceRecord] (
    [maintenanceId]      NVARCHAR (50) NOT NULL,
    [truckId]            NVARCHAR (50) NOT NULL,
    [maintenanceDate]    DATE          NOT NULL,
    [maintenanceType]    NVARCHAR (50) NOT NULL,
    [odometerReading]    INT           NOT NULL,
    [laborHours]         FLOAT (53)    NOT NULL,
    [laborCost]          FLOAT (53)    NOT NULL,
    [partsCost]          FLOAT (53)    NOT NULL,
    [totalCost]          FLOAT (53)    NOT NULL,
    [facilityLocation]   NVARCHAR (50) NOT NULL,
    [downtimeHours]      FLOAT (53)    NOT NULL,
    [serviceDescription] NVARCHAR (50) NOT NULL
);

