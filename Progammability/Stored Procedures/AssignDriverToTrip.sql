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
			ELSE IF EXISTS (
				SELECT 1 
				FROM dbo.Trip WITH (TABLOCK, HOLDLOCK)
				WHERE driverId = @driverId AND tripStatus IN ('Not Strated','Started')
				)
					THROW 50003,'Driver is assigned to another trip, sire!',1;
		UPDATE dbo.Trip
		SET driverId = @driverId
		WHERE tripId = @tripId 	
		COMMIT
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0 
			ROLLBACK;
		THROW;
	END CATCH
RETURN 0
END

