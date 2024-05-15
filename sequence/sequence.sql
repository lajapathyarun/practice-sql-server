-- CREATE SEQUENCE
CREATE SEQUENCE productSequence AS INT
		START WITH 1
		INCREMENT BY 1
		MINVALUE 1
		MAXVALUE 999999
		CACHE 50

CREATE SEQUENCE productSequence1 AS BIGINT
		START WITH 1
		INCREMENT BY 1

-- Info about Sequences
SELECT *
FROM sys.sequences

-- Retrive Next Value from Sequence
SELECT NEXT VALUE FOR productSequence1

-- Update Id column with Sequence if value is NULL
UPDATE [dbo].[tblProduct]
		SET Id = NEXT VALUE FOR productSequence
		WHERE id IS NULL

-- ALTER SEQUENCE
ALTER SEQUENCE productSequence
		RESTART WITH 1

-- DROP SEQUENCE
DROP SEQUENCE productSequence
