USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_isSettled]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_isSettled](
@case_id varchar(50)
)
as
begin
declare 
@SettlementCount int,
@IsSettled int

SET @SettlementCount = (Select count(*) from tblSettlements where Case_Id = @Case_Id)

IF @SettlementCount > 0 

	BEGIN

		SET @IsSettled = 1
		select @IsSettled as IsSettled,settledwith from tblsettlements where case_id=@case_id
		

	END


ELSE


	BEGIN
			
		SET @IsSettled = 0
		select @IsSettled as IsSettled,'Not Settled' as settledwith
		

	END


end

GO
