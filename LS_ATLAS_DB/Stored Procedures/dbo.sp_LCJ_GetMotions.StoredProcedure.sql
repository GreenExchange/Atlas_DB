USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[sp_LCJ_GetMotions]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_LCJ_GetMotions] 
(
@case_id varchar(50)
)
as
begin
select 
Case_Id,
Motion_ID,
Convert(NVARCHAR(15), Motion_Date, 101) as [Motion_date],
Motion_Status,
Our_Motion_Type,
Defendent_Motion_Type,
Convert(NVARCHAR(15), Opposition_Due_Date, 101) as [Opposition_Due_Date],
Convert(NVARCHAR(15), Reply_Due_Date, 101) as [Reply_Due_Date],
Notes,
cross_motion,
whose_motion,
room,
part,
judge_name,
time_duration
from
tblmotions where case_id=@case_id
end

GO
