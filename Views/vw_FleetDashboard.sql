CREATE VIEW [dbo].[vw_FleetDashboard]
AS
	SELECT 
		tt.onTripTrucks,
		tt.maintenancetrucks,
		tt.activeTrucks,
		ad.activeDrivers,
		[at].activeTrips,
		ct.completedTrips,
		ct.revenueToday
		FROM 
		(
			SELECT 
				SUM(CASE WHEN [status] ='On Trip' THEN 1 ELSE 0 END) AS onTripTrucks,
				SUM(CASE WHEN [status] ='Maintenance' THEN 1 ELSE 0 END) AS maintenancetrucks,
				SUM(CASE WHEN [status] ='Active' THEN 1 ELSE 0 END) AS activeTrucks
			FROM Truck
		) AS tt
		CROSS JOIN
		(
			SELECT COUNT(*) AS activeDrivers
			FROM Driver
			WHERE [status] = 'Active'
		) AS ad
		CROSS JOIN
		(
			SELECT COUNT(*) AS activeTrips
			FROM Trip
			WHERE tripStatus IN ('Started','Not Started')
		)  AS [at]
		CROSS JOIN
		(
		SELECT COUNT(*) as completedTrips, ISNULL(SUM(l.revenue), 0) as revenueToday		
				FROM Trip AS t
			JOIN [Load] AS l
				ON t.loadId = l.loadId 
			JOIN DeliveryEvent AS d
				ON t.tripId = d.tripId
			WHERE t.tripStatus = 'Completed'
				AND d.eventType = 'Delivery'
				AND d.actualDatetime >= CAST(SYSDATETIME() AS DATE) 
				AND d.actualDatetime < DATEADD(DAY,1,CAST(SYSDATETIME() AS DATE))
		) as ct
		


