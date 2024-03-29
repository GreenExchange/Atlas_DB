USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[F_Get_ARBAWARD]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[F_Get_ARBAWARD]   --[dbo].[F_Get_ARBFILED] '06/04/2016','06/14/2016','0',0
(
	@dt_From DATETIME,
	@dt_To DATETIME,
	@pro_id INT,
	@pro_grp VARCHAR(200)
)
AS  
	BEGIN
	
		IF (@pro_id != '0')
		BEGIN
			SELECT LCJ.Case_Id,lcj.Provider_Name,tblDocImages.FilePath,tblDocImages.Filename,Convert(varchar,tblImageTag.DateInserted,101) as DateInserted FROM tblDocImages 
			LEFT OUTER JOIN tblImageTag 
			ON tblDocImages.imageid=tblImageTag.imageid
			LEFT OUTER JOIN tblTags 
			ON tblTags.NodeID = tblImageTag.TagID
			INNER JOIN dbo.LCJ_VW_CaseSearchDetails lcj ON lcj.Case_Id=tblTags.CaseID
			WHERE NodeName in ('Arbitration Awards','MASTER ARBITRATION AWARD') AND lcj.Provider_Id=@pro_id AND DateInserted BETWEEN @dt_From AND @dt_To
 
		END  
		ELSE
		IF (@pro_grp != '0')
		BEGIN
			SELECT LCJ.Case_Id,lcj.Provider_Name,lcj.Provider_GroupName, tblDocImages.FilePath,tblDocImages.Filename, Convert(varchar,tblImageTag.DateInserted,101) as DateInserted FROM tblDocImages 
			LEFT OUTER JOIN tblImageTag 
			ON tblDocImages.imageid=tblImageTag.imageid
			LEFT OUTER JOIN tblTags 
			ON tblTags.NodeID = tblImageTag.TagID
			INNER JOIN dbo.LCJ_VW_CaseSearchDetails lcj ON lcj.Case_Id=tblTags.CaseID
			INNER JOIN dbo.TblProvider_Groups pro_grp ON pro_grp.Provider_Group_Name=lcj.Provider_GroupName
			WHERE NodeName in ('Arbitration Awards','MASTER ARBITRATION AWARD')  AND lcj.Provider_GroupName=@pro_grp AND DateInserted BETWEEN @dt_From AND @dt_To
		END
		IF (@pro_id = '0' and @pro_grp = '0')
		BEGIN
			SELECT LCJ.Case_Id,lcj.Provider_Name,tblDocImages.FilePath,tblDocImages.Filename,Convert(varchar,tblImageTag.DateInserted,101) as DateInserted FROM tblDocImages 
			LEFT OUTER JOIN tblImageTag 
			ON tblDocImages.imageid=tblImageTag.imageid
			LEFT OUTER JOIN tblTags 
			ON tblTags.NodeID = tblImageTag.TagID
			INNER JOIN dbo.LCJ_VW_CaseSearchDetails lcj ON lcj.Case_Id=tblTags.CaseID
			WHERE NodeName in ('Arbitration Awards','MASTER ARBITRATION AWARD') AND DateInserted BETWEEN @dt_From AND @dt_To
 
		END  
	END
	SET NOCOUNT OFF;

GO
