CREATE PROCEDURE [dbo].[StartTrip]
	@TripId NVARCHAR(50)
AS
BEGIN
	IF NOT EXISTS (
	SELECT 1 FROM Trip 
	WHERE tripId = @TripId 
		AND tripStatus = 'Not Started'
		AND driverId IS NOT NULL
		AND truckId IS NOT NULL
	)
		THROW 50001,
			'No such trip with ''Not Started'' state or
			driver is not assigned or truck is not assigned, sire!',
			1
	UPDATE Trip
	SET tripStatus = 'Started'
	WHERE tripId =@TripId
END
RETURN 0
