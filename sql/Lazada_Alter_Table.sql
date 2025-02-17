--Lazada SQL
-- This part does Transform of ETL (Extract, Transform and Load).
-- Data from csv file inserted to [dbo].[LazadaProducts] table is being processed.


-- add category column
	ALTER TABLE [dbo].[LazadaProducts]
	ADD category VARCHAR(50);

-- delete NULL columns
	ALTER TABLE [dbo].[LazadaProducts]
	drop column [discount],[shop_id];