CREATE PROCEDURE [dbo].[SearchTripDynamic]
	@DriverId NVARCHAR(50) = NULL,
	@TruckId NVARCHAR(50) = NULL,
	@TripStatus NVARCHAR(50) = NULL,
	@DispatchDate DATE = NULL
AS
BEGIN
	DECLARE @Querystr NVARCHAR(200) =
		'SELECT *
		 FROM dbo.Trip
		 WHERE 1=1';
	SET @Querystr +=
		CASE
			WHEN @DriverId IS NOT NULL THEN 'AND driverId = @DriverId' 
			WHEN @TruckId IS NOT NULL THEN 'AND truckId = @TruckId'
			WHEN @TripStatus IS NOT NULL THEN 'AND tripStatus = @TripStatus'
			WHEN @DispatchDate IS NOT NULL THEN 'AND dispatchDate = @DispatchDate'
			ELSE ''
		END;

	EXEC sp_executesql 
		@Querystr,
		N'@DriverId NVARCHAR(50),
		@TruckId NVARCHAR(50),
		@TripStatus NVARCHAR(50),
		@DispatchDate DATE',
		@DriverId,
		@TruckId,
		@TripStatus,
		@DispatchDate;
	RETURN 0
END
