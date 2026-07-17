CREATE VIEW [dbo].[vw_HighestRevenueTripsPerMonth]
	AS 
		WITH rankedTable
		AS
		(
		SELECT 		
				t.tripId,
				l.revenue,
				de.actualDatetime,
				DENSE_RANK() OVER (
									PARTITION BY 
										YEAR(de.actualDatetime),
										MONTH(de.actualDatetime)
									ORDER BY l.revenue DESC
								  ) as [rank]
		FROM dbo.Trip as t
		JOIN dbo.Load as l
			ON t.loadId = l.loadId
		JOIN dbo.DeliveryEvent as de
			ON t.tripId = de.tripId
		WHERE 
			tripStatus = 'Completed'
			AND de.eventType = 'Delivery'
		)
		SELECT 
			tripId,
			revenue,
			actualDatetime,
			[rank]
		FROM rankedTable
		WHERE [rank] <= 3
