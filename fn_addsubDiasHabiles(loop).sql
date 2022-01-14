CREATE FUNCTION fn_addDiasHabiles(@fechaDesde AS DATE, @cantDias AS INT)
RETURNS DATE
AS

BEGIN
	IF @cantDias>0
		WHILE @cantDias>0
			BEGIN
				SET @fechaDesde=DATEADD(d,1,@fechaDesde)
				IF DATENAME(DW,@fechaDesde)='saturday' SET @fechaDesde=DATEADD(d,1,@fechaDesde)
				IF DATENAME(DW,@fechaDesde)='sunday' SET @fechaDesde=DATEADD(d,1,@fechaDesde)
  
				SET @cantDias=@cantDias-1
			END
	ELSE IF @cantDias < 0
		WHILE @cantDias < 0
		   BEGIN
				SET @fechaDesde=DATEADD(d,-1,@fechaDesde)
				IF DATENAME(DW,@fechaDesde)='sunday' SET @fechaDesde=DATEADD(d,-1,@fechaDesde)
				IF DATENAME(DW,@fechaDesde)='saturday' SET @fechaDesde=DATEADD(d,-1,@fechaDesde)
			
				SET @cantDias=@cantDias+1
		   END
	RETURN @fechaDesde
END
GO  
