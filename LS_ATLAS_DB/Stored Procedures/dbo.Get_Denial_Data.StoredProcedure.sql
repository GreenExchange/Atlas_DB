USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Get_Denial_Data]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_Denial_Data] 
	-- Add the parameters for the stored procedure here
	@Param VARCHAR(100),
	@FROMDate DateTime= '',
	@ToDate DateTime =''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets FROM
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF(@Param = 'Data')
	BEGIN
	SELECT 
		tre.Treatment_Id,
		BILL_NUMBER,
		tre.DenialDate AS DenialReasons_Date,
		dr.DenialReasons_Type AS DenialReason,  
		ISNULL(tre.notes,'') AS notes,
		tre.IMEDate AS IMEDate,
		ISNULL(tre.notes,'')  AS Description
		--I.Filename AS FileName,
		--B.PhysicalBasePath+I.FilePath+I.Filename  AS FileString
	FROM  dbo.tblTreatment tre (NOLOCK)
			INNER JOIN tblcase cas on tre.case_id = cas.Case_Id and GB_CASE_ID IS NOT NULL 
			INNER JOIN tblDenialReasons dr (NOLOCK) ON(dr.DenialReasons_Id=tre.DenialReason_ID)
	WHERE
		tre.Denial_Posted_Date BETWEEN @FROMDate AND @ToDate
		
	UNION
		SELECT 
			tre.Treatment_Id,
			tre.BILL_NUMBER,
			t_tre.DenialReasons_Date,
			dr.DenialReasons_Type AS DenialReason,  
			ISNULL(t_tre.notes,'') as notes,
			t_tre.IMEDate AS  IMEDate,
			ISNULL(t_tre.notes,'')  AS Description
		FROM  TXN_tblTreatment t_tre --on tre.Case_Id= cas.Case_Id
			INNER JOIN dbo.tblTreatment tre   WITH (NOLOCK) on tre.treatment_id = t_tre.Treatment_Id 
			INNER JOIN tblcase cas on tre.case_id = cas.Case_Id and GB_CASE_ID IS NOT NULL 
			INNER JOIN tblDenialReasons dr (NOLOCK) ON dr.DenialReasons_Id=t_tre.DenialReasons_Id
	    WHERE
		    t_tre.Denial_Posted_Date BETWEEN @FROMDate AND @ToDate
	END
	ELSE IF(@Param = 'Azure')
	BEGIN
	SELECT 
		tre.Treatment_Id,		
		I.Filename AS FileName,
		B.PhysicalBaseSubPath + '\' + I.FilePath  AS FileString
	FROM  dbo.tblTreatment tre (NOLOCK)
			INNER JOIN tblcase cas on tre.case_id = cas.Case_Id and GB_CASE_ID IS NOT NULL 
			INNER JOIN tblDenialReasons dr (NOLOCK) ON(dr.DenialReasons_Id=tre.DenialReason_ID)
			LEFT OUTER JOIN tblTags T (NOLOCK) ON T.CaseID= tre.Case_Id and T.NodeName = 'DENIALS'
			LEFT OUTER JOIN tblImageTag IT (NOLOCK) ON T.NodeID = IT.TagID 
			LEFT OUTER JOIN tbldocimages I (NOLOCK) ON I.ImageID = IT.ImageID --and tre.DomainId=I.DomainId
			LEFT OUTER JOIN tblBasePath B (NOLOCK) ON B.BasePathId = I.BasePathId 
	WHERE
		tre.Denial_Posted_Date BETWEEN @FROMDate AND @ToDate
		AND B.BasePathType = 2
	UNION
		SELECT 
			tre.Treatment_Id,			
			I.Filename AS FileName,
			B.PhysicalBaseSubPath + '\' + I.FilePath  AS FileString
		FROM  TXN_tblTreatment t_tre --on tre.Case_Id= cas.Case_Id
			INNER JOIN dbo.tblTreatment tre   WITH (NOLOCK) on tre.treatment_id = t_tre.Treatment_Id 
			INNER JOIN tblcase cas on tre.case_id = cas.Case_Id and GB_CASE_ID IS NOT NULL 
			INNER JOIN tblDenialReasons dr (NOLOCK) ON dr.DenialReasons_Id=t_tre.DenialReasons_Id
			LEFT OUTER JOIN tblTags T (NOLOCK) ON T.CaseID= tre.Case_Id and T.NodeName = 'DENIALS'
			LEFT OUTER JOIN tblImageTag IT (NOLOCK) ON T.NodeID = IT.TagID 
			LEFT OUTER JOIN tbldocimages I (NOLOCK) ON I.ImageID = IT.ImageID --and tre.DomainId=I.DomainId
			LEFT OUTER JOIN tblBasePath B (NOLOCK) ON B.BasePathId = I.BasePathId 
	    WHERE
		    t_tre.Denial_Posted_Date BETWEEN @FROMDate AND @ToDate
			AND  B.BasePathType = 2
	END

	ELSE IF(@Param = 'File')
	BEGIN
	SELECT 
		tre.Treatment_Id,		
		I.Filename AS FileName,
		B.PhysicalBasePath + '/' + I.FilePath  AS FileString,
		B.BasePathType AS BasePathType
	FROM  dbo.tblTreatment tre (NOLOCK)
			INNER JOIN tblcase cas on tre.case_id = cas.Case_Id and GB_CASE_ID IS NOT NULL 
			INNER JOIN tblDenialReasons dr (NOLOCK) ON(dr.DenialReasons_Id=tre.DenialReason_ID)
			LEFT OUTER JOIN tblTags T (NOLOCK) ON T.CaseID= tre.Case_Id and T.NodeName = 'DENIALS'
			LEFT OUTER JOIN tblImageTag IT (NOLOCK) ON T.NodeID = IT.TagID 
			LEFT OUTER JOIN tbldocimages I (NOLOCK) ON I.ImageID = IT.ImageID --and tre.DomainId=I.DomainId
			LEFT OUTER JOIN tblBasePath B (NOLOCK) ON B.BasePathId = I.BasePathId 
	WHERE
		tre.Denial_Posted_Date BETWEEN @FROMDate AND @ToDate
		--AND B.BasePathType != 2
	UNION
		SELECT 
			tre.Treatment_Id,			
			I.Filename AS FileName,
			B.VirtualBasePath + '/' + I.FilePath  AS FileString,
			B.BasePathType AS BasePathType
		FROM  TXN_tblTreatment t_tre --on tre.Case_Id= cas.Case_Id
			INNER JOIN dbo.tblTreatment tre   WITH (NOLOCK) on tre.treatment_id = t_tre.Treatment_Id 
			INNER JOIN tblcase cas on tre.case_id = cas.Case_Id and GB_CASE_ID IS NOT NULL 
			INNER JOIN tblDenialReasons dr (NOLOCK) ON dr.DenialReasons_Id=t_tre.DenialReasons_Id
			LEFT OUTER JOIN tblTags T (NOLOCK) ON T.CaseID= tre.Case_Id and T.NodeName = 'DENIALS'
			LEFT OUTER JOIN tblImageTag IT (NOLOCK) ON T.NodeID = IT.TagID 
			LEFT OUTER JOIN tbldocimages I (NOLOCK) ON I.ImageID = IT.ImageID --and tre.DomainId=I.DomainId
			LEFT OUTER JOIN tblBasePath B (NOLOCK) ON B.BasePathId = I.BasePathId 
	    WHERE
		    t_tre.Denial_Posted_Date BETWEEN @FROMDate AND @ToDate
			--AND  B.BasePathType != 2
	END
END
GO
