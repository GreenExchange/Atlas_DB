USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Delete_ExistingAttorney]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Delete_ExistingAttorney] 
(
@CaseId nvarchar(50),
@DomainId nvarchar(50)

)
as
BEGIN

	begin
		if exists(select CaseId from [dbo].[CaseAttorneyMapping] where  DomainId=@DomainId and CaseId=@CaseId)
			--if @flag = 1	
			begin
				
				delete from [dbo].[CaseAttorneyMapping] where  DomainId = @DomainId and CaseId=@CaseId
			end				
	end
	
END
GO
