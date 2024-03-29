USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[CPTCode_Retrive]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CPTCode_Retrive]  
(  
 @s_a_Treatment_id  INT,  
 @s_a_Case_id   NVARCHAR(20),  
 @s_a_DomainID  NVARCHAR(50)  
)  
AS          
BEGIN    
	  SELECT   
			CPT_ATUO_ID,
			Treatment_Id,  
			t.Case_Id,  
			BILL_NUMBER,  
			Code,  
			Description,  
			convert(varchar,DOS,101)[DOS],  
			Specialty,  
			Convert(Decimal(38,2),BillAmount) AS BillAmount,  
			Convert(Decimal(38,2),Amount) AS Amount,  
			Convert(Decimal(38,2), ISNULL(ins_fee_schedule,Amount)) AS ins_fee_schedule,
			CollectedAmount,
			b.MOD,
			b.UNITS,
			b.ICD10_1,
			b.ICD10_2,
			b.ICD10_3,
			convert(varchar,t.refund_date,101)[refund_date]   
	  FROM  
			tblTreatment  t (NOLOCK) 
			inner join BILLS_WITH_PROCEDURE_CODES b (NOLOCK) on 
			 ((ISNULL(b.BillNumber,'') = ISNULL(t.BILL_NUMBER,'') AND ISNULL(t.BILL_NUMBER,'') <> '')
			 OR Treatment_id = ISNULL(fk_Treatment_Id,0))
			 AND b.DomainID = @s_a_DomainID
	  WHERE
			 t.DomainID = @s_a_DomainID  
			 AND Treatment_Id = @s_a_Treatment_id   
			 AND t.Case_Id = @s_a_Case_id  
	  ORDER BY   
			DOS ,Code    
END  
  
  
GO
