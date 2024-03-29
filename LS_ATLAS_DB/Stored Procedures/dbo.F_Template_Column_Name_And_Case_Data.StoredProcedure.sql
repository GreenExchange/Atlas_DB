USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[F_Template_Column_Name_And_Case_Data]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[F_Template_Column_Name_And_Case_Data] -- F_Template_Column_Name_And_Case_Data 'TEST2','0','TEST217-12007'
	@DomainId varchar(50),
	@i_a_type int,
	@s_a_case_id varchar(100)=null
	
AS  
BEGIN	
	DECLARE @tblPacketInfoInOneRow TABLE 
			(
				PACKET_ID VARCHAR(MAX),
				PROVIDER_NAME_ALL VARCHAR(MAX),
				INJURED_NAME_ALL VARCHAR(MAX),
				BALANCE_AMOUNT_ALL Float  ,
				PROVIDER_ADDRESS_ALL VARCHAR(MAX),
				DOSEND60DAY VARCHAR(MAX),	

				PROVIDER_NAME_1 VARCHAR(MAX),
				INJUREDPARTY_NAME_1 VARCHAR(MAX),
				ACCIDENT_DATE_1 VARCHAR(MAX),
				INS_CLAIM_NUMBER_1 VARCHAR(MAX),
				BALANCE_1  VARCHAR(MAX),				 
				DATEOFSERVICE_START_1 VARCHAR(MAX),				
				DATEOFSERVICE_END_1 VARCHAR(MAX),

				PROVIDER_NAME_2 VARCHAR(MAX),
				BALANCE_2  VARCHAR(MAX),
				DATEOFSERVICE_START_2 VARCHAR(MAX),
				DATEOFSERVICE_END_2 VARCHAR(MAX),
				INJUREDPARTY_NAME_2 VARCHAR(MAX),
				ACCIDENT_DATE_2 VARCHAR(MAX),
				INS_CLAIM_NUMBER_2 VARCHAR(MAX),

				PROVIDER_NAME_3 VARCHAR(MAX),
				BALANCE_3  VARCHAR(MAX),				 
				DATEOFSERVICE_START_3 VARCHAR(MAX),				
				DATEOFSERVICE_END_3 VARCHAR(MAX),
				INJUREDPARTY_NAME_3 VARCHAR(MAX),
				ACCIDENT_DATE_3 VARCHAR(MAX),
				INS_CLAIM_NUMBER_3 VARCHAR(MAX),

				PROVIDER_NAME_4 VARCHAR(MAX),
				BALANCE_4  VARCHAR(MAX),				 
				DATEOFSERVICE_START_4 VARCHAR(MAX),				
				DATEOFSERVICE_END_4 VARCHAR(MAX),
				INJUREDPARTY_NAME_4 VARCHAR(MAX),
				ACCIDENT_DATE_4 VARCHAR(MAX),
				INS_CLAIM_NUMBER_4 VARCHAR(MAX),

				PROVIDER_NAME_5 VARCHAR(MAX),
				BALANCE_5 VARCHAR(MAX),				 
				DATEOFSERVICE_START_5 VARCHAR(MAX),				
				DATEOFSERVICE_END_5 VARCHAR(MAX),
				INJUREDPARTY_NAME_5 VARCHAR(MAX),
				ACCIDENT_DATE_5 VARCHAR(MAX),
				INS_CLAIM_NUMBER_5 VARCHAR(MAX),

				PROVIDER_NAME_6 VARCHAR(MAX),
				BALANCE_6  VARCHAR(MAX),				 
				DATEOFSERVICE_START_6 VARCHAR(MAX),				
				DATEOFSERVICE_END_6 VARCHAR(MAX),
				INJUREDPARTY_NAME_6 VARCHAR(MAX),
				ACCIDENT_DATE_6 VARCHAR(MAX),
				INS_CLAIM_NUMBER_6 VARCHAR(MAX),

				PROVIDER_NAME_7 VARCHAR(MAX),
				BALANCE_7  VARCHAR(MAX),				 
				DATEOFSERVICE_START_7 VARCHAR(MAX),				
				DATEOFSERVICE_END_7 VARCHAR(MAX),
				INJUREDPARTY_NAME_7 VARCHAR(MAX),
				ACCIDENT_DATE_7 VARCHAR(MAX),
				INS_CLAIM_NUMBER_7 VARCHAR(MAX),

				PROVIDER_NAME_8 VARCHAR(MAX),
				BALANCE_8  VARCHAR(MAX),				 
				DATEOFSERVICE_START_8 VARCHAR(MAX),				
				DATEOFSERVICE_END_8 VARCHAR(MAX),
				INJUREDPARTY_NAME_8 VARCHAR(MAX),
				ACCIDENT_DATE_8 VARCHAR(MAX),
				INS_CLAIM_NUMBER_8 VARCHAR(MAX),

				PROVIDER_NAME_9 VARCHAR(MAX),
				BALANCE_9  VARCHAR(MAX),			 
				DATEOFSERVICE_START_9 VARCHAR(MAX),				
				DATEOFSERVICE_END_9 VARCHAR(MAX),
				INJUREDPARTY_NAME_9 VARCHAR(MAX),
				ACCIDENT_DATE_9 VARCHAR(MAX),
				INS_CLAIM_NUMBER_9 VARCHAR(MAX),

				PROVIDER_NAME_10 VARCHAR(MAX),
				BALANCE_10  VARCHAR(MAX),				 
				DATEOFSERVICE_START_10 VARCHAR(MAX),				
				DATEOFSERVICE_END_10 VARCHAR(MAX),
				INJUREDPARTY_NAME_10 VARCHAR(MAX),
				ACCIDENT_DATE_10 VARCHAR(MAX),
				INS_CLAIM_NUMBER_10 VARCHAR(MAX),

				PROVIDER_NAME_11 VARCHAR(MAX),
				BALANCE_11  VARCHAR(MAX),				 
				DATEOFSERVICE_START_11 VARCHAR(MAX),				
				DATEOFSERVICE_END_11 VARCHAR(MAX),
				INJUREDPARTY_NAME_11 VARCHAR(MAX),
				ACCIDENT_DATE_11 VARCHAR(MAX),
				INS_CLAIM_NUMBER_11 VARCHAR(MAX),

				PROVIDER_NAME_12 VARCHAR(MAX),
				BALANCE_12  VARCHAR(MAX),				 
				DATEOFSERVICE_START_12 VARCHAR(MAX),				
				DATEOFSERVICE_END_12 VARCHAR(MAX),
				INJUREDPARTY_NAME_12 VARCHAR(MAX),
				ACCIDENT_DATE_12 VARCHAR(MAX),
				INS_CLAIM_NUMBER_12 VARCHAR(MAX),

				PROVIDER_NAME_13 VARCHAR(MAX),
				BALANCE_13  VARCHAR(MAX),				 
				DATEOFSERVICE_START_13 VARCHAR(MAX),				
				DATEOFSERVICE_END_13 VARCHAR(MAX),
				INJUREDPARTY_NAME_13 VARCHAR(MAX),
				ACCIDENT_DATE_13 VARCHAR(MAX),
				INS_CLAIM_NUMBER_13 VARCHAR(MAX),

				PROVIDER_NAME_14 VARCHAR(MAX),
				BALANCE_14  VARCHAR(MAX),				 
				DATEOFSERVICE_START_14 VARCHAR(MAX),				
				DATEOFSERVICE_END_14 VARCHAR(MAX),
				INJUREDPARTY_NAME_14 VARCHAR(MAX),
				ACCIDENT_DATE_14 VARCHAR(MAX),
				INS_CLAIM_NUMBER_14 VARCHAR(MAX),

				PROVIDER_NAME_15 VARCHAR(MAX),
				BALANCE_15 VARCHAR(MAX),					 
				DATEOFSERVICE_START_15 VARCHAR(MAX),				
				DATEOFSERVICE_END_15 VARCHAR(MAX),
				INJUREDPARTY_NAME_15 VARCHAR(MAX),
				ACCIDENT_DATE_15 VARCHAR(MAX),
				INS_CLAIM_NUMBER_15 VARCHAR(MAX),

				PROVIDER_NAME_16 VARCHAR(MAX),
				BALANCE_16  VARCHAR(MAX),				 
				DATEOFSERVICE_START_16 VARCHAR(MAX),				
				DATEOFSERVICE_END_16 VARCHAR(MAX),
				INJUREDPARTY_NAME_16 VARCHAR(MAX),
				ACCIDENT_DATE_16 VARCHAR(MAX),
				INS_CLAIM_NUMBER_16 VARCHAR(MAX),

				PROVIDER_NAME_17 VARCHAR(MAX),
				BALANCE_17  VARCHAR(MAX),				 
				DATEOFSERVICE_START_17 VARCHAR(MAX),				
				DATEOFSERVICE_END_17 VARCHAR(MAX),
				INJUREDPARTY_NAME_17 VARCHAR(MAX),
				ACCIDENT_DATE_17 VARCHAR(MAX),
				INS_CLAIM_NUMBER_17 VARCHAR(MAX),

				PROVIDER_NAME_18 VARCHAR(MAX),
				BALANCE_18  VARCHAR(MAX),				 
				DATEOFSERVICE_START_18 VARCHAR(MAX),				
				DATEOFSERVICE_END_18 VARCHAR(MAX),
				INJUREDPARTY_NAME_18 VARCHAR(MAX),
				ACCIDENT_DATE_18 VARCHAR(MAX),
				INS_CLAIM_NUMBER_18 VARCHAR(MAX),

				PROVIDER_NAME_19 VARCHAR(MAX),
				BALANCE_19  VARCHAR(MAX),				 
				DATEOFSERVICE_START_19 VARCHAR(MAX),				
				DATEOFSERVICE_END_19 VARCHAR(MAX),
				INJUREDPARTY_NAME_19 VARCHAR(MAX),
				ACCIDENT_DATE_19 VARCHAR(MAX),
				INS_CLAIM_NUMBER_19 VARCHAR(MAX),

				PROVIDER_NAME_20 VARCHAR(MAX),
				BALANCE_20  VARCHAR(MAX),				 
				DATEOFSERVICE_START_20 VARCHAR(MAX),				
				DATEOFSERVICE_END_20 VARCHAR(MAX),
				INJUREDPARTY_NAME_20 VARCHAR(MAX),
				ACCIDENT_DATE_20 VARCHAR(MAX),
				INS_CLAIM_NUMBER_20 VARCHAR(MAX)

				

				
				
			)

	if(@i_a_type = 0)
	BEGIN	
		DECLARE @Packet_ID VARCHAR(1000) ='TEST2-PKT17-100001' 

		SET @Packet_ID = (SELECT MAX(ISNULL(PacketID,'')) FROM dbo.tblPacket pkt INNER JOIN tblCase cas on pkt.Packet_Auto_ID  = cas.FK_Packet_ID WHERE cas.Case_Id = @s_a_case_id)

		IF @Packet_ID <> ''
		BEGIN

			DECLARE @PROVIDER_NAME_ALL VARCHAR(MAX),
					@INJURED_NAME_ALL VARCHAR(MAX),
					@BALANCE_AMOUNT_ALL Float ,
					@PROVIDER_ADDRESS_ALL VARCHAR(MAX),
					@DOSEND60DAY VARCHAR(MAX),
					@PROVIDER_NAME_1 VARCHAR(MAX),
					@INJUREDPARTY_NAME_1 VARCHAR(MAX),
					@ACCIDENT_DATE_1 VARCHAR(MAX),
					@INS_CLAIM_NUMBER_1 VARCHAR(MAX),
					@BALANCE_1  VARCHAR(MAX),
					@DATEOFSERVICE_START_1 VARCHAR(MAX),					
					@DATEOFSERVICE_END_1 VARCHAR(MAX),
					@PROVIDER_NAME_2 VARCHAR(MAX),	
					@INJUREDPARTY_NAME_2 VARCHAR(MAX),
					@ACCIDENT_DATE_2 VARCHAR(MAX),
					@INS_CLAIM_NUMBER_2 VARCHAR(MAX),				 
					@BALANCE_2  VARCHAR(MAX), 					
					@DATEOFSERVICE_START_2 VARCHAR(MAX),
					@DATEOFSERVICE_END_2 VARCHAR(MAX),

					@PROVIDER_NAME_3 VARCHAR(MAX),					 
					@BALANCE_3  VARCHAR(MAX), 					
					@DATEOFSERVICE_START_3 VARCHAR(MAX),
					@DATEOFSERVICE_END_3 VARCHAR(MAX),
					@INJUREDPARTY_NAME_3 VARCHAR(MAX),
				@ACCIDENT_DATE_3 VARCHAR(MAX),
				@INS_CLAIM_NUMBER_3 VARCHAR(MAX),
				 
				@PROVIDER_NAME_4 VARCHAR(MAX),
				@BALANCE_4  VARCHAR(MAX),				 
				@DATEOFSERVICE_START_4 VARCHAR(MAX),				
				@DATEOFSERVICE_END_4 VARCHAR(MAX),
				@INJUREDPARTY_NAME_4 VARCHAR(MAX),
				@ACCIDENT_DATE_4 VARCHAR(MAX),
				@INS_CLAIM_NUMBER_4 VARCHAR(MAX),

				@PROVIDER_NAME_5 VARCHAR(MAX),
				@BALANCE_5 VARCHAR(MAX),				 
				@DATEOFSERVICE_START_5 VARCHAR(MAX),				
				@DATEOFSERVICE_END_5 VARCHAR(MAX),
				@INJUREDPARTY_NAME_5 VARCHAR(MAX),
				@ACCIDENT_DATE_5 VARCHAR(MAX),
				@INS_CLAIM_NUMBER_5 VARCHAR(MAX),

				@PROVIDER_NAME_6 VARCHAR(MAX),
				@BALANCE_6  VARCHAR(MAX),				 
				@DATEOFSERVICE_START_6 VARCHAR(MAX),				
				@DATEOFSERVICE_END_6 VARCHAR(MAX),
				@INJUREDPARTY_NAME_6 VARCHAR(MAX),
				@ACCIDENT_DATE_6 VARCHAR(MAX),
				@INS_CLAIM_NUMBER_6 VARCHAR(MAX),

				@PROVIDER_NAME_7 VARCHAR(MAX),
				@BALANCE_7  VARCHAR(MAX),				 
				@DATEOFSERVICE_START_7 VARCHAR(MAX),				
				@DATEOFSERVICE_END_7 VARCHAR(MAX),
				@INJUREDPARTY_NAME_7 VARCHAR(MAX),
				@ACCIDENT_DATE_7 VARCHAR(MAX),
				@INS_CLAIM_NUMBER_7 VARCHAR(MAX),

				@PROVIDER_NAME_8 VARCHAR(MAX),
				@BALANCE_8  VARCHAR(MAX),				 
				@DATEOFSERVICE_START_8 VARCHAR(MAX),				
				@DATEOFSERVICE_END_8 VARCHAR(MAX),
				@INJUREDPARTY_NAME_8 VARCHAR(MAX),
				@ACCIDENT_DATE_8 VARCHAR(MAX),
				@INS_CLAIM_NUMBER_8 VARCHAR(MAX),

				@PROVIDER_NAME_9 VARCHAR(MAX),
				@BALANCE_9  VARCHAR(MAX),				 
				@DATEOFSERVICE_START_9 VARCHAR(MAX),				
				@DATEOFSERVICE_END_9 VARCHAR(MAX),
				@INJUREDPARTY_NAME_9 VARCHAR(MAX),
				@ACCIDENT_DATE_9 VARCHAR(MAX),
				@INS_CLAIM_NUMBER_9 VARCHAR(MAX),

				@PROVIDER_NAME_10 VARCHAR(MAX),
				@BALANCE_10  VARCHAR(MAX),				 
				@DATEOFSERVICE_START_10 VARCHAR(MAX),				
				@DATEOFSERVICE_END_10 VARCHAR(MAX),
				@INJUREDPARTY_NAME_10 VARCHAR(MAX),
				@ACCIDENT_DATE_10 VARCHAR(MAX),
				@INS_CLAIM_NUMBER_10 VARCHAR(MAX),

				@PROVIDER_NAME_11 VARCHAR(MAX),
				@BALANCE_11  VARCHAR(MAX),
				@DATEOFSERVICE_START_11 VARCHAR(MAX),
				@DATEOFSERVICE_END_11 VARCHAR(MAX),
				@INJUREDPARTY_NAME_11 VARCHAR(MAX),
				@ACCIDENT_DATE_11 VARCHAR(MAX),
				@INS_CLAIM_NUMBER_11 VARCHAR(MAX),
	
				@PROVIDER_NAME_12 VARCHAR(MAX),
				@BALANCE_12  VARCHAR(MAX),
				@DATEOFSERVICE_START_12 VARCHAR(MAX),
				@DATEOFSERVICE_END_12 VARCHAR(MAX),
				@INJUREDPARTY_NAME_12 VARCHAR(MAX),
				@ACCIDENT_DATE_12 VARCHAR(MAX),
				@INS_CLAIM_NUMBER_12 VARCHAR(MAX),
	
				@PROVIDER_NAME_13 VARCHAR(MAX),
				@BALANCE_13  VARCHAR(MAX),
				@DATEOFSERVICE_START_13 VARCHAR(MAX),
				@DATEOFSERVICE_END_13 VARCHAR(MAX),
				@INJUREDPARTY_NAME_13 VARCHAR(MAX),
				@ACCIDENT_DATE_13 VARCHAR(MAX),
				@INS_CLAIM_NUMBER_13 VARCHAR(MAX),
	
				@PROVIDER_NAME_14 VARCHAR(MAX),
				@BALANCE_14  VARCHAR(MAX),
				@DATEOFSERVICE_START_14 VARCHAR(MAX),
				@DATEOFSERVICE_END_14 VARCHAR(MAX),
				@INJUREDPARTY_NAME_14 VARCHAR(MAX),
				@ACCIDENT_DATE_14 VARCHAR(MAX),
				@INS_CLAIM_NUMBER_14 VARCHAR(MAX),
	
				@PROVIDER_NAME_15 VARCHAR(MAX),
				@BALANCE_15 VARCHAR(MAX),
				@DATEOFSERVICE_START_15 VARCHAR(MAX),
				@DATEOFSERVICE_END_15 VARCHAR(MAX),
				@INJUREDPARTY_NAME_15 VARCHAR(MAX),
				@ACCIDENT_DATE_15 VARCHAR(MAX),
				@INS_CLAIM_NUMBER_15 VARCHAR(MAX),
	
				@PROVIDER_NAME_16 VARCHAR(MAX),
				@BALANCE_16  VARCHAR(MAX),
				@DATEOFSERVICE_START_16 VARCHAR(MAX),
				@DATEOFSERVICE_END_16 VARCHAR(MAX),
				@INJUREDPARTY_NAME_16 VARCHAR(MAX),
				@ACCIDENT_DATE_16 VARCHAR(MAX),
				@INS_CLAIM_NUMBER_16 VARCHAR(MAX),
	
				@PROVIDER_NAME_17 VARCHAR(MAX),
				@BALANCE_17  VARCHAR(MAX),
				@DATEOFSERVICE_START_17 VARCHAR(MAX),
				@DATEOFSERVICE_END_17 VARCHAR(MAX),
				@INJUREDPARTY_NAME_17 VARCHAR(MAX),
				@ACCIDENT_DATE_17 VARCHAR(MAX),
				@INS_CLAIM_NUMBER_17 VARCHAR(MAX),
	
				@PROVIDER_NAME_18 VARCHAR(MAX),
				@BALANCE_18  VARCHAR(MAX),
				@DATEOFSERVICE_START_18 VARCHAR(MAX),
				@DATEOFSERVICE_END_18 VARCHAR(MAX),
				@INJUREDPARTY_NAME_18 VARCHAR(MAX),
				@ACCIDENT_DATE_18 VARCHAR(MAX),
				@INS_CLAIM_NUMBER_18 VARCHAR(MAX),
	
				@PROVIDER_NAME_19 VARCHAR(MAX),
				@BALANCE_19  VARCHAR(MAX),
				@DATEOFSERVICE_START_19 VARCHAR(MAX),
				@DATEOFSERVICE_END_19 VARCHAR(MAX),
				@INJUREDPARTY_NAME_19 VARCHAR(MAX),
				@ACCIDENT_DATE_19 VARCHAR(MAX),
				@INS_CLAIM_NUMBER_19 VARCHAR(MAX),
	
				@PROVIDER_NAME_20 VARCHAR(MAX),
				@BALANCE_20  VARCHAR(MAX),
				@DATEOFSERVICE_START_20 VARCHAR(MAX),
				@DATEOFSERVICE_END_20 VARCHAR(MAX),
				@INJUREDPARTY_NAME_20 VARCHAR(MAX),
				@ACCIDENT_DATE_20 VARCHAR(MAX),
				@INS_CLAIM_NUMBER_20 VARCHAR(MAX)



			DECLARE @tblPacketCasesAll TABLE 
			( 
				AutoID INT IDENTITY(1,1),
				CASE_ID VARCHAR(MAX),
				PROVIDER_NAME VARCHAR(MAX), 
				BALANCE VARCHAR(MAX), 
				INS_CLAIM_NUMBER VARCHAR(MAX), 
				ACCIDENT_DATE VARCHAR(MAX),
				INJUREDPARTY_NAME VARCHAR(MAX),
				DATEOFSERVICE_START VARCHAR(MAX), 
				DATEOFSERVICE_END VARCHAR(MAX),
				DOSEND60DAY  VARCHAR(MAX)
			)
			INSERT INTO @tblPacketCasesAll
			SELECT 
				CASE_ID,
				pro.PROVIDER_NAME,
				convert(varchar,(convert(Money, (CONVERT(FLOAT, isnull(cas.CLAIM_AMOUNT,0)) - CONVERT(FLOAT, isnull(cas.PAID_AMOUNT,0)))))) AS BALANCE_AMOUNT,INS_CLAIM_NUMBER,
				CONVERT(NVARCHAR(12),CONVERT(DATETIME, cas.ACCIDENT_DATE), 101) As ACCIDENT_DATE,
				UPPER(ISNULL(cas.InjuredParty_FirstName, N'')) + N' ' + UPPER(ISNULL(cas.InjuredParty_LastName, N'')) AS INJUREDPARTY_NAME, 
				CONVERT(NVARCHAR(12),CONVERT(DATETIME, cas.DATEOFSERVICE_START), 101) AS DATEOFSERVICE_START,
				CONVERT(NVARCHAR(12), CONVERT(DATETIME, cas.DATEOFSERVICE_END), 101) AS DATEOFSERVICE_END,
				CONVERT(NVARCHAR(12), CONVERT(DATETIME, dateadd(day,+60, cast(DateOfService_End as date))), 101)  AS DOSEND60DAY
			FROM dbo.tblPacket pkt
			INNER JOIN tblCase cas on pkt.Packet_Auto_ID  = cas.FK_Packet_ID
			INNER JOIN DBO.TBLINSURANCECOMPANY ins ON cas.INSURANCECOMPANY_ID = ins.INSURANCECOMPANY_ID 
			INNER JOIN  DBO.TBLPROVIDER pro ON cas.PROVIDER_ID = pro.PROVIDER_ID 
			WHERE PacketID = @Packet_ID

			--SELECT * FROM @tblPacketCasesAll

			
			--*****************************************************--
			SELECT @PROVIDER_NAME_1=PROVIDER_NAME, 
					@BALANCE_1= BALANCE, 
					@INS_CLAIM_NUMBER_1 = INS_CLAIM_NUMBER,
					@ACCIDENT_DATE_1 = ACCIDENT_DATE,
					@INJUREDPARTY_NAME_1 =INJUREDPARTY_NAME,
					@DATEOFSERVICE_START_1= DATEOFSERVICE_START,
					@DATEOFSERVICE_END_1=	DATEOFSERVICE_END
					
				
					
			FROM @tblPacketCasesAll
			WHERE AutoID = 1
			--*****************************************************--
			SELECT @PROVIDER_NAME_2=PROVIDER_NAME, 
					@BALANCE_2= BALANCE, 
					@DATEOFSERVICE_START_2= DATEOFSERVICE_START,
					@DATEOFSERVICE_END_2=	DATEOFSERVICE_END,
					@INJUREDPARTY_NAME_2 =INJUREDPARTY_NAME,
					@ACCIDENT_DATE_2 = ACCIDENT_DATE,
					@INS_CLAIM_NUMBER_2 = INS_CLAIM_NUMBER
			FROM @tblPacketCasesAll
			WHERE AutoID = 2

			--*****************************************************--
			SELECT @PROVIDER_NAME_3=PROVIDER_NAME, 
					@BALANCE_3= BALANCE, 
					@DATEOFSERVICE_START_3= DATEOFSERVICE_START,
					@DATEOFSERVICE_END_3=	DATEOFSERVICE_END,
					@INJUREDPARTY_NAME_3 =INJUREDPARTY_NAME,
					@ACCIDENT_DATE_3 = ACCIDENT_DATE,
					@INS_CLAIM_NUMBER_3 = INS_CLAIM_NUMBER
			FROM @tblPacketCasesAll
			WHERE AutoID = 3

				--*****************************************************--
			SELECT @PROVIDER_NAME_4=PROVIDER_NAME, 
					@BALANCE_4= BALANCE, 
					@DATEOFSERVICE_START_4= DATEOFSERVICE_START,
					@DATEOFSERVICE_END_4=	DATEOFSERVICE_END,
					@INJUREDPARTY_NAME_4 =INJUREDPARTY_NAME,
					@ACCIDENT_DATE_4 = ACCIDENT_DATE,
					@INS_CLAIM_NUMBER_4 = INS_CLAIM_NUMBER
			FROM @tblPacketCasesAll
			WHERE AutoID = 4

				--*****************************************************--
			SELECT @PROVIDER_NAME_5 =PROVIDER_NAME, 
					@BALANCE_5 = BALANCE, 
					@DATEOFSERVICE_START_5 = DATEOFSERVICE_START,
					@DATEOFSERVICE_END_5 =	DATEOFSERVICE_END,
					@INJUREDPARTY_NAME_5 =INJUREDPARTY_NAME,
					@ACCIDENT_DATE_5 = ACCIDENT_DATE,
					@INS_CLAIM_NUMBER_5 = INS_CLAIM_NUMBER
			FROM @tblPacketCasesAll
			WHERE AutoID = 5

			--*****************************************************--

		SELECT @PROVIDER_NAME_6 =PROVIDER_NAME, 
					@BALANCE_6 = BALANCE, 
					@DATEOFSERVICE_START_6 = DATEOFSERVICE_START,
					@DATEOFSERVICE_END_6 =	DATEOFSERVICE_END,
					@INJUREDPARTY_NAME_6 =INJUREDPARTY_NAME,
					@ACCIDENT_DATE_6 = ACCIDENT_DATE,
					@INS_CLAIM_NUMBER_6 = INS_CLAIM_NUMBER
			FROM @tblPacketCasesAll
			WHERE AutoID = 6

			--*****************************************************--

			SELECT @PROVIDER_NAME_7 =PROVIDER_NAME, 
					@BALANCE_7 = BALANCE, 
					@DATEOFSERVICE_START_7 = DATEOFSERVICE_START,
					@DATEOFSERVICE_END_7 =	DATEOFSERVICE_END,
					@INJUREDPARTY_NAME_7 =INJUREDPARTY_NAME,
					@ACCIDENT_DATE_7 = ACCIDENT_DATE,
					@INS_CLAIM_NUMBER_7 = INS_CLAIM_NUMBER
			FROM @tblPacketCasesAll
			WHERE AutoID = 7
			--*****************************************************--
			SELECT @PROVIDER_NAME_8 =PROVIDER_NAME, 
					@BALANCE_8 = BALANCE, 
					@DATEOFSERVICE_START_8 = DATEOFSERVICE_START,
					@DATEOFSERVICE_END_8 =	DATEOFSERVICE_END,
					@INJUREDPARTY_NAME_8 =INJUREDPARTY_NAME,
					@ACCIDENT_DATE_8 = ACCIDENT_DATE,
					@INS_CLAIM_NUMBER_8 = INS_CLAIM_NUMBER
			FROM @tblPacketCasesAll
			WHERE AutoID = 8
			--*****************************************************--
			SELECT @PROVIDER_NAME_9 =PROVIDER_NAME, 
					@BALANCE_9 = BALANCE, 
					@DATEOFSERVICE_START_9 = DATEOFSERVICE_START,
					@DATEOFSERVICE_END_9 =	DATEOFSERVICE_END,
					@INJUREDPARTY_NAME_9 =INJUREDPARTY_NAME,
					@ACCIDENT_DATE_9 = ACCIDENT_DATE,
					@INS_CLAIM_NUMBER_9 = INS_CLAIM_NUMBER
			FROM @tblPacketCasesAll
			WHERE AutoID = 9
			--*****************************************************--

			SELECT @PROVIDER_NAME_10 =PROVIDER_NAME, 
					@BALANCE_10 = BALANCE, 
					@DATEOFSERVICE_START_10 = DATEOFSERVICE_START,
					@DATEOFSERVICE_END_10 =	DATEOFSERVICE_END,
					@INJUREDPARTY_NAME_10 =INJUREDPARTY_NAME,
					@ACCIDENT_DATE_10 = ACCIDENT_DATE,
					@INS_CLAIM_NUMBER_10 = INS_CLAIM_NUMBER
			FROM @tblPacketCasesAll
			WHERE AutoID = 10

			--******************
			SELECT @PROVIDER_NAME_11 =PROVIDER_NAME, 
				@BALANCE_11 = BALANCE, 
				@DATEOFSERVICE_START_11 = DATEOFSERVICE_START,
				@DATEOFSERVICE_END_11 =	DATEOFSERVICE_END,
				@INJUREDPARTY_NAME_11 =INJUREDPARTY_NAME,
				@ACCIDENT_DATE_11 = ACCIDENT_DATE,
				@INS_CLAIM_NUMBER_11 = INS_CLAIM_NUMBER
			FROM @tblPacketCasesAll
			WHERE AutoID = 11

			--******************
			SELECT  @PROVIDER_NAME_12 =PROVIDER_NAME, 
				@BALANCE_12  = BALANCE, 
				@DATEOFSERVICE_START_12 = DATEOFSERVICE_START,
				@DATEOFSERVICE_END_12 =	DATEOFSERVICE_END,
				@INJUREDPARTY_NAME_12  =INJUREDPARTY_NAME,
				@ACCIDENT_DATE_12 = ACCIDENT_DATE,
				@INS_CLAIM_NUMBER_12 = INS_CLAIM_NUMBER
			FROM @tblPacketCasesAll
			WHERE AutoID = 12

			--******************
	
				SELECT  @PROVIDER_NAME_13 =PROVIDER_NAME, 
				@BALANCE_13 = BALANCE, 
				@DATEOFSERVICE_START_13 = DATEOFSERVICE_START,
				@DATEOFSERVICE_END_13 =	DATEOFSERVICE_END,
				@INJUREDPARTY_NAME_13 =INJUREDPARTY_NAME,
				@ACCIDENT_DATE_13 = ACCIDENT_DATE,
				@INS_CLAIM_NUMBER_13 = INS_CLAIM_NUMBER
			FROM @tblPacketCasesAll
			WHERE AutoID = 13

			--******************
	
				SELECT  @PROVIDER_NAME_14 =PROVIDER_NAME, 
				@BALANCE_14 = BALANCE, 
				@DATEOFSERVICE_START_14 = DATEOFSERVICE_START,
				@DATEOFSERVICE_END_14 =	DATEOFSERVICE_END,
				@INJUREDPARTY_NAME_14 =INJUREDPARTY_NAME,
				@ACCIDENT_DATE_14 = ACCIDENT_DATE,
				@INS_CLAIM_NUMBER_14 = INS_CLAIM_NUMBER
			FROM @tblPacketCasesAll
			WHERE AutoID = 14

			--******************
	
				SELECT  @PROVIDER_NAME_15 =PROVIDER_NAME, 
				@BALANCE_15 = BALANCE, 
				@DATEOFSERVICE_START_15 = DATEOFSERVICE_START,
				@DATEOFSERVICE_END_15 =	DATEOFSERVICE_END,
				@INJUREDPARTY_NAME_15 =INJUREDPARTY_NAME,
				@ACCIDENT_DATE_15 = ACCIDENT_DATE,
				@INS_CLAIM_NUMBER_15 = INS_CLAIM_NUMBER
			FROM @tblPacketCasesAll
			WHERE AutoID = 15

			--******************
	
				SELECT  @PROVIDER_NAME_16 =PROVIDER_NAME, 
				@BALANCE_16 = BALANCE, 
				@DATEOFSERVICE_START_16 = DATEOFSERVICE_START,
				@DATEOFSERVICE_END_16 =	DATEOFSERVICE_END,
				@INJUREDPARTY_NAME_16 =INJUREDPARTY_NAME,
				@ACCIDENT_DATE_16 = ACCIDENT_DATE,
				@INS_CLAIM_NUMBER_16 = INS_CLAIM_NUMBER
			FROM @tblPacketCasesAll
			WHERE AutoID = 16

			--******************
	
				SELECT  @PROVIDER_NAME_17 =PROVIDER_NAME, 
				@BALANCE_17 = BALANCE, 
				@DATEOFSERVICE_START_17 = DATEOFSERVICE_START,
				@DATEOFSERVICE_END_17 =	DATEOFSERVICE_END,
				@INJUREDPARTY_NAME_17 =INJUREDPARTY_NAME,
				@ACCIDENT_DATE_17 = ACCIDENT_DATE,
				@INS_CLAIM_NUMBER_17 = INS_CLAIM_NUMBER
			FROM @tblPacketCasesAll
			WHERE AutoID = 17

			--******************
	
				SELECT  @PROVIDER_NAME_18 =PROVIDER_NAME, 
				@BALANCE_18 = BALANCE, 
				@DATEOFSERVICE_START_18 = DATEOFSERVICE_START,
				@DATEOFSERVICE_END_18 =	DATEOFSERVICE_END,
				@INJUREDPARTY_NAME_18 =INJUREDPARTY_NAME,
				@ACCIDENT_DATE_18 = ACCIDENT_DATE,
				@INS_CLAIM_NUMBER_18 = INS_CLAIM_NUMBER
			FROM @tblPacketCasesAll
			WHERE AutoID = 18

			--******************
	
				SELECT  @PROVIDER_NAME_19 =PROVIDER_NAME, 
				@BALANCE_19 = BALANCE, 
				@DATEOFSERVICE_START_19 = DATEOFSERVICE_START,
				@DATEOFSERVICE_END_19 =	DATEOFSERVICE_END,
				@INJUREDPARTY_NAME_19 =INJUREDPARTY_NAME,
				@ACCIDENT_DATE_19 = ACCIDENT_DATE,
				@INS_CLAIM_NUMBER_19 = INS_CLAIM_NUMBER
			FROM @tblPacketCasesAll
			WHERE AutoID = 19

			--******************
	
				SELECT  @PROVIDER_NAME_20 =PROVIDER_NAME, 
				@BALANCE_20 = BALANCE, 
				@DATEOFSERVICE_START_20 = DATEOFSERVICE_START,
				@DATEOFSERVICE_END_20 =	DATEOFSERVICE_END,
				@INJUREDPARTY_NAME_20 =INJUREDPARTY_NAME,
				@ACCIDENT_DATE_20 = ACCIDENT_DATE,
				@INS_CLAIM_NUMBER_20 = INS_CLAIM_NUMBER
			FROM @tblPacketCasesAll
			WHERE AutoID = 20

			--******************
			
			
			SELECT 
				@PROVIDER_NAME_ALL = COALESCE(@PROVIDER_NAME_ALL,' ') + Provider_Name + ' and ' ,
				@PROVIDER_ADDRESS_ALL = COALESCE(@PROVIDER_ADDRESS_ALL,'') + Provider_Name+' \line '+Provider_Local_Address+' \line '+Provider_Local_City+' ' + Provider_Local_State+' ' + Provider_Local_Zip + ' \line\line ' ,
				--@INJURED_NAME_ALL =  COALESCE(@INJURED_NAME_ALL,' ') + Injuredparty_Name + ' and ' ,
				@INJURED_NAME_ALL = COALESCE(@INJURED_NAME_ALL,' ') + UPPER(ISNULL(cas.InjuredParty_FirstName, N'')) + N'  ' + UPPER(ISNULL(cas.InjuredParty_LastName, N'')) + ' , ' ,
				--@BALANCE_AMOUNT_ALL =   COALESCE(@BALANCE_AMOUNT_ALL,' ') + convert(varchar,(convert(Money, (CONVERT(FLOAT, isnull(cas.CLAIM_AMOUNT,0)) - CONVERT(FLOAT, isnull(cas.PAID_AMOUNT,0)))))) 
				--@BALANCE_AMOUNT_ALL = COALESCE(@INJURED_NAME_ALL,' ') + count(convert(varchar,(convert(Money, (CONVERT(FLOAT, isnull(cas.CLAIM_AMOUNT,0)) - CONVERT(FLOAT, isnull(cas.PAID_AMOUNT,0)))))))
			
				@BALANCE_AMOUNT_ALL = COALESCE(@BALANCE_AMOUNT_ALL,' ') + convert(varchar,(convert(Money, (CONVERT(FLOAT, isnull(cas.CLAIM_AMOUNT,0)) - CONVERT(FLOAT, isnull(cas.PAID_AMOUNT,0)))))),
				@DOSEND60DAY = CONVERT(NVARCHAR(12), CONVERT(DATETIME, dateadd(day,+60, cast(DateOfService_End as date))), 101) 

			FROM dbo.tblPacket pkt
			INNER JOIN tblCase cas on pkt.Packet_Auto_ID  = cas.FK_Packet_ID
			INNER JOIN DBO.TBLINSURANCECOMPANY ins ON cas.INSURANCECOMPANY_ID = ins.INSURANCECOMPANY_ID 
			INNER JOIN  DBO.TBLPROVIDER pro ON cas.PROVIDER_ID = pro.PROVIDER_ID 
			WHERE PacketID = @Packet_ID
			--Group BY @PROVIDER_NAME_ALL,@PROVIDER_ADDRESS_ALL,@INJURED_NAME_ALL

			--SET @PROVIDER_NAME_ALL =  LEFT(@PROVIDER_NAME_ALL, LEN(@PROVIDER_NAME_ALL)-4)
			SET @PROVIDER_NAME_ALL =  REPLACE(@PROVIDER_NAME_ALL+ '-','and -','')
			--SET @INJURED_NAME_ALL =  REPLACE(@INJURED_NAME_ALL+ '-','and -','')
			--Set @BALANCE_AMOUNT_ALL = REPLACE(@BALANCE_AMOUNT_ALL,RIGHT(@BALANCE_AMOUNT_ALL,2),'')
			--*****************************************************--
			
			INSERT INTO @tblPacketInfoInOneRow (PACKET_ID, PROVIDER_NAME_ALL, PROVIDER_ADDRESS_ALL,DOSEND60DAY, INJURED_NAME_ALL,BALANCE_AMOUNT_ALL,
			PROVIDER_NAME_1, BALANCE_1, DATEOFSERVICE_START_1, DATEOFSERVICE_END_1,INJUREDPARTY_NAME_1,ACCIDENT_DATE_1,INS_CLAIM_NUMBER_1,
			PROVIDER_NAME_2, BALANCE_2, DATEOFSERVICE_START_2, DATEOFSERVICE_END_2,INJUREDPARTY_NAME_2,ACCIDENT_DATE_2,INS_CLAIM_NUMBER_2,
			PROVIDER_NAME_3, BALANCE_3, DATEOFSERVICE_START_3, DATEOFSERVICE_END_3,INJUREDPARTY_NAME_3,ACCIDENT_DATE_3,INS_CLAIM_NUMBER_3,
			PROVIDER_NAME_4, BALANCE_4, DATEOFSERVICE_START_4, DATEOFSERVICE_END_4,INJUREDPARTY_NAME_4,ACCIDENT_DATE_4,INS_CLAIM_NUMBER_4,
			PROVIDER_NAME_5, BALANCE_5, DATEOFSERVICE_START_5, DATEOFSERVICE_END_5,INJUREDPARTY_NAME_5,ACCIDENT_DATE_5,INS_CLAIM_NUMBER_5,
			PROVIDER_NAME_6, BALANCE_6, DATEOFSERVICE_START_6, DATEOFSERVICE_END_6,INJUREDPARTY_NAME_6,ACCIDENT_DATE_6,INS_CLAIM_NUMBER_6,
			PROVIDER_NAME_7, BALANCE_7, DATEOFSERVICE_START_7, DATEOFSERVICE_END_7,INJUREDPARTY_NAME_7,ACCIDENT_DATE_7,INS_CLAIM_NUMBER_7,
			PROVIDER_NAME_8, BALANCE_8, DATEOFSERVICE_START_8, DATEOFSERVICE_END_8,INJUREDPARTY_NAME_8,ACCIDENT_DATE_8,INS_CLAIM_NUMBER_8,
			PROVIDER_NAME_9, BALANCE_9, DATEOFSERVICE_START_9, DATEOFSERVICE_END_9,INJUREDPARTY_NAME_9,ACCIDENT_DATE_9,INS_CLAIM_NUMBER_9,
			PROVIDER_NAME_10, BALANCE_10, DATEOFSERVICE_START_10, DATEOFSERVICE_END_10,INJUREDPARTY_NAME_10,ACCIDENT_DATE_10,INS_CLAIM_NUMBER_10,
			PROVIDER_NAME_11,BALANCE_11,DATEOFSERVICE_START_11,DATEOFSERVICE_END_11,INJUREDPARTY_NAME_11,ACCIDENT_DATE_11,INS_CLAIM_NUMBER_11,
			PROVIDER_NAME_12,BALANCE_12,DATEOFSERVICE_START_12,DATEOFSERVICE_END_12,INJUREDPARTY_NAME_12,ACCIDENT_DATE_12,INS_CLAIM_NUMBER_12,
			PROVIDER_NAME_13,BALANCE_13,DATEOFSERVICE_START_13,DATEOFSERVICE_END_13,INJUREDPARTY_NAME_13,ACCIDENT_DATE_13,INS_CLAIM_NUMBER_13,
			PROVIDER_NAME_14,BALANCE_14,DATEOFSERVICE_START_14,DATEOFSERVICE_END_14,INJUREDPARTY_NAME_14,ACCIDENT_DATE_14,INS_CLAIM_NUMBER_14,
			PROVIDER_NAME_15,BALANCE_15,DATEOFSERVICE_START_15,DATEOFSERVICE_END_15,INJUREDPARTY_NAME_15,ACCIDENT_DATE_15,INS_CLAIM_NUMBER_15,
			PROVIDER_NAME_16,BALANCE_16,DATEOFSERVICE_START_16,DATEOFSERVICE_END_16,INJUREDPARTY_NAME_16,ACCIDENT_DATE_16,INS_CLAIM_NUMBER_16,
			PROVIDER_NAME_17,BALANCE_17,DATEOFSERVICE_START_17,DATEOFSERVICE_END_17,INJUREDPARTY_NAME_17,ACCIDENT_DATE_17,INS_CLAIM_NUMBER_17,
			PROVIDER_NAME_18,BALANCE_18,DATEOFSERVICE_START_18,DATEOFSERVICE_END_18,INJUREDPARTY_NAME_18,ACCIDENT_DATE_18,INS_CLAIM_NUMBER_18,
			PROVIDER_NAME_19,BALANCE_19,DATEOFSERVICE_START_19,DATEOFSERVICE_END_19,INJUREDPARTY_NAME_19,ACCIDENT_DATE_19,INS_CLAIM_NUMBER_19,
			PROVIDER_NAME_20,BALANCE_20,DATEOFSERVICE_START_20,DATEOFSERVICE_END_20,INJUREDPARTY_NAME_20,ACCIDENT_DATE_20,INS_CLAIM_NUMBER_20)


			SELECT @PACKET_ID, @PROVIDER_NAME_ALL, @PROVIDER_ADDRESS_ALL,@DOSEND60DAY, @INJURED_NAME_ALL,@BALANCE_AMOUNT_ALL,
			@PROVIDER_NAME_1, @BALANCE_1, @DATEOFSERVICE_START_1, @DATEOFSERVICE_END_1,@INJUREDPARTY_NAME_1,@ACCIDENT_DATE_1,@INS_CLAIM_NUMBER_1,
			@PROVIDER_NAME_2, @BALANCE_2, @DATEOFSERVICE_START_2, @DATEOFSERVICE_END_2,@INJUREDPARTY_NAME_2,@ACCIDENT_DATE_2,@INS_CLAIM_NUMBER_2,
			@PROVIDER_NAME_3, @BALANCE_3, @DATEOFSERVICE_START_3, @DATEOFSERVICE_END_3,@INJUREDPARTY_NAME_3,@ACCIDENT_DATE_3,@INS_CLAIM_NUMBER_3,
			@PROVIDER_NAME_4, @BALANCE_4, @DATEOFSERVICE_START_4, @DATEOFSERVICE_END_4,@INJUREDPARTY_NAME_4,@ACCIDENT_DATE_4,@INS_CLAIM_NUMBER_4,
			@PROVIDER_NAME_5, @BALANCE_5, @DATEOFSERVICE_START_5, @DATEOFSERVICE_END_5,@INJUREDPARTY_NAME_5,@ACCIDENT_DATE_5,@INS_CLAIM_NUMBER_5,
			@PROVIDER_NAME_6, @BALANCE_6, @DATEOFSERVICE_START_6, @DATEOFSERVICE_END_6,@INJUREDPARTY_NAME_6,@ACCIDENT_DATE_6,@INS_CLAIM_NUMBER_6,
			@PROVIDER_NAME_7, @BALANCE_7, @DATEOFSERVICE_START_7, @DATEOFSERVICE_END_7,@INJUREDPARTY_NAME_7,@ACCIDENT_DATE_7,@INS_CLAIM_NUMBER_7,
			@PROVIDER_NAME_8, @BALANCE_8, @DATEOFSERVICE_START_8, @DATEOFSERVICE_END_8,@INJUREDPARTY_NAME_8,@ACCIDENT_DATE_8,@INS_CLAIM_NUMBER_8,
			@PROVIDER_NAME_9, @BALANCE_9, @DATEOFSERVICE_START_9, @DATEOFSERVICE_END_9,@INJUREDPARTY_NAME_9,@ACCIDENT_DATE_9,@INS_CLAIM_NUMBER_9,
			@PROVIDER_NAME_10, @BALANCE_10, @DATEOFSERVICE_START_10, @DATEOFSERVICE_END_10,@INJUREDPARTY_NAME_10,@ACCIDENT_DATE_10,@INS_CLAIM_NUMBER_10,
			@PROVIDER_NAME_11,@BALANCE_11,@DATEOFSERVICE_START_11,@DATEOFSERVICE_END_11,@INJUREDPARTY_NAME_11,@ACCIDENT_DATE_11,@INS_CLAIM_NUMBER_11,
			@PROVIDER_NAME_12,@BALANCE_12,@DATEOFSERVICE_START_12,@DATEOFSERVICE_END_12,@INJUREDPARTY_NAME_12,@ACCIDENT_DATE_12,@INS_CLAIM_NUMBER_12,
			@PROVIDER_NAME_13,@BALANCE_13,@DATEOFSERVICE_START_13,@DATEOFSERVICE_END_13,@INJUREDPARTY_NAME_13,@ACCIDENT_DATE_13,@INS_CLAIM_NUMBER_13,
			@PROVIDER_NAME_14,@BALANCE_14,@DATEOFSERVICE_START_14,@DATEOFSERVICE_END_14,@INJUREDPARTY_NAME_14,@ACCIDENT_DATE_14,@INS_CLAIM_NUMBER_14,
			@PROVIDER_NAME_15,@BALANCE_15,@DATEOFSERVICE_START_15,@DATEOFSERVICE_END_15,@INJUREDPARTY_NAME_15,@ACCIDENT_DATE_15,@INS_CLAIM_NUMBER_15,
			@PROVIDER_NAME_16,@BALANCE_16,@DATEOFSERVICE_START_16,@DATEOFSERVICE_END_16,@INJUREDPARTY_NAME_16,@ACCIDENT_DATE_16,@INS_CLAIM_NUMBER_16,
			@PROVIDER_NAME_17,@BALANCE_17,@DATEOFSERVICE_START_17,@DATEOFSERVICE_END_17,@INJUREDPARTY_NAME_17,@ACCIDENT_DATE_17,@INS_CLAIM_NUMBER_17,
			@PROVIDER_NAME_18,@BALANCE_18,@DATEOFSERVICE_START_18,@DATEOFSERVICE_END_18,@INJUREDPARTY_NAME_18,@ACCIDENT_DATE_18,@INS_CLAIM_NUMBER_18,
			@PROVIDER_NAME_19,@BALANCE_19,@DATEOFSERVICE_START_19,@DATEOFSERVICE_END_19,@INJUREDPARTY_NAME_19,@ACCIDENT_DATE_19,@INS_CLAIM_NUMBER_19,
			@PROVIDER_NAME_20,@BALANCE_20,@DATEOFSERVICE_START_20,@DATEOFSERVICE_END_20,@INJUREDPARTY_NAME_20,@ACCIDENT_DATE_20,@INS_CLAIM_NUMBER_20



			select top 1 *
			from  LCJ_VW_CaseSearchDetails_RTF 
			LEFT OUTER JOIN @tblPacketInfoInOneRow ON PACKETID =PACKET_ID
			where LCJ_VW_CaseSearchDetails_RTF.case_id = @s_a_case_id AND DomainId = @DomainId
		END
		ELSE
			select top 1 *  from  LCJ_VW_CaseSearchDetails_RTF 
			LEFT OUTER JOIN @tblPacketInfoInOneRow ON PACKETID =PACKET_ID
			where LCJ_VW_CaseSearchDetails_RTF.case_id = @s_a_case_id AND DomainId = @DomainId
	END
	ELSE IF(@i_a_type = 1)
	BEGIN
		--SELECT UPPER(COLUMN_NAME) AS COLUMN_NAME FROM MST_TEMPLATES_COLUMN
		SELECT DISTINCT UPPER(COLUMN_NAME) AS COLUMN_NAME FROM MST_TEMPLATES_COLUMN
--INNER Join MST_TEMPLATES ON [SZ_TEMPLATE_NAME] like '%king%'
	END

		
		--SELECT TOP 500 UPPER(COLUMN_NAME) COLUMN_NAME FROM INFORMATION_SCHEMA.Columns where TABLE_NAME = 'LCJ_VW_CaseSearchDetails_RTF'
END



GO
