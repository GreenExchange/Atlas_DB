USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_UpdateDenialReasons]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_UpdateDenialReasons]
(
@DomainId NVARCHAR(50),
--Adjuster_Id	nvarchar	no	100
@DenialReasons_id int=null,

@Denial_Colorcode	nvarchar(50)=null

--@OperationResult INTEGER OUT
)
AS
BEGIN
	
	BEGIN


		-- Insert the records
		BEGIN TRAN
			
		update  tblDenialReasons 
		set 
	
		Denial_Colorcode=@Denial_Colorcode	,
		DomainId=@DomainId
		where DenialReasons_id=@DenialReasons_id		

		COMMIT TRAN

	END -- END of ELSE	

END

GO
