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
--? Este ejemplo calcula el ATN2 para los componentes xy especificados y.

DECLARE @x FLOAT = 35.175643, @y FLOAT = 129.44;
SELECT 'El ATN2 del ángulo es:' + CONVERT (VARCHAR, ATN2 (@y, @x))
GO

--? Este ejemplo demuestra elevar un número a la potencia de 3 (el cubo del número).

DECLARE @input1 FLOAT;  
DECLARE @input2 FLOAT;  
SET @input1= 2;  
SET @input2 = 2.5;  
SELECT POWER(@input1, 3) AS Result1, POWER(@input2, 3) AS Result2
GO

