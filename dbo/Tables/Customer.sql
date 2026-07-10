CREATE TABLE dbo.Customer (
    customerId             NVARCHAR (50) NOT NULL,
    customerName           NVARCHAR (50) NOT NULL,
    customerType           NVARCHAR (50) NOT NULL,
    creditTermsDays        TINYINT       NOT NULL,
    primaryFreightType     NVARCHAR (50) NOT NULL,
    accountStatus          NVARCHAR (50) NOT NULL,
    contractStartDate      DATE          NOT NULL,
    annualRevenuePotential INT           NOT NULL,
    CONSTRAINT PK_Customer PRIMARY KEY CLUSTERED (customerId ASC)
);
