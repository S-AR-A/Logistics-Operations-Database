CREATE PROCEDURE [dbo].[ProcessTumMonth]
	@TruckId NVARCHAR(50),
	@Year	 INT,
	@month   INT
AS
BEGIN
	DECLARE @CurrentTime DATETIME2(7) = SYSDATETIME();
	IF  month(@CurrentTime) = @month
		and day(@CurrentTime) = 1
		and CAST(@CurrentTime as time) = '00:00:0000000'
		THROW 2147483647,'Bad timing. Try again, sire!',255
	IF @month > 12 OR @month < 1 OR @Year < 1900 OR @Year > 9999
		THROW 50001,'Invalid date, sire!',1
	ELSE IF YEAR(@CurrentTime) < @Year
		THROW 50001,'Can not process future months, sire!',1
	ELSE IF YEAR(@CurrentTime) = @Year 
		AND MONTH(@CurrentTime) < @month
		THROW 50001,'Can not process future months, sire!',1

	DECLARE @TripsCompleted			TINYINT;
	DECLARE	@TotalMiles				INT;
	DECLARE @TotalRevenue			DECIMAL(19,4);
	DECLARE	@AverageMpg				FLOAT(53);
	DECLARE	@MaintenanceEvents		TINYINT;
	DECLARE	@MaintenanceCost		DECIMAL(19,4);
	DECLARE @DowntimeHours			FLOAT(53);
	DECLARE	@OnTripHours			FLOAT(53);

	SELECT 
		@MaintenanceEvents = COUNT(*),
		@MaintenanceCost = ISNULL(SUM(totalCost),0),
		@DowntimeHours = ISNULL(SUM(downtimeHours),0)
	FROM dbo.MaintenanceRecord
	WHERE truckId = @TruckId
		AND YEAR(maintenanceDate) = @Year
		AND MONTH(maintenanceDate) = @month;
	
	WITH TripWithRevenue
	AS
	(
		SELECT t.*, l.revenue, d.actualDatetime as adt
		FROM Trip AS t
			join dbo.[Load] AS l
				on t.loadId = l.loadId
			join dbo.DeliveryEvent as d
				on t.tripId = d.tripId
				and d.eventType = 'Delivery'
	)
	SELECT 
		@TripsCompleted = COUNT(*),
		@TotalMiles = ISNULL(SUM(actualDistanceMiles),0),
		@TotalRevenue = ISNULL(SUM(revenue),0),
		@AverageMpg = ISNULL(AVG(averageMpg),0),
		@OnTripHours = ISNULL(SUM(actualDurationHours),0)
	FROM TripWithRevenue
	WHERE truckId = @TruckId
		and tripStatus = 'Completed'
		AND YEAR(adt) = @Year
		AND MONTH(adt) = @month

	DECLARE @MonthAsDate DATE = DATEFROMPARTS(@Year,@month,1);
	IF NOT EXISTS 
		(
		SELECT 1
		FROM dbo.TruckUtilizationMetric AS t
		WHERE truckId = @TruckId 
			and [month] = @MonthAsDate
		)
		INSERT INTO dbo.TruckUtilizationMetric
			(
			truckId,
			[month],
			tripsCompleted,
			totalMiles,
			totalRevenue,
			averageMpg,
			maintenanceEvents,
			maintenanceCost,
			downtimeHours,
			utilizationRate
			)
			VALUES
				(
					@TruckId,
					@MonthAsDate,
					@TripsCompleted,
					@TotalMiles,
					@TotalRevenue,
					@AverageMpg,
					@MaintenanceEvents,
					@MaintenanceCost,
					@DowntimeHours,
					@OnTripHours / DATEDIFF
								   (
										HOUR,
										@MonthAsDate,
										DATEADD(MONTH,1,@MonthAsDate)
									)
				)
	ELSE
		UPDATE dbo.TruckUtilizationMetric
		SET tripsCompleted = @TripsCompleted,
			totalMiles = @TotalMiles,
			totalRevenue = @TotalRevenue,
			averageMpg = @AverageMpg,
			maintenanceEvents = @MaintenanceEvents,
			maintenanceCost = @MaintenanceCost,
			downtimeHours = @DowntimeHours,
			utilizationRate = @OnTripHours / DATEDIFF
								   (
										HOUR,
										@MonthAsDate,
										DATEADD(MONTH,1,@MonthAsDate)
									)
		WHERE truckId =@TruckId
			AND [month] = @MonthAsDate
		
END
