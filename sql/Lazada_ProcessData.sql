--Lazada SQL
-- This part does Transform of ETL (Extract, Transform and Load).
-- Data from csv file inserted to [dbo].[LazadaProducts] table is being processed.

-- categorize into airpods or case
    UPDATE [dbo].[LazadaProducts]
	SET category = CASE 
		WHEN title LIKE '%case%' THEN 'CASE' 
		ELSE 'AIRPODS' 
	END
	WHERE category IS NULL;
  
  -- fix sold count into float, removing decimal and K
	UPDATE [dbo].[LazadaProducts]
	SET sold_count = 
		CASE 
			WHEN sold_count LIKE '%.%K' THEN CAST(LEFT(sold_count, LEN(sold_count) - 2) AS FLOAT) * 1000
			ELSE CAST(sold_count AS FLOAT) END
	WHERE sold_count LIKE '%K%';

-- alter sold_count to int
	ALTER TABLE [dbo].[LazadaProducts]
	ALTER COLUMN sold_count INT;

-- put 0 on NULL sold_count
	update [dbo].[LazadaProducts]
	set sold_count = 0
	where sold_count is null

-- put 0 on NULL origin_price
	update [dbo].[LazadaProducts]
	set origin_price = 0
	where origin_price is null

-- put 0 on NULL average_score
	update [dbo].[LazadaProducts]
	set average_score = 0
	where average_score is null

-- remove "Metro Manila~" in area_from
	UPDATE [dbo].[LazadaProducts]
	SET area_from = CASE 
    WHEN area_from LIKE 'Metro Manila~%' THEN SUBSTRING(area_from, 14, LEN(area_from)) 
    ELSE area_from END;

