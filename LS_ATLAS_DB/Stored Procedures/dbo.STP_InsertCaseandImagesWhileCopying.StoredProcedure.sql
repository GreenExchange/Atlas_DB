USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[STP_InsertCaseandImagesWhileCopying]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[STP_InsertCaseandImagesWhileCopying]  
(
	@DomainId NVARCHAR(50),
	@NODETYPE CHAR,  
	@PARENTID INT,  
	@FILEPATH NVARCHAR(255),  
	@IMAGEID INT,  
	@TAGID INT,  
	@LOGINID NVARCHAR(255),  
	@CASEID NVARCHAR(255),  
	@BasePathId INT,
	@NODEID INT OUTPUT    
)
AS    
	DECLARE @NODELEVEL INT  
	DECLARE @NEWIMAGEID INT  
  
	IF @NODETYPE='D'  
	BEGIN   
		 SELECT @NODELEVEL=NODELEVEL+1 FROM TBLTAGS WHERE NODEID=@PARENTID and DomainId=@DomainId
		 INSERT INTO 
			TBLTAGS 
		(
			PARENTID, NODENAME,  CASEID, DOCTYPEID, NODEICON, NODELEVEL, EXPANDED, DomainId
		)  
		SELECT 
			@PARENTID, NODENAME, @CASEID, DOCTYPEID, NODEICON, @NODELEVEL, EXPANDED, @DomainId
		FROM 
			TBLTAGS 
		WHERE 
			NODEID=@TAGID    
		SET @NODEID=@@IDENTITY  
	END  
	ELSE  
	BEGIN  
	  
		INSERT INTO TBLDOCIMAGES 
		(
			FILENAME, FILEPATH, OCRDATA, STATUS, BasePathId, DomainId
		)  
		SELECT 
			FILENAME, @FILEPATH, OCRDATA, STATUS, @BasePathId, @DomainId
		FROM 
			TBLDOCIMAGES 
		WHERE 
			IMAGEID=@IMAGEID-- IN (SELECT IMAGEID FROM TBLIMAGETAG WHERE TAGID=@TAGID)  

		SET @NEWIMAGEID=@@IDENTITY  

		INSERT INTO TBLIMAGETAG 
		(
			IMAGEID, TAGID, LOGINID, DateInserted, DomainId
		)   
		VALUES 
		(
			@NEWIMAGEID,@PARENTID,@LOGINID, GetDate(), @DomainId
		)
	END

GO
