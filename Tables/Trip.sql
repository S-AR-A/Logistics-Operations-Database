CREATE TABLE [dbo].[Trip] (
    [tripId]              NVARCHAR (50) NOT NULL
        CHECK (tripId LIKE 'TRIP[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
    [loadId]              NVARCHAR (50) NOT NULL,
    [driverId]            NVARCHAR (50) NULL,
    [truckId]             NVARCHAR (50) NULL,
    [trailerId]           NVARCHAR (50) NULL,
    [dispatchDate]        DATE          NOT NULL,
    [actualDistanceMiles] SMALLINT      NOT NULL DEFAULT 0
        CHECK (actualDistanceMiles >= 0),
    [actualDurationHours] FLOAT (53)    NOT NULL DEFAULT 0,
    [fuelGallonsUsed]     DECIMAL(19,4)    NOT NULL DEFAULT 0,
    [averageMpg]          FLOAT (53)    NOT NULL DEFAULT 0,
    [idleTimeHours]       FLOAT (53)    NOT NULL DEFAULT 0,
    [tripStatus]          NVARCHAR (50) NOT NULL DEFAULT 'Not Started',
    CONSTRAINT [PK_Trip] PRIMARY KEY CLUSTERED ([tripId] ASC),
    CONSTRAINT FK_Trip_Load FOREIGN KEY (loadId) REFERENCES dbo.Load(loadId),
    CONSTRAINT FK_Trip_Driver FOREIGN KEY (driverId) REFERENCES dbo.Driver(driverId),
    CONSTRAINT FK_Trip_Trailer FOREIGN KEY (trailerId) REFERENCES dbo.Trailer(trailerId)

);

