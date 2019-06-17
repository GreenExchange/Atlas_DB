USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[Get_Action_List]    Script Date: 6/17/2019 2:54:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_Action_List]  --[Get_Action_List] '0'
 @DenialType NVARCHAR(50)        
AS        
BEGIN 

	select '0' as Action_id,' --- Select Action --- ' as Action_Type 
	UNION     
	select Action_id,Action_Type from tblaction where DenialReasons_Id=(select min(DenialReasons_Id) from tblDenialReasons where DenialReasons_Type=@DenialType)

END
GO
