USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[sp_generate_inserts]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_generate_inserts]
(
 @table_name varchar(776),    -- The table/view for which the INSERT statements will be generated using the existing data
 @target_table varchar(776) = NULL,  -- Use this parameter to specify a different table name into which the data will be inserted
 @include_column_list bit = 1,  -- Use this parameter to include/ommit column list in the generated INSERT statement
 @from varchar(800) = NULL,   -- Use this parameter to filter the rows based on a filter condition (using WHERE)
 @include_timestamp bit = 0,   -- Specify 1 for this parameter, if you want to include the TIMESTAMP/ROWVERSION column's data in the INSERT statement
 @debug_mode bit = 0,   -- If @debug_mode is set to 1, the SQL statements constructed by this procedure will be printed for later examination
 @owner varchar(64) = NULL,  -- Use this parameter if you are not the owner of the table
 @ommit_images bit = 0,   -- Use this parameter to generate INSERT statements by omitting the 'image' columns
 @ommit_identity bit = 0,  -- Use this parameter to ommit the identity columns
 @top int = NULL,   -- Use this parameter to generate INSERT statements only for the TOP n rows
 @cols_to_include varchar(8000) = NULL, -- List of columns to be included in the INSERT statement
 @cols_to_exclude varchar(8000) = NULL, -- List of columns to be excluded from the INSERT statement
 @disable_constraints bit = 0,  -- When 1, disables foreign key constraints and enables them after the INSERT statements
 @ommit_computed_cols bit = 0  -- When 1, computed columns will not be included in the INSERT statement
)
AS
BEGIN

IF @owner IS NULL
 BEGIN
  IF ((OBJECT_ID(@table_name,'U') IS NULL) AND (OBJECT_ID(@table_name,'V') IS NULL)) 
   BEGIN
    RAISERROR('User table or view not found.',16,1)
    PRINT 'You may see this error, if you are not the owner of this table or view. In that case use @owner parameter to specify the owner name.'
    PRINT 'Make sure you have SELECT permission on that table or view.'
    RETURN -1 --Failure. Reason: There is no user table or view with this name
   END
 END
ELSE
 BEGIN
  IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = @table_name AND (TABLE_TYPE = 'BASE TABLE' OR TABLE_TYPE = 'VIEW') AND TABLE_SCHEMA = @owner)
   BEGIN
    RAISERROR('User table or view not found.',16,1)
    PRINT 'You may see this error, if you are not the owner of this table. In that case use @owner parameter to specify the owner name.'
    PRINT 'Make sure you have SELECT permission on that table or view.'
    RETURN -1 --Failure. Reason: There is no user table or view with this name  
   END
 END

--Variable declarations
DECLARE  @Column_ID int,   
  @Column_List varchar(8000), 
  @Column_Name varchar(128), 
  @Start_Insert varchar(786), 
  @Data_Type varchar(128), 
  @Actual_Values varchar(8000), --This is the string that will be finally executed to generate INSERT statements
  @IDN varchar(128)  --Will contain the IDENTITY column's name in the table

--Variable Initialization
SET @IDN = ''
SET @Column_ID = 0
SET @Column_Name = ''
SET @Column_List = ''
SET @Actual_Values = ''

IF @owner IS NULL 
 BEGIN
  SET @Start_Insert = 'INSERT INTO ' + '[' + RTRIM(COALESCE(@target_table,@table_name)) + ']' 
 END
ELSE
 BEGIN
  SET @Start_Insert = 'INSERT ' + '[' + LTRIM(RTRIM(@owner)) + '].' + '[' + RTRIM(COALESCE(@target_table,@table_name)) + ']'   
 END


--To get the first column's ID

SELECT @Column_ID = MIN(ORDINAL_POSITION)  
FROM INFORMATION_SCHEMA.COLUMNS (NOLOCK) 
WHERE  TABLE_NAME = @table_name AND
(@owner IS NULL OR TABLE_SCHEMA = @owner)



--Loop through all the columns of the table, to get the column names and their data types
WHILE @Column_ID IS NOT NULL
 BEGIN
  SELECT  @Column_Name = QUOTENAME(COLUMN_NAME), 
  @Data_Type = DATA_TYPE 
  FROM  INFORMATION_SCHEMA.COLUMNS (NOLOCK) 
  WHERE  ORDINAL_POSITION = @Column_ID AND 
  TABLE_NAME = @table_name AND
  (@owner IS NULL OR TABLE_SCHEMA = @owner)



  IF @cols_to_include IS NOT NULL --Selecting only user specified columns
  BEGIN
   IF CHARINDEX( '''' + SUBSTRING(@Column_Name,2,LEN(@Column_Name)-2) + '''',@cols_to_include) = 0 
   BEGIN
    GOTO SKIP_LOOP
   END
  END

  IF @cols_to_exclude IS NOT NULL --Selecting only user specified columns
  BEGIN
   IF CHARINDEX( '''' + SUBSTRING(@Column_Name,2,LEN(@Column_Name)-2) + '''',@cols_to_exclude) <> 0 
   BEGIN
    GOTO SKIP_LOOP
   END
  END

  --Making sure to output SET IDENTITY_INSERT ON/OFF in case the table has an IDENTITY column
  IF (SELECT COLUMNPROPERTY( OBJECT_ID(QUOTENAME(COALESCE(@owner,USER_NAME())) + '.' + @table_name),SUBSTRING(@Column_Name,2,LEN(@Column_Name) - 2),'IsIdentity')) = 1 
  BEGIN
   IF @ommit_identity = 0 --Determing whether to include or exclude the IDENTITY column
    SET @IDN = @Column_Name
   ELSE
    GOTO SKIP_LOOP   
  END
  
  --Making sure whether to output computed columns or not
  IF @ommit_computed_cols = 1
  BEGIN
   IF (SELECT COLUMNPROPERTY( OBJECT_ID(QUOTENAME(COALESCE(@owner,USER_NAME())) + '.' + @table_name),SUBSTRING(@Column_Name,2,LEN(@Column_Name) - 2),'IsComputed')) = 1 
   BEGIN
    GOTO SKIP_LOOP     
   END
  END
  
  --Tables with columns of IMAGE data type are not supported for obvious reasons
  IF(@Data_Type in ('image'))
   BEGIN
    IF (@ommit_images = 0)
     BEGIN
      RAISERROR('Tables with image columns are not supported.',16,1)
      PRINT 'Use @ommit_images = 1 parameter to generate INSERTs for the rest of the columns.'
      PRINT 'DO NOT ommit Column List in the INSERT statements. If you ommit column list using @include_column_list=0, the generated INSERTs will fail.'
      RETURN -1 --Failure. Reason: There is a column with image data type
     END
    ELSE
     BEGIN
     GOTO SKIP_LOOP
     END
   END

  --Determining the data type of the column and depending on the data type, the VALUES part of
  --the INSERT statement is generated. Care is taken to handle columns with NULL values. Also
  --making sure, not to lose any data from flot, real, money, smallmomey, datetime columns
  SET @Actual_Values = @Actual_Values  +
  CASE 
   WHEN @Data_Type IN ('char','varchar','nchar','nvarchar') 
    THEN 
     'COALESCE('''''''' + REPLACE(RTRIM(' + @Column_Name + '),'''''''','''''''''''')+'''''''',''NULL'')'
   WHEN @Data_Type IN ('datetime','smalldatetime') 
    THEN 
     'COALESCE('''''''' + RTRIM(CONVERT(char,' + @Column_Name + ',109))+'''''''',''NULL'')'
   WHEN @Data_Type IN ('uniqueidentifier') 
    THEN  
     'COALESCE('''''''' + REPLACE(CONVERT(char(255),RTRIM(' + @Column_Name + ')),'''''''','''''''''''')+'''''''',''NULL'')'
   WHEN @Data_Type IN ('text','ntext') 
    THEN  
     'COALESCE('''''''' + REPLACE(CONVERT(char(8000),' + @Column_Name + '),'''''''','''''''''''')+'''''''',''NULL'')'     
   WHEN @Data_Type IN ('binary','varbinary') 
    THEN  
     'COALESCE(RTRIM(CONVERT(char,' + 'CONVERT(int,' + @Column_Name + '))),''NULL'')'  
   WHEN @Data_Type IN ('timestamp','rowversion') 
    THEN  
     CASE 
      WHEN @include_timestamp = 0 
       THEN 
        '''DEFAULT''' 
       ELSE 
        'COALESCE(RTRIM(CONVERT(char,' + 'CONVERT(int,' + @Column_Name + '))),''NULL'')'  
     END
   WHEN @Data_Type IN ('float','real','money','smallmoney')
    THEN
     'COALESCE(LTRIM(RTRIM(' + 'CONVERT(char, ' +  @Column_Name  + ',2)' + ')),''NULL'')' 
   ELSE 
    'COALESCE(LTRIM(RTRIM(' + 'CONVERT(char, ' +  @Column_Name  + ')' + ')),''NULL'')' 
  END   + '+' +  ''',''' + ' + '
  
  --Generating the column list for the INSERT statement
  SET @Column_List = @Column_List +  @Column_Name + ',' 

  SKIP_LOOP: --The label used in GOTO

  SELECT  @Column_ID = MIN(ORDINAL_POSITION) 
  FROM  INFORMATION_SCHEMA.COLUMNS (NOLOCK) 
  WHERE  TABLE_NAME = @table_name AND 
  ORDINAL_POSITION > @Column_ID AND
  (@owner IS NULL OR TABLE_SCHEMA = @owner)


 --Loop ends here!
 END

--To get rid of the extra characters that got concatenated during the last run through the loop
SET @Column_List = LEFT(@Column_List,len(@Column_List) - 1)
SET @Actual_Values = LEFT(@Actual_Values,len(@Actual_Values) - 6)

IF LTRIM(@Column_List) = '' 
 BEGIN
  RAISERROR('No columns to select. There should at least be one column to generate the output',16,1)
  RETURN -1 --Failure. Reason: Looks like all the columns are ommitted using the @cols_to_exclude parameter
 END

--Forming the final string that will be executed, to output the INSERT statements
IF (@include_column_list <> 0)
 BEGIN
  SET @Actual_Values = 
   'SELECT ' +  
   CASE WHEN @top IS NULL OR @top < 0 THEN '' ELSE ' TOP ' + LTRIM(STR(@top)) + ' ' END + 
   '''' + RTRIM(@Start_Insert) + 
   ' ''+' + '''(' + RTRIM(@Column_List) +  '''+' + ''')''' + 
   ' +''VALUES(''+ ' +  @Actual_Values  + '+'')''' + ' ' + 
   COALESCE(@from,' FROM ' + CASE WHEN @owner IS NULL THEN '' ELSE '[' + LTRIM(RTRIM(@owner)) + '].' END + '[' + rtrim(@table_name) + ']' + '(NOLOCK)')
 END
ELSE IF (@include_column_list = 0)
 BEGIN
  SET @Actual_Values = 
   'SELECT ' + 
   CASE WHEN @top IS NULL OR @top < 0 THEN '' ELSE ' TOP ' + LTRIM(STR(@top)) + ' ' END + 
   '''' + RTRIM(@Start_Insert) + 
   ' '' +''VALUES(''+ ' +  @Actual_Values + '+'')''' + ' ' + 
   COALESCE(@from,' FROM ' + CASE WHEN @owner IS NULL THEN '' ELSE '[' + LTRIM(RTRIM(@owner)) + '].' END + '[' + rtrim(@table_name) + ']' + '(NOLOCK)')
 END 

--Determining whether to ouput any debug information
IF @debug_mode =1
 BEGIN
  PRINT '/*****START OF DEBUG INFORMATION*****'
  PRINT 'Beginning of the INSERT statement:'
  PRINT @Start_Insert
  PRINT ''
  PRINT 'The column list:'
  PRINT @Column_List
  PRINT ''
  PRINT 'The SELECT statement executed to generate the INSERTs'
  PRINT @Actual_Values
  PRINT ''
  PRINT '*****END OF DEBUG INFORMATION*****/'
  PRINT ''
 END
  
PRINT '--INSERTs generated by ''sp_generate_inserts'' stored procedure written by Vyas'
PRINT '--Build number: 22'
PRINT '--Problems/Suggestions? Contact Vyas @ vyaskn@hotmail.com'
PRINT '--http://vyaskn.tripod.com'
PRINT ''
PRINT 'SET NOCOUNT ON'
PRINT ''


--Determining whether to print IDENTITY_INSERT or not
IF (@IDN <> '')
 BEGIN
  PRINT 'SET IDENTITY_INSERT ' + QUOTENAME(COALESCE(@owner,USER_NAME())) + '.' + QUOTENAME(@table_name) + ' ON'
  PRINT 'GO'
  PRINT ''
 END


IF @disable_constraints = 1 AND (OBJECT_ID(QUOTENAME(COALESCE(@owner,USER_NAME())) + '.' + @table_name, 'U') IS NOT NULL)
 BEGIN
  IF @owner IS NULL
   BEGIN
    SELECT  'ALTER TABLE ' + QUOTENAME(COALESCE(@target_table, @table_name)) + ' NOCHECK CONSTRAINT ALL' AS '--Code to disable constraints temporarily'
   END
  ELSE
   BEGIN
    SELECT  'ALTER TABLE ' + QUOTENAME(@owner) + '.' + QUOTENAME(COALESCE(@target_table, @table_name)) + ' NOCHECK CONSTRAINT ALL' AS '--Code to disable constraints temporarily'
   END

  PRINT 'GO'
 END

PRINT ''
PRINT 'PRINT ''Inserting values into ' + '[' + RTRIM(COALESCE(@target_table,@table_name)) + ']' + ''''


--All the hard work pays off here!!! You'll get your INSERT statements, when the next line executes!
EXEC (@Actual_Values)

PRINT 'PRINT ''Done'''
PRINT ''


IF @disable_constraints = 1 AND (OBJECT_ID(QUOTENAME(COALESCE(@owner,USER_NAME())) + '.' + @table_name, 'U') IS NOT NULL)
 BEGIN
  IF @owner IS NULL
   BEGIN
    SELECT  'ALTER TABLE ' + QUOTENAME(COALESCE(@target_table, @table_name)) + ' CHECK CONSTRAINT ALL'  AS '--Code to enable the previously disabled constraints'
   END
  ELSE
   BEGIN
    SELECT  'ALTER TABLE ' + QUOTENAME(@owner) + '.' + QUOTENAME(COALESCE(@target_table, @table_name)) + ' CHECK CONSTRAINT ALL' AS '--Code to enable the previously disabled constraints'
   END

  PRINT 'GO'
 END

PRINT ''
IF (@IDN <> '')
 BEGIN
  PRINT 'SET IDENTITY_INSERT ' + QUOTENAME(COALESCE(@owner,USER_NAME())) + '.' + QUOTENAME(@table_name) + ' OFF'
  PRINT 'GO'
 END

PRINT 'SET NOCOUNT OFF'


SET NOCOUNT OFF
RETURN 0 --Success. We are done!
END

GO
