-- ? Get random number
DECLARE @counter SMALLINT;
SET @counter = 1;
WHILE @counter < 5
   BEGIN
      SELECT RAND() Random_Number
      SET @counter = @counter + 1
   END;
GO

-- ? Get circle area
DECLARE @r SMALLINT;
SET @r=5;
SELECT (PI()*POWER(@r,2)) AS 'Area de Circulo';

DECLARE @b FLOAT;
DECLARE @c FLOAT;
DECLARE @angleA FLOAT;
DECLARE @result FLOAT;
DECLARE @R2 FLOAT;
SET @b = 12;
SET @c = 7;
SET @angleA = 40;
SELECT @result=(POWER(@b,2))+(POWER(@c,2))
SELECT @R2 = ((2*(@b)*(@c)))*((COS(@angleA/180*PI())))
SELECT @result = @result -@R2
SELECT POWER(@result,0.5) as 'Ley de Cosenos';
GO