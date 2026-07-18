CREATE PROCEDURE [dbo].[AssignDriverToTrip]
	@tripId NVARCHAR(50),
	@driverId NVARCHAR(50)
AS
BEGIN
	BEGIN TRY
		BEGIN TRAN
		SET NOCOUNT ON;
		IF NOT EXISTS (SELECT 1 FROM dbo.Trip WHERE tripId = @tripId) OR
		EXISTS (SELECT 1 FROM Trip WHERE tripId = @tripId AND tripStatus IN ('Completed','Cancelled') )
			THROW 50001,'No such an active trip exists, sire!',1;
		ELSE IF NOT EXISTS (SELECT 1 FROM dbo.Driver WHERE driverId = @driverId)
				THROW 50002,'No such a driver exists, sire!',1;
		ELSE IF (SELECT [status] FROM dbo.Driver WHERE driverId = @driverId) <> 'Active'
				THROW 50003,'Driver is NOT available, sire!',1;
		UPDATE dbo.Trip
		SET driverId = @driverId
		WHERE tripId = @tripId 
		
		UPDATE dbo.Driver
		SET status = 'On Trip'
		WHERE driverId = @driverId
		COMMIT
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0 
			ROLLBACK;
		THROW;
	END CATCH
RETURN 0
END

