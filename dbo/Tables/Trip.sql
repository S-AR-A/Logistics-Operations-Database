CREATE TABLE [dbo].[Trip] (
    [tripId]              NVARCHAR (50) NOT NULL,
    [loadId]              NVARCHAR (50) NOT NULL,
    [driverId]            NVARCHAR (50) NULL,
    [truckId]             NVARCHAR (50) NULL,
    [trailerId]           NVARCHAR (50) NULL,
    [dispatchDate]        DATE          NOT NULL,
    [actualDistanceMiles] SMALLINT      NOT NULL,
    [actualDurationHours] FLOAT (53)    NOT NULL,
    [fuelGallonsUsed]     FLOAT (53)    NOT NULL,
    [averageMpg]          FLOAT (53)    NOT NULL,
    [idleTimeHours]       FLOAT (53)    NOT NULL,
    [tripStatus]          NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_Trip] PRIMARY KEY CLUSTERED ([tripId] ASC),
    CONSTRAINT FK_Trip_Load FOREIGN KEY (loadId) REFERENCES dbo.Load(loadId),
    CONSTRAINT FK_Trip_Driver FOREIGN KEY (driverId) REFERENCES dbo.Driver(driverId),
    CONSTRAINT FK_Trip_Trailer FOREIGN KEY (trailerId) REFERENCES dbo.Trailer(trailerId)

);

