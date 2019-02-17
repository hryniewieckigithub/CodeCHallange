
-- =============================================
-- Author:		Lukasz Hryniewiecki
-- Create date: 2019-02-17
-- Description:	This SP is finding  the biggest difference between two market opening prices
-- Input parameters are: 
-- @StockValuesLine: comma separated list of values for particular days of previous months
-- @CheckPreviousMonth:  check if number of values equals to number of days in previous month
-- @DataSeparator: define separator for input stock values Line
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetBiggestTradeProfit]
@StockValuesLine VARCHAR(400),
@DataSeparator CHAR(1),
@CheckPreviousMonth BIT
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY

		DECLARE @StockValues TABLE(OpeningValue DECIMAL(9,2), DayNo TINYINT)
		DECLARE @QtyValues SMALLINT
		DECLARE @Result VARCHAR(100)

		
		--Validation if all values are numeric
		INSERT INTO @StockValues(OpeningValue, DayNo)
		SELECT sp.[Value], TRY_CONVERT(DECIMAL(9,2),sp.[ValueIndex])
		FROM dbo.tvf_SplitString(@StockValuesLine, @dataSeparator) sp

		SET @QtyValues = @@ROWCOUNT

		--Validation to check if all values are numeric
		IF EXISTS
		(
		SELECT TOP(1) DayNo
		FROM @StockValues
		WHERE OpeningValue IS NULL
		)
		BEGIN
			RAISERROR('Wrong input data: all values must be numeric type', 16, 1)
		END

		--Validation to check if number of values equals to number of days in previous month
		IF @CheckPreviousMonth = 1 AND @QtyValues <>  DAY(DATEADD(DD,-1,DATEADD(mm, DATEDIFF(mm, 0, GETDATE()), 0)))
		BEGIN
			RAISERROR('Wrong input data: Number of values are different than number of day in previous month', 16, 1)
		END
		--Validation of negative values
		IF EXISTS
		(
		SELECT TOP(1) DayNo
		FROM @StockValues
		WHERE OpeningValue < 0.0
		)
		BEGIN
			RAISERROR('Wrong input data: Share price cannot be negative value', 16, 1)
		END
		
		--Calculation
		SELECT TOP(1) CAST(df.DayNo AS VARCHAR(10)) + '(' + CAST(df.OpeningValue AS VARCHAR(10)) + '),' + 
		CAST(df.DayNoNext AS VARCHAR(10)) + '(' + CAST(df.OpeningValueNext AS VARCHAR(10)) + ')' AS BestDeal
		FROM
		(
		SELECT svn.OpeningValue - sv.OpeningValue as Diff, sv.DayNo, svn.DayNo AS DayNoNext, sv.OpeningValue, svn.OpeningValue AS OpeningValueNext
		FROM  @StockValues sv
		JOIN @StockValues svn on svn.DayNo > sv.DayNo
		) df
		ORDER BY df.Diff DESC
	END TRY
	BEGIN  CATCH
		THROW
	END CATCH
END
