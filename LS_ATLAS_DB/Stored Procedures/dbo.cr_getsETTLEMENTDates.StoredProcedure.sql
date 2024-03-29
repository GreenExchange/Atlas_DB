USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[cr_getsETTLEMENTDates]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[cr_getsETTLEMENTDates](
@DomainId NVARCHAR(50),
@ins varchar(255),
@prov varchar(255),
@yr varchar(50),
@insgp varchar(10),
@prgp varchar(10)
)
as
begin

declare
@st nvarchar(2000),
@sttail nvarchar(2000),
@stbody nvarchar(1500)

set @st = 'select Year(Settlement_date) as YearSettled,Count(distinct Case_Id) as NoOfCases,Avg(datediff(d,date_opened,SETTLEMENT_DATE)) as AvgDaysSETTLED from lcj_vw_casesearchdetails where Settlement_Date is not null and DomainId = '+@DomainId+' '
set @sttail  = ' Group by year(settlement_date) order by year(settlement_date)'
set @stbody  = ''

if @prgp = 'set' and @prov <> 'ALL'
begin
set @stbody  = @stbody + ' and provider_groupname in (select provider_groupname from tblprovider where provider_id =  ' + @prov + ' and DomainId= '+@DomainId+') '
end
ELSE IF @prov <> 'ALL'
BEGIN 
set @stbody  = @stbody + ' and provider_id =  ' + @prov 
END

if @insgp  = 'set' AND @INS <> 'ALL'
begin
set @stbody  =@stbody +  ' and InsuranceCompany_groupname in (select InsuranceCompany_groupname from tblInsuranceCompany where Insurancecompany_id =  ' + @ins  + ' and DomainId = '+@DomainId+') '
end
ELSE IF @INS <> 'ALL'
BEGIN
set @stbody  = @stbody + ' and InsuranceCompany_id =  ' + @ins
END

if @yr <> 'ALL'
begin
set @stbody  = @stbody + ' and year(date_opened)=  ' + @yr
end

set @st = @st + @stbody + @sttail

--print @st
execute sp_executesql @st

end

GO
