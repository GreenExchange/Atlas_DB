USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_Color_cases]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GET_Color_cases] --SP_GET_Color_cases 'FH07-42372'
@SZ_CASE_ID NVARCHAR(100)
AS
BEGIN
select CASE WHEN provider_groupname='GBB' and abs(datediff(dd,Accident_Date,DateOfService_Start))<30
    		THEN '<font color=red>'+Case_Id+'</font> ' 
			WHEN provider_groupname='GBB' and abs(datediff(dd,Accident_Date,DateOfService_Start))>45
			THEN '<font color=red>'+Case_Id+'</font> '
			WHEN provider_groupname='GBB' and abs(datediff(dd,Accident_Date,DateOfService_Start)) between 30 and 45
			THEN '<font color=green>'+Case_Id+'</font> '
            else case_id END as Case_Id
            from tblcase inner join tblProvider on tblcase.Provider_Id =tblProvider.Provider_Id
            and tblcase.Case_Id =@SZ_CASE_ID
END
GO
