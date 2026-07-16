CREATE TABLE [dbo].[Driver] (
    [driverId]         NVARCHAR (50) NOT NULL,
    [firstName]        NVARCHAR (50) NOT NULL,
    [lastName]         NVARCHAR (50) NOT NULL,
    [hireDate]         DATE          NOT NULL,
    [terminationDate]  DATE          NULL,
    [licenseNumber]    NVARCHAR (50) NOT NULL,
    [licenseState]     NVARCHAR (50) NOT NULL,
    [dateOfBirth]      DATE          NOT NULL,
    [homeTerminal]     NVARCHAR (50) NOT NULL,
    [employmentStatus] NVARCHAR (50) NOT NULL,
    [cdlClass]         NVARCHAR (50) NOT NULL,
    [yearsExperience]  TINYINT       NOT NULL, 
    [status]           NVARCHAR(50)  NOT NULL DEFAULT 'Active',
    CONSTRAINT [PK_Driver] PRIMARY KEY ([driverId])
);

