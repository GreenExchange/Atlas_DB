USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[sp_create_new_node_for_DMS]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_create_new_node_for_DMS] --'113','Added','CO00023','3581'  
(  
	@CaseID			NVARCHAR(max)='14360',  
	@NodeName		NVARCHAR(max)='Summons & Complaint',  
	@SZ_COMPANY_ID	NVARCHAR(20)=null ,  
	@Parent_ID		NVARCHAR(max)='1593657'  
)  
AS  
BEGIN  
  
	DECLARE @sub_node_level INT   
	DECLARE @sub_parent_id NVARCHAR(max)  
	SET @sub_parent_id=
	(
		SELECT  parentid FROM tbltags WHERE nodeid=@Parent_ID
	)  
  
   
IF @sub_parent_id IS NOT NULL  
	BEGIN  
		set @sub_node_level = (select  nodelevel FROM tbltags WHERE nodeid=@Parent_ID) +1  
		INSERT INTO 
			tblTags
		(
			NodeName,Expanded,ParentID,CaseID,NodeLevel
		)   
		VALUES
		(
			(LTRIM(RTRIM(@NodeName))),0,@Parent_ID,@CaseID,@sub_node_level
		)  
		select @@IDENTITY AS TagId  
	END  
ELSE  
	BEGIN    
		INSERT INTO 
			tblTags
		(
			NodeName,Expanded,ParentID,CaseID,NodeLevel
		)   
		VALUES
		(
			(LTRIM(RTRIM(@NodeName))),0,@Parent_ID,@CaseID,1
		)  
		SELECT 
			@@IDENTITY AS TagId  
	END  
end

GO
