USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_FREEZETRANSACTIONS_Group]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LCJ_FREEZETRANSACTIONS_Group](        
@Provider_GroupName varchar(250)        
)        
as        
BEGIN        
DECLARE        
@IID INT ,
@BILL_FF INT,
@RETURN_FF INT       
SET @IID = 0        
SELECT @IID = MAX(ACCOUNT_ID) FROM tblClientAccountGroup WHERE Provider_GroupName=@Provider_GroupName  AND DATEDIFF(D,ACCOUNT_DATE,GETDATE())=0        
IF @IID > 0    And @Provider_GroupName <> ''
BEGIN

	BEGIN	  
		--UPDATE tblcase set status='PAYMENT DISBURSED' where case_id in (SELECT distinct case_id from TBLTRANSACTIONS where Provider_id in (select distinct Provider_Id from tblProvider where Provider_GroupName =@Provider_GroupName) AND TRANSACTIONS_STATUS IS NULL AND TRANSACTIONS_TYPE IN ('C','I')  )      
		UPDATE TBLTRANSACTIONS SET TRANSACTIONS_STATUS='FREEZED',INVOICE_ID=@IID,invoice_by= 'Group' WHERE Provider_id in (select distinct Provider_Id from tblProvider where Provider_GroupName =@Provider_GroupName) AND (TRANSACTIONS_STATUS IS NULL or TRANSACTIONS_STATUS = 'CONFIRMED') AND TRANSACTIONS_TYPE IN ('C','I') AND (Provider_Id IN (SELECT Provider_Id FROM tblProviderFinancial))
		
		UPDATE TBLTRANSACTIONS SET TRANSACTIONS_STATUS='FREEZED',INVOICE_ID=@IID,invoice_by= 'Group' WHERE Provider_id in (select distinct Provider_Id from tblProvider where Provider_GroupName =@Provider_GroupName) AND (TRANSACTIONS_STATUS IS NULL or TRANSACTIONS_STATUS = 'CONFIRMED') AND TRANSACTIONS_TYPE IN ('C','I','Prec','PreCToP') AND (Provider_Id NOT IN (SELECT Provider_Id FROM tblProviderFinancial))
		
		SELECT @BILL_FF = MAX(ISNULL(PROVIDER_FF,0)) FROM TBLPROVIDER WHERE Provider_id in (select distinct Provider_Id from tblProvider where Provider_GroupName =@Provider_GroupName)
		
		IF @BILL_FF=1
			UPDATE TBLTRANSACTIONS SET TRANSACTIONS_STATUS='FREEZED',INVOICE_ID=@IID,invoice_by= 'Group' WHERE Provider_id in (select distinct Provider_Id from tblProvider where Provider_GroupName =@Provider_GroupName) AND (TRANSACTIONS_STATUS IS NULL or TRANSACTIONS_STATUS = 'CONFIRMED') AND TRANSACTIONS_TYPE IN ('EXP','FFB')
		ELSE
			UPDATE TBLTRANSACTIONS SET TRANSACTIONS_STATUS='FREEZED',INVOICE_ID=@IID,invoice_by= 'Group' WHERE Provider_id in (select distinct Provider_Id from tblProvider where Provider_GroupName =@Provider_GroupName) AND (TRANSACTIONS_STATUS IS NULL or TRANSACTIONS_STATUS = 'CONFIRMED') AND TRANSACTIONS_TYPE IN ('EXP')
		
		
		SELECT @RETURN_FF = MAX(ISNULL(PROVIDER_RETURNFF,0)) FROM TBLPROVIDER WHERE Provider_id in (select distinct Provider_Id from tblProvider where Provider_GroupName =@Provider_GroupName)
		
		
		
		IF @RETURN_FF=1
			UPDATE TBLTRANSACTIONS SET TRANSACTIONS_STATUS='FREEZED',INVOICE_ID=@IID,invoice_by= 'Group' WHERE Provider_id in (select distinct Provider_Id from tblProvider where Provider_GroupName =@Provider_GroupName) AND (TRANSACTIONS_STATUS IS NULL or TRANSACTIONS_STATUS = 'CONFIRMED') AND TRANSACTIONS_TYPE IN ('FFC')
		
		UPDATE TBLTRANSACTIONS SET TRANSACTIONS_STATUS='FREEZED',INVOICE_ID=@IID,invoice_by= 'Group' WHERE Provider_id in (select distinct Provider_Id from tblProvider where Provider_GroupName =@Provider_GroupName) AND (TRANSACTIONS_STATUS IS NULL or TRANSACTIONS_STATUS = 'CONFIRMED') AND TRANSACTIONS_TYPE IN ('CRED','EXPF','EXPP','EXPC')     
	END	
END 
END
GO
