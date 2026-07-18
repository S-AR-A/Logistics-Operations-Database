CREATE PROC dbo.CompleteTrip
	@TripId NVARCHAR(50),
	@ActualDistanceMiles SMALLINT,
    @ActualDurationHours FLOAT(53),
    @FuelGallonsUsed     DECIMAL(19,4),
    @IdleTimeHours       FLOAT(53)
AS
BEGIN
    BEGIN TRY
        BEGIN TRAN          
            UPDATE Trip
        SET tripStatus = 'Completed',
            actualDistanceMiles = @ActualDistanceMiles,
            actualDurationHours = @ActualDurationHours,
            fuelGallonsUsed = @FuelGallonsUsed,
            averageMpg = @ActualDistanceMiles/@FuelGallonsUsed,
            idleTimeHours = @IdleTimeHours
        WHERE tripId = @TripId

        IF @@ROWCOUNT = 0
            THROW 50001,'No such a ''Started'' trip exists, sire!',1

        UPDATE dbo.Truck
        SET [status] = 'Active'
        WHERE truckId = (SELECT truckId FROM dbo.Trip WHERE tripId = @TripId)

        UPDATE dbo.Driver
        SET [status] = 'Active'
        WHERE driverId = (SELECT driverId FROM dbo.Trip WHERE tripId = @TripId)
        COMMIT
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT >0
            ROLLBACK;
        THROW
    END CATCH
        
END

