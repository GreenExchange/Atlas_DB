USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[REASSIGN_CASE_AUTOMATICALLY_ONSTATUS_CHANGED]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[REASSIGN_CASE_AUTOMATICALLY_ONSTATUS_CHANGED] --[REASSIGN_CASE_AUTOMATICALLY_ONSTATUS_CHANGED]'FH12-107876','jwatkins'
 @DomainId NVARCHAR(50),
 @CASE_ID VARCHAR(50), 
 @LOGIN_USERNAME VARCHAR(50)
AS
BEGIN
 DECLARE @CURRENT_ASSIGNTOUSERID AS INT
 DECLARE @CURRENT_ASSIGNBYUSERID AS INT
 DECLARE @LOGIN_USERID AS INT
 DECLARE @HISTORY_ID AS INT
 
 SET @LOGIN_USERID = (SELECT UserId FROM ISSUETRACKER_USERS WHERE USERNAME=@LOGIN_USERNAME and DomainId=@DomainId)
       
 SET @CURRENT_ASSIGNTOUSERID = (SELECT Top 1 To_User_Id FROM TBLCASEDESKHISTORY WHERE CASE_ID=@CASE_ID and DomainId=@DomainId  order by History_Id desc)
 
 --SET @CURRENT_ASSIGNBYUSERID = (SELECT Top 1 Login_User_Id FROM TBLCASEDESKHISTORY WHERE CASE_ID=@CASE_ID AND To_User_Id = @LOGIN_USERID order by History_Id desc)
 SET @CURRENT_ASSIGNBYUSERID = (SELECT Top 1 CASE WHEN isnull(From_User_Id,'')<> '' THEN From_User_Id ELSE Login_User_Id END FROM TBLCASEDESKHISTORY WHERE CASE_ID=@CASE_ID and DomainId=@DomainId order by History_Id desc)
 
 
 --SET @HISTORY_ID = (SELECT TOP 1 HISTORY_ID FROM TBLCASEDESKHISTORY WHERE CASE_ID=@CASE_ID AND To_User_Id = @CURRENT_ASSIGNTOUSERID order by History_Id desc)
 IF @CURRENT_ASSIGNBYUSERID <> NULL and  @LOGIN_USERID <>  NULL
  print ('hi')
 
 BEGIN
 
  DELETE FROM TBLCASEDESKHISTORY WHERE CASE_ID=@CASE_ID and DomainId=@DomainId--AND To_User_Id = @LOGIN_USERID
  INSERT INTO 
   TBLCASEDESKHISTORY
   (
    Case_Id,
    Login_User_Id,
    From_User_Id,
    To_User_Id,
    Date_Changed,
    Change_Reason,
    bt_status,
    DomainId
   )
  VALUES
   (
    @CASE_ID,
    @LOGIN_USERID,
    @CURRENT_ASSIGNTOUSERID,
    @CURRENT_ASSIGNBYUSERID,
    GETDATE(),
    'PENDING - RE-ASSIGNED',
    1,
    @DomainId
   )

  declare @desc nvarchar(500)
  declare @REASSIGN_USERNAME as nvarchar(50)

  set @REASSIGN_USERNAME = (select username from issuetracker_users where userid=@CURRENT_ASSIGNBYUSERID and DomainId=@DomainId)
  set @desc = 'Case re-assigned to ' + @REASSIGN_USERNAME       
  exec LCJ_AddNotes @DomainId=@DomainId,@case_id=@Case_Id,@Notes_Type='Activity',@Ndesc = @desc,@user_Id=@LOGIN_USERNAME,@ApplyToGroup = 0
 END 
END
GO
