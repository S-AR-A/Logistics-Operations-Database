CREATE PROCEDURE [dbo].[AssignTruckToTrip]
	@TripId	NVARCHAR(50),
	@TruckId NVARCHAR(50)
AS
BEGIN
	BEGIN TRY
		BEGIN TRAN
		IF NOT EXISTS (
			SELECT 1 
			FROM Trip WITH (UPDLOCK,HOLDLOCK)
			WHERE tripId = @TripId
		)
			THROW 50001,'No such a trip exists, sire!',1
		ELSE IF EXISTS (
			SELECT 1 
			FROM Trip 
			WHERE tripId = @TripId 
				AND tripStatus IN ('Completed','Cancelled')
		)
			THROW 50002,'This trip is not active, sire!',1
		ELSE IF NOT EXISTS (
			SELECT 1
			FROM Truck WITH (UPDLOCK,HOLDLOCK)
			WHERE TruckId = @TruckId
		)
			THROW 50003,'No such a truck exists, sire!',1
		ELSE IF EXISTS (
			SELECT 1
			FROM Truck 
			WHERE TruckId = @TruckId
				AND status = 'Maintenance'
		)
			THROW 50004,'This truck is in maintenance, sire!',1
		ELSE IF EXISTS (
			SELECT 1
			FROM Trip 
			WHERE TruckId = @TruckId
				AND tripStatus IN ('Not Started','Started')
		)
			THROW 50005,'This truck is already assigned to an active trip, sire!',1
		
		UPDATE dbo.Truck
		SET status = 'On Trip'
		WHERE truckId = @TruckId;

		UPDATE dbo.Trip
		SET truckId = @TruckId
		WHERE tripId = @TripId;

		COMMIT
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK;
		THROW
	END CATCH
	RETURN 0
END
