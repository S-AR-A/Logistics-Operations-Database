CREATE TABLE [dbo].[MaintenanceRecord] (
    [maintenanceId]      NVARCHAR (50) NOT NULL,
    [truckId]            NVARCHAR (50) NOT NULL,
    [maintenanceDate]    DATE          NOT NULL,
    [maintenanceType]    NVARCHAR (50) NOT NULL,
    [odometerReading]    INT           NOT NULL,
    [laborHours]         DECIMAL(19,4)    NOT NULL,
    [laborCost]          DECIMAL(19,4)    NOT NULL,
    [partsCost]          DECIMAL(19,4)    NOT NULL,
    [totalCost]          DECIMAL(19,4)    NOT NULL,
    [facilityLocation]   NVARCHAR (50) NOT NULL,
    [downtimeHours]      FLOAT (53)    NOT NULL,
    [serviceDescription] NVARCHAR (50) NOT NULL, 
    CONSTRAINT [PK_MaintenanceRecord] PRIMARY KEY ([maintenanceId]), 
    CONSTRAINT [FK_MaintenanceRecord_Truck] FOREIGN KEY (truckId) REFERENCES dbo.Truck(truckId)
);

