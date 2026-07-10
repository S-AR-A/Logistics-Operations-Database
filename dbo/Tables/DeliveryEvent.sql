CREATE TABLE [dbo].[DeliveryEvent]
(	
eventId NVARCHAR(50),
loadId NVARCHAR(50),
tripId NVARCHAR(50),
eventType NVARCHAR(10),
facilityId NVARCHAR(50),
scheduledDatetime DATETIME2(7),
actualDatetime DATETIME2(7),
detentionMinutes SMALLINT,
onTimeFlag NVARCHAR(50),
locationCity NVARCHAR(50),
locationState NVARCHAR(3),
CONSTRAINT PK_eventId PRIMARY KEY (eventId),
CONSTRAINT FK_DeliveryEvent_Load FOREIGN KEY (loadId) REFERENCES dbo.Load(loadId),
CONSTRAINT FK_DeliveryEvent_Trip FOREIGN KEY (tripId) REFERENCES dbo.Trip(tripId),
CONSTRAINT FK_DeliveryEvent_Facility FOREIGN KEY (facilityId) REFERENCES dbo.Facility(facilityId)
)
