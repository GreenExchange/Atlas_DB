USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[POM_Packet_Documents_Retrieve]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[POM_Packet_Documents_Retrieve]  -- POM_Packet_Documents_Retrieve 'glf','ACT18-101856,ACT18-101876,ACT18-101878,ACT18-101371,ACT18-101370'
(
	@DomainId VARCHAR(50),
	@s_a_case_id	NVARCHAR(MAX) = ''
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
		DECLARE @Documents_Order AS Table 
		(
			OrerID int,
			Document_Type varchar(100)
		)

		INSERT INTO @Documents_Order
		VALUES (1 , 'Initial Submisson Letter'),
			   (2, 'BILLS'),
			   (3, 'A.O.B'),
			   (4, 'MEDICAL REPORTS')
	
		SELECT CaseID
			, NodeName
			, Filename
			, S.ParameterValue + FilePath as FilePath 
		FROM dbo.TBLDOCIMAGES I 
			INNER JOIN dbo.tblImageTag IT on IT.ImageID=i.ImageID 
			INNER JOIN dbo.tblTags T on T.NodeID = IT.TagID 
			LEFT OUTER JOIN tblApplicationSettings s ON T.DomainId = S.DomainId and ParameterName= 'DocumentUploadLocationPhysical'
			LEFT OUTER JOIN @Documents_Order ord ON T.NodeName = ord.Document_Type
		WHERE T.DomainId = @DomainId and CaseID IN(select  s from dbo.splitstring(@s_a_case_id,',')) 
		--and nodename in ('BILLS','MEDICAL REPORTS','A.O.B','Initial Submisson Letter') -- 
		and (nodename in ('BILLS','MEDICAL REPORTS','A.O.B') OR Filename = 'Initial Submisson Letter.pdf')
		--and Filename not like 'Initial Submisson Letter_0%'
		--and Filename not like 'Initial submission letter_0%'
							   
		ORDER BY CaseID, ord.OrerID
END
--select * from tblApplicationSettings
GO
