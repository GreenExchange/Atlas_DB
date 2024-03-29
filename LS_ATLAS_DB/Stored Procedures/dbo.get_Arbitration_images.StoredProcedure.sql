USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[get_Arbitration_images]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[get_Arbitration_images]--[get_Arbitration_images] 'Fh07-42372' 
(  
   @CaseId NVARCHAR(50)
)  
as  
BEGIN 
DECLARE @provider_id int	
SET @provider_id =(SELect p.Provider_Id from [dbo].TblProvider p inner join [dbo].tblcase c on c.Provider_Id =p.Provider_Id Where Case_Id =@caseid)
	
CREATE TABLE #TEMP(Image_Id int, Filename NVARCHAR(500))

	---------VERIFICATION OF TREATMENT(BILLS--------------
IF EXISTS(select * from TBLDOCIMAGES I Join tblImageTag IT on IT.ImageID=i.ImageID Join tblTags T on T.NodeID = IT.TagID and T.CaseID= @CaseId and NodeName in ('BILLS') and Filename like '%.pdf%')
BEGIN
INSERT INTO #TEMP 
		select 0,'exhibits\Arb\VERIFICATION OF TREATMENT.pdf'       
UNION
		SELECT 
		   I.ImageID ,(FilePath+Filename)AS Filename  
		from 
		  TBLDOCIMAGES I
		  Join tblImageTag IT on IT.ImageID=i.ImageID
		  Join tblTags T on T.NodeID = IT.TagID and T.CaseID= @CaseId and NodeName in ('BILLS') and Filename like '%.pdf%' 
END

	---------ASSIGNMENT OF BENEFITS(A.O.B)---------------
IF EXISTS(select * from TBLDOCIMAGES I Join tblImageTag IT on IT.ImageID=i.ImageID Join tblTags T on T.NodeID = IT.TagID and T.CaseID= @CaseId and NodeName in ('A.O.B') and Filename like '%.pdf%')
BEGIN
INSERT INTO #TEMP 
		select 0,'exhibits\Arb\ASSIGNMENT OF BENEFITS.pdf'       
UNION
		SELECT 
		   I.ImageID ,(FilePath+Filename)AS Filename  
		from 
		  TBLDOCIMAGES I
		  Join tblImageTag IT on IT.ImageID=i.ImageID
		  Join tblTags T on T.NodeID = IT.TagID and T.CaseID= @CaseId and NodeName in ('A.O.B') and Filename like '%.pdf%'
END

		---------DENIAL OF CLAIM(DENIALS)---------------
IF EXISTS(select * from TBLDOCIMAGES I Join tblImageTag IT on IT.ImageID=i.ImageID Join tblTags T on T.NodeID = IT.TagID and T.CaseID= @CaseId and NodeName in ('DENIALS') and Filename like '%.pdf%')
BEGIN
INSERT INTO #TEMP 
		select 0,'exhibits\Arb\DENIAL OF CLAIM.pdf'       
UNION
		SELECT 
		   I.ImageID ,(FilePath+Filename)AS Filename  
		from 
		  TBLDOCIMAGES I
		  Join tblImageTag IT on IT.ImageID=i.ImageID
		  Join tblTags T on T.NodeID = IT.TagID and T.CaseID= @CaseId and NodeName in ('DENIALS') and Filename like '%.pdf%'
END

		---------VERIFICATION REQUESTS(VERIFICATION REQUEST)---------------
IF NOT EXISTS(select * from TBLDOCIMAGES I Join tblImageTag IT on IT.ImageID=i.ImageID Join tblTags T on T.NodeID = IT.TagID and T.CaseID= @CaseId and NodeName in ('DENIALS') and Filename like '%.pdf%')
BEGIN
IF EXISTS(select * from TBLDOCIMAGES I Join tblImageTag IT on IT.ImageID=i.ImageID Join tblTags T on T.NodeID = IT.TagID and T.CaseID= @CaseId and NodeName in ('VERIFICATION REQUEST') and Filename like '%.pdf%')
BEGIN
INSERT INTO #TEMP 
		select 0,'exhibits\Arb\VERIFICATION REQUESTS.pdf'      
UNION
		SELECT 
		   I.ImageID ,(FilePath+Filename)AS Filename  
		from 
		  TBLDOCIMAGES I
		  Join tblImageTag IT on IT.ImageID=i.ImageID
		  Join tblTags T on T.NodeID = IT.TagID and T.CaseID= @CaseId and NodeName in ('VERIFICATION REQUEST') and Filename like '%.pdf%'
END
ELSE
BEGIN
IF EXISTS(select * from TBLDOCIMAGES I Join tblImageTag IT on IT.ImageID=i.ImageID Join tblTags T on T.NodeID = IT.TagID and T.CaseID= @CaseId and NodeName in ('Additional Verification Requests') and Filename like '%.pdf%')
BEGIN
INSERT INTO #TEMP 
		select 0,'exhibits\Arb\VERIFICATION REQUESTS.pdf'      
UNION
		SELECT 
		   I.ImageID ,(FilePath+Filename)AS Filename  
		from 
		  TBLDOCIMAGES I
		  Join tblImageTag IT on IT.ImageID=i.ImageID
		  Join tblTags T on T.NodeID = IT.TagID and T.CaseID= @CaseId and NodeName in ('Additional Verification Requests') and Filename like '%.pdf%'
END
END
END

		---------MEDICAL REPORTS(MEDICAL REPORTS)---------------
IF EXISTS(select * from TBLDOCIMAGES I Join tblImageTag IT on IT.ImageID=i.ImageID Join tblTags T on T.NodeID = IT.TagID and T.CaseID= @CaseId and NodeName in ('MEDICAL REPORTS') and Filename like '%.pdf%')
BEGIN
INSERT INTO #TEMP 
		select 0,'exhibits\Arb\MEDICAL REPORTS.pdf'    
UNION
		SELECT 
		   I.ImageID ,(FilePath+Filename)AS Filename  
		from 
		  TBLDOCIMAGES I
		  Join tblImageTag IT on IT.ImageID=i.ImageID
		  Join tblTags T on T.NodeID = IT.TagID and T.CaseID= @CaseId and NodeName in ('MEDICAL REPORTS') and Filename like '%.pdf%'
END

		---------You did not need PROOF of mailing if denial exist---------------
IF Not EXISTS(select * from TBLDOCIMAGES I Join tblImageTag IT on IT.ImageID=i.ImageID Join tblTags T on T.NodeID = IT.TagID and T.CaseID= @CaseId and NodeName in ('DENIALS') and Filename like '%.pdf%')
BEGIN
IF EXISTS(select * from TBLDOCIMAGES I Join tblImageTag IT on IT.ImageID=i.ImageID Join tblTags T on T.NodeID = IT.TagID and T.CaseID= @CaseId and NodeName in ('PROOF OF MAILING') and Filename like '%.pdf%')
BEGIN
INSERT INTO #TEMP 
		select 0,'exhibits\Arb\PROOF OF MAILING.pdf'
UNION
		SELECT 
		   I.ImageID ,(FilePath+Filename)AS Filename  
		from 
		  TBLDOCIMAGES I
		  Join tblImageTag IT on IT.ImageID=i.ImageID
		  Join tblTags T on T.NodeID = IT.TagID and T.CaseID= @CaseId and NodeName in ('PROOF OF MAILING') and Filename like '%.pdf%'
END
END

---------Supporting Doc---------------
	IF (@provider_id ='40425')
	BEGIN
		insert into #temp  
		select 0,'exhibits\Arb\Supporting Doc.pdf'
	END	
	ELSE
	BEGIN	
		IF EXISTS(select * from TBLDOCIMAGES I Join tblImageTag IT on IT.ImageID=i.ImageID Join tblTags T on T.NodeID = IT.TagID and T.CaseID= @CaseId and NodeName in ('EUO TRANSCRIPTS') and Filename like '%.pdf%')
		BEGIN
				INSERT INTO #TEMP 
						select 0,'exhibits\Arb\SUPPORTING DOCUMENTS.pdf'
				UNION
				SELECT 
				   I.ImageID ,(FilePath+Filename)AS Filename  
				from 
				  TBLDOCIMAGES I
				  Join tblImageTag IT on IT.ImageID=i.ImageID
				  Join tblTags T on T.NodeID = IT.TagID and T.CaseID= @CaseId and NodeName in ('EUO TRANSCRIPTS') and Filename like '%.pdf%'
		END
		
	END
	
select * from #TEMP
DROP TABLE #TEMP
END

GO
