USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[INSERT_POM_CASE]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[INSERT_POM_CASE]
	@DomainId NVARCHAR(50),
	@pom_id AS NVARCHAR(50),
	@case_id AS NVARCHAR(50),
	@User_Id as varchar(50),
	@FileName as varchar(500),
	@BasePathID INT,
	@POMType VARCHAR(50)
AS
BEGIN

		DECLARE @s_l_Status VARCHAR(500) 
		
		SET @s_l_Status = (SELECT top 1 status From tblCASE (NOLOCK) WHERE Case_ID = @case_id AND DomainId = @DomainId)
		
		--IF(@s_l_Status <> 'WC BILLS')
		--BEGIN
		--	DELETE FROM TBLPOMCASE WHERE CASE_ID=@case_id and DomainId =@DomainId 
		--END


		DECLARE @dt_Date_Bill_Sent  DATETIME 
		SET @dt_Date_Bill_Sent = (select MAX(POM_Date_Bill_Send) from tblPOM (NOLOCK) WHERE POM_ID_New = @pom_id and DomainId = @DomainId)
		
		INSERT INTO TBLPOMCASE
		(
			DomainId,
			pom_id,
			case_id,
			POM_FileName,
			BasePathID,
			POMType
		)
		VALUES
		(
			@DomainId,
			@pom_id,
			@case_id,
			@FileName,
			@BasePathID,
			@POMType
		)
		
		DECLARE @s_l_Status_New VARCHAR(100)
		DECLARE @DESC AS VARCHAR(500) = ''

		IF @DomainId = 'GLF'AND @POMType = 'POM'
		BEGIN
			set @DESC = 'Status changed to ACTIVE BILLING POM GENERATED'
			SET @s_l_Status_New = 'ACTIVE BILLING POM GENERATED' 
		END
		ELSE IF @POMType = 'POM'
		BEGIN
			set @DESC = 'Status changed to BILLING POM GENERATED' 
			SET @s_l_Status_New = 'BILLING POM GENERATED'
		END
		ELSE IF @POMType = 'Verification POM' 
		BEGIN
		     set @DESC = 'Status changed to BILLING VR POM GENERATED'
			 SET @s_l_Status_New = 'BILLING VR POM GENERATED'
		END
		
		UPDATE TBLCASE SET STATUS=@s_l_Status_New WHERE CASE_ID=@case_id and Status <> 'WC BILLS' and DomainId =@DomainId
		
		IF((SELECT count(case_id) FROM TBLPOMCASE (NOLOCK) WHERE CASE_ID=@case_id and DomainId =@DomainId) > 1 AND @s_l_Status = 'WC BILLS')
			UPDATE TBLCASE SET STATUS=@s_l_Status_New WHERE CASE_ID=@case_id and DomainId =@DomainId

		 IF @POMType = 'POM'
		 BEGIN
			UPDATE tblTreatment SET Date_BillSent =@dt_Date_Bill_Sent  WHERE CASE_ID=@case_id
		 END
		
		

		
		IF(@DESC <> '')
			exec LCJ_AddNotes @DomainId= @DomainId, @case_id=@case_id,@Notes_Type='Activity',@Ndesc = @DESC,@user_Id=@User_Id,@ApplyToGroup = 0        

END
GO
