CREATE TABLE [dbo].[Trailer] (
    [trailerId]       NVARCHAR (50) NOT NULL,
    [trailerNumber]   SMALLINT      NOT NULL,
    [trailerType]     NVARCHAR (50) NOT NULL,
    [lengthFeet]      TINYINT       NOT NULL,
    [modelYear]       SMALLINT      NOT NULL,
    [vin]             NVARCHAR (50) NOT NULL,
    [acquisitionDate] DATE          NOT NULL,
    [status]          NVARCHAR (50) NOT NULL,
    [currentLocation] NVARCHAR (50) NOT NULL, 
    CONSTRAINT [PK_Trailer] PRIMARY KEY ([trailerId])
);

