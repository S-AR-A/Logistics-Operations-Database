CREATE VIEW [dbo].[vw_CustomerShippingHistory]
AS
SELECT 
	c.customerId,
	c.customerName,
	l.loadType,
	t.tripId,
	t.dispatchDate,
	r.originCity + ', ' + r.originState AS origin,
	r.destinationCity + ', ' + r.destinationState as destination,
	l.revenue,
	t.actualDurationHours AS duration,
	t.fuelGallonsUsed AS fuelUsed,
	t.averageMpg AS mpg
FROM Customer AS c
JOIN dbo.[Load] AS l
ON c.customerId = l.customerId
JOIN Trip AS t
ON l.loadId = t.loadId
JOIN [Route] AS r
ON l.routeId = r.routeId
WHERE t.tripStatus = 'Completed'

