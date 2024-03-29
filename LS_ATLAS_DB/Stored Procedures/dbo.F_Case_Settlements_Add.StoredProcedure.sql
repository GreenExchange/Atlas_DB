USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[F_Case_Settlements_Add]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_Case_Settlements_Add]
  (

	  @m_a_settlement_amount 	MONEY,
	  @m_a_settlement_int		MONEY,
	  @m_a_settlement_af		MONEY,
	  @m_a_settlement_ff		MONEY,
	  @m_a_settlement_total 	MONEY,
	  @d_a_settlement_date	DATETIME,
	  @s_a_case_id 		NVARCHAR(100),
	  @s_a_user_id		NVARCHAR(50),
	  @s_a_settledwith		NVARCHAR(400),
	  @s_a_settlement_notes	NVARCHAR(2000),
	  @s_a_settled_type       NVARCHAR(100),
	  @s_a_settled_by       NVARCHAR(100),
	  @i_a_treatment_id		INT,
	  @i_a_adjuster_id 		INT,    
	  @s_a_adjuster_attorney VARCHAR(2)

  )
AS
  BEGIN
    declare @s_a_settled_with_name varchar(400)
    declare @s_a_settled_with_phone varchar(100)
    declare @s_a_settled_with_fax varchar(100)  
    
    IF @i_a_treatment_id = 0
    BEGIN
 	   select @i_a_treatment_id = treatment_id from tbltreatment where case_id=@s_a_case_id 
    END
    
    IF @s_a_adjuster_attorney = 'AD'  
	BEGIN  
        set @s_a_settled_with_name=(select Adjuster_FirstName + ' ' + Adjuster_LastName from tblAdjusters where Adjuster_Id= + cast(@i_a_adjuster_id as int))   
		set @s_a_settled_with_phone =(select Adjuster_Phone from tblAdjusters where Adjuster_Id= + cast(@i_a_adjuster_id as int))   
		set @s_a_settled_with_fax =(select Adjuster_Fax from tblAdjusters where Adjuster_Id= + cast(@i_a_adjuster_id as int))   
	END  
	ELSE IF @s_a_adjuster_attorney = 'AT'  
	BEGIN  
        set @s_a_settled_with_name=(select Attorney_FirstName +' '+ Attorney_LastName from tblAttorney where Attorney_AutoId= + @i_a_adjuster_id)   
        set @s_a_settled_with_phone =(select Attorney_Phone from tblAttorney where Attorney_AutoId= + @i_a_adjuster_id)   
        set @s_a_settled_with_fax =(select Attorney_Fax from tblAttorney where Attorney_AutoId= + @i_a_adjuster_id)   
    END 
    ELSE IF @s_a_adjuster_attorney = 'DF'  
    BEGIN  
        set @s_a_settled_with_name=(select Defendant_Name  from tblDefendant where Defendant_id = + @i_a_adjuster_id)   
        set @s_a_settled_with_phone =(select Defendant_Phone from tblDefendant where Defendant_id= + @i_a_adjuster_id)   
        set @s_a_settled_with_fax =(select Defendant_Fax from tblDefendant where Defendant_id= + @i_a_adjuster_id)   
    END
    
    
   	       INSERT INTO tblSettlements
             (
				       Settlement_Amount,
				       Settlement_Int,
				       Settlement_Af,
				       Settlement_Ff,
				       Settlement_Total,
				       Settlement_Date,
				       Case_Id,
				       User_Id,
				       Settlement_Notes,
				       Settled_Type,
				       Settled_by,
				       SettledWith,
				       Treatment_Id,
				       Settled_With_Name,  
				       Settled_With_Phone,  
				       Settled_With_Fax
		       )
			VALUES
			(
				@m_a_settlement_amount,
				@m_a_settlement_int,
				@m_a_settlement_af,
				@m_a_settlement_ff,
				@m_a_settlement_total,
				Convert(nvarchar(15), @d_a_settlement_date, 101),
				@s_a_case_id ,		
				@s_a_user_id,		
				@s_a_settlement_notes,	
				@s_a_settled_type ,      
				@s_a_settled_by , 
				@s_a_settledwith,	     
				@i_a_treatment_id,		
				@s_a_settled_with_name,  
				@s_a_settled_with_phone,  
				@s_a_settled_with_fax
		)
		
		DECLARE @s_l_OldStatus NVARCHAR(200)
		DECLARE @s_l_NotesDesc NVARCHAR(1000)
		
		IF @s_a_settled_type = '7'
		BEGIN
		
			SET @s_l_OldStatus = (Select top 1 status from tblcase where Case_Id = @s_a_case_id)
			SET @s_l_NotesDesc = 'Status changed from '+ @s_l_OldStatus +' to Withdrawn With Prejudice' 
			UPDATE tblCase set Status='Withdrawn With Prejudice' where Case_Id = @s_a_case_id
			
			exec F_Add_Activity_Notes @s_a_Case_Id=@s_a_Case_Id,@s_a_Notes_Type='Activity',@s_a_NDesc= @s_l_NotesDesc,@s_a_user_Id=@s_a_user_id,@i_a_ApplyToGroup = 0
		END
		ELSE
		IF @s_a_settled_type = '8'
		BEGIN
			SET @s_l_OldStatus = (Select top 1 status from tblcase where Case_Id = @s_a_case_id)
			SET @s_l_NotesDesc = 'Status changed from '+ @s_l_OldStatus +' to Withdrawn Without Prejudice' 
			
			UPDATE tblCase set Status='Withdrawn Without Prejudice' where Case_Id = @s_a_case_id
			exec F_Add_Activity_Notes @s_a_Case_Id=@s_a_Case_Id,@s_a_Notes_Type='Activity',@s_a_NDesc= @s_l_NotesDesc,@s_a_user_Id=@s_a_user_id,@i_a_ApplyToGroup = 0
			
		END
		ELSE
		BEGIN
			SET @s_l_OldStatus = (Select top 1 status from tblcase where Case_Id = @s_a_case_id)
			SET @s_l_NotesDesc = 'Status changed from '+ @s_l_OldStatus +' to SETTLED' 
			
			UPDATE tblCase set Status='SETTLED' where Case_Id = @s_a_case_id
			exec F_Add_Activity_Notes @s_a_Case_Id=@s_a_Case_Id,@s_a_Notes_Type='Activity',@s_a_NDesc= @s_l_NotesDesc,@s_a_user_Id=@s_a_user_id,@i_a_ApplyToGroup = 0
		END
		
		
     IF @s_a_adjuster_attorney = 'AD'  
     BEGIN  
	    Update tblCase SET Adjuster_Id = + cast(@i_a_adjuster_id as int) WHERE Case_Id = + @s_a_case_id    
	 END  
	 
	 IF @s_a_adjuster_attorney = 'AT'  
	 BEGIN  
	    Update tblCase SET Attorney_Id = + @i_a_adjuster_id WHERE Case_Id = + @s_a_case_id    
	 END 
	 
	 IF @s_a_adjuster_attorney = 'DF'  
	 BEGIN  
	   Update tblCase SET Defendant_Id = + @i_a_adjuster_id WHERE Case_Id = + @s_a_case_id    
	 END
	 
	 
	DECLARE @s_l_message VARCHAR(MAX)  
	DECLARE @desc varchar(2000)
	 
	SET @desc = 'Case Settled with/by ' + @s_a_settledwith +' '+ (select Convert(Varchar(10),GETDATE(),101))
	exec F_Add_Activity_Notes @s_a_case_id=@s_a_Case_Id,@s_a_notes_type='Activity',@s_a_ndesc = @desc,@s_a_user_Id=@s_a_user_id,@i_a_applytogroup = 0
			
	SET @s_l_message = 'Case Settled successfully'  
	SELECT @s_l_message AS [MESSAGE], @s_a_case_id AS [RESULT]
	
	 
END

GO
