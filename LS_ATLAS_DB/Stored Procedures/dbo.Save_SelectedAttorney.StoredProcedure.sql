USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Save_SelectedAttorney]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Save_SelectedAttorney] 
(
@CaseId nvarchar(50),
@AttorneyId int,
@DomainId nvarchar(50)

)
as
BEGIN

	begin
		if exists(select CaseId from [dbo].[CaseAttorneyMapping] where AttorneyId=@AttorneyId and DomainId=@DomainId and CaseId=@CaseId)
			--if @flag = 1	
			begin
				
				delete from [dbo].[CaseAttorneyMapping] where  DomainId = 'xxx'
			end		
		else
			begin				
				insert into [dbo].[CaseAttorneyMapping] values (@CaseId,@AttorneyId,@DomainId)
			end
	end
	
END
GO
