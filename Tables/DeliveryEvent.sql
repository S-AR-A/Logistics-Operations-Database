CREATE TABLE [dbo].[DeliveryEvent]
(	
eventId NVARCHAR(50),
loadId NVARCHAR(50) NOT NULL,
tripId NVARCHAR(50) NOT NULL,
eventType NVARCHAR(10) NOT NULL,
facilityId NVARCHAR(50) NOT NULL,
scheduledDatetime DATETIME2(7) NOT NULL,
actualDatetime DATETIME2(7) NOT NULL,
detentionMinutes SMALLINT NOT NULL,
onTimeFlag BIT NOT NULL,
locationCity NVARCHAR(50) NOT NULL,
locationState NVARCHAR(3) NOT NULL,
CONSTRAINT PK_eventId PRIMARY KEY (eventId),
CONSTRAINT FK_DeliveryEvent_Load FOREIGN KEY (loadId) REFERENCES dbo.Load(loadId),
CONSTRAINT FK_DeliveryEvent_Trip FOREIGN KEY (tripId) REFERENCES dbo.Trip(tripId),
CONSTRAINT FK_DeliveryEvent_Facility FOREIGN KEY (facilityId) REFERENCES dbo.Facility(facilityId)
)
