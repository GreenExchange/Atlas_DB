USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DeleteProvider]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[LCJ_DeleteProvider]
(
 
@Provider_Id int,
@OperationResult INT OUTPUT

)


AS

		IF EXISTS(Select Provider_Id  
		
			FROM  tblcase 
			WHERE 
			Provider_Id = @Provider_Id
		 
		
			  
		)

			BEGIN
				SET @OperationResult = 1
				Return 1
				
			END
	
		ELSE
			BEGIN
				DELETE from tblProvider  where Provider_Id = @Provider_Id  
				SET @OperationResult = 0
				Return 0
			END


GO
