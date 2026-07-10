CREATE TABLE [dbo].[Facility] (
    [facilityId]     NVARCHAR (50) NOT NULL,
    [facilityName]   NVARCHAR (50) NOT NULL,
    [facilityType]   NVARCHAR (50) NOT NULL,
    [city]           NVARCHAR (50) NOT NULL,
    [state]          NVARCHAR (50) NOT NULL,
    [latitude]       FLOAT (53)    NOT NULL,
    [longitude]      FLOAT (53)    NOT NULL,
    [dockDoors]      TINYINT       NOT NULL,
    [operatingHours] NVARCHAR (50) NOT NULL
);

