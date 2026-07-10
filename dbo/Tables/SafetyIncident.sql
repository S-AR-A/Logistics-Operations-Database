CREATE TABLE [dbo].[SafetyIncident] (
    [incidentId]        NVARCHAR (50) NOT NULL,
    [tripId]            NVARCHAR (50) NOT NULL,
    [truckId]           NVARCHAR (50) NULL,
    [driverId]          NVARCHAR (50) NULL,
    [incidentDate]      DATETIME2 (7) NOT NULL,
    [incidentType]      NVARCHAR (50) NOT NULL,
    [locationCity]      NVARCHAR (50) NOT NULL,
    [locationState]     NVARCHAR (50) NOT NULL,
    [atFaultFlag]       BIT           NOT NULL,
    [injuryFlag]        BIT           NOT NULL,
    [vehicleDamageCost] FLOAT (53)    NOT NULL,
    [cargoDamageCost]   FLOAT (53)    NOT NULL,
    [claimAmount]       FLOAT (53)    NOT NULL,
    [preventableFlag]   BIT           NOT NULL,
    [description]       NVARCHAR (50) NOT NULL
);

