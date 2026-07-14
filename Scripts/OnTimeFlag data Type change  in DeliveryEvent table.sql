ALTER TABLE dbo.DeliveryEvent
ADD onTimeFlag_New BIT;

go

UPDATE dbo.DeliveryEvent
SET onTimeFlag_New =
    CASE onTimeFlag
        WHEN 'True' THEN 1
        WHEN 'False' THEN 0
    END;

go

ALTER TABLE dbo.DeliveryEvent
DROP COLUMN onTimeFlag;

go

EXEC sp_rename
    'dbo.DeliveryEvent.onTimeFlag_New',
    'onTimeFlag',
    'COLUMN';
