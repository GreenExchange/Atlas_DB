USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[UpdateAzureTransferStatus_of_File]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateAzureTransferStatus_of_File]

@ImageId int,
@TransferStatus varchar(200),
@BasePathId int
AS
BEGIN
	
	SET NOCOUNT ON;
	 if exists(select * from tblDocImages where ImageID =@ImageId )
	 begin
	 update tblDocImages set statusdone =@TransferStatus,BasePathId=@BasePathId where ImageID=@ImageId and DomainId='AF' 
	 end

  
END
GO
