USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[S_BatchBoxDetails]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--sp_helptext LCJ_AddDataEntry1

CREATE PROCEDURE [dbo].[S_BatchBoxDetails] -- [S_BatchBoxDetails] 869
  
(  
	@autoid varchar(50)      
)  
AS  
BEGIN
	select * from tblProviderBoxDetails where auto_id=@autoid 
End
GO
