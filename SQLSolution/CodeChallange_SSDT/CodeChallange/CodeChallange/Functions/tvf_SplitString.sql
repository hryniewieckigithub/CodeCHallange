-- =============================================
-- Author:		Lukasz Hryniewiecki
-- Create date: 2019-02-17
-- Description:	Table valued function to split string by given separator
-- =============================================
CREATE FUNCTION [dbo].[tvf_SplitString] ( @InputValue VARCHAR(MAX), @Delimiter char(1) )
RETURNS
 @returnList TABLE ([Value] nvarchar (MAX), [ValueIndex] int)
AS
BEGIN

 DECLARE @name NVARCHAR(255)
 DECLARE @pos INT
 DECLARE @TokenNumber INT = 1

 WHILE CHARINDEX(',', @InputValue) > 0
 BEGIN
  SELECT @pos  = CHARINDEX(@Delimiter, @InputValue)  
  SELECT @name = SUBSTRING(@InputValue, 1, @pos-1)

  INSERT INTO @returnList(Value, ValueIndex)
  SELECT @name, @TokenNumber

  SET @TokenNumber+=1

  SELECT @inputValue = SUBSTRING(@inputValue, @pos+1, LEN(@inputValue)-@pos)
 END

 INSERT INTO @returnList(Value, ValueIndex)
 SELECT @inputValue, @TokenNumber

 RETURN
END
