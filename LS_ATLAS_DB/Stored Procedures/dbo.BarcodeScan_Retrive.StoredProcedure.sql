USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[BarcodeScan_Retrive]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BarcodeScan_Retrive]
	-- Add the parameters for the stored procedure here
	@UserId nchar(10),
	@DomainId nvarchar(50),
	@DocType nvarchar(100),
	@TempPath nvarchar(200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select BarcodeVal,(replace(@TempPath,'\','/')+ImagePath+FileName) as Link, ImagePath+FileName as filepath  
	from BarcodeScan where UserId=@UserId and 
	DomainId=@DomainId and DocType=@DocType AND ActiveFlag=1
END
GO
