USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[XN_TRANFER_DOCS_FROM_OLD_TO_NEW_SERVER]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[XN_TRANFER_DOCS_FROM_OLD_TO_NEW_SERVER]--  [XN_TRANFER_DOCS_FROM_OLD_TO_NEW_SERVER] 'ACT-AF-174156','AF'
	(
		@s_a_case_id varchar(20),--= 'FH07-42372',--'RFA14-166802'
		@s_a_DomainID VARCHAR(50)--='glf'
	)-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   
	SELECT REPLACE(PhysicalBasePath +FilePath + Filename,'/','\')  AS ImagePath,
		CaseID+'\' + NodeName +'\'+ Filename AS ImagePathNew
	from dbo.TBLDOCIMAGES I 
	inner Join dbo.tblImageTag IT on IT.ImageID=i.ImageID 
	inner Join dbo.tblTags T on T.NodeID = IT.TagID 
	LEFT OUTER JOIN dbo.tblBasePath b ON I.BasePathID = b.BasePathID
	WHERE T.CaseID IN (SELECT LTRIM(RTRIM(items)) FROM dbo.STRING_SPLIT(@s_a_case_id,','))
	and T.DomainId  = @s_a_DomainID
	--and nodename in ('DENIALS')
	and FileName is not null and FilePath is not null
	

END
GO
