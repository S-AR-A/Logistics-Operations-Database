CREATE TRIGGER dbo.[tg_TripUpdate]
	ON [dbo].[Trip]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON;
		INSERT INTO dbo.TripAudit
			(
			tripId,
			oldDriver,
			newDriver,
			oldTruck,
			newTruck,
			oldStatus,
			newStatus
			)
		SELECT 
			i.tripId,
			d.driverId,
			i.driverId,
			d.truckId,
			i.truckId,
			d.tripStatus,
			i.tripStatus
		From inserted as i
		JOIN deleted as d
			ON i.tripId = d.tripId
		WHERE 
			ISNULL(i.driverId, '')  <> ISNULL(d.driverId, '')
			OR ISNULL(i.truckId, '') <> ISNULL(d.truckId, '')
			OR ISNULL(i.tripStatus, '') <> ISNULL(d.tripStatus, '')
	END

