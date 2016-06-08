---Exchange Rate


select * from #tempFIN_Exchange_Rate

select * from MFA_FOMS_3T..vw_Exchange_Rate_Master

select * from MFA_FOMS..vw_Exchange_Rate_Master

SELECT * FROM ( 
SELECT Code AS Currency_Code, CAST(Date AS datetime) AS Date, SGDperUnit AS SGD_per_Unit, UnitperSGD AS Unit_per_SGD, ImportedDate As Imported_Date 
FROM vw_Exchange_Rate_Master  WHERE Date>='29 Feb 2016' AND Date<'01 Mar 2016'
) TBL ORDER BY [Date] DESC


select * from MFA_FOMS_3T..vw_Exchange_Rate_Master 
WHERE Date>='25 Feb 2016' AND Date<'27 Feb 2016'

update FIN_Exchange_Rate
SET Date = '2016-02-29' 
WHERE UnitperSGD = '4' AND SGDperUnit = '0.25' and Code = 'AAA'

update FIN_Exchange_Rate
SET Date = '2016-02-26' 
WHERE UnitperSGD = '4' AND SGDperUnit = '0.25' and Code = 'AAA'

select * into #tempFIN_Exchange_Rate from dbo.FIN_Exchange_Rate

SELECT * from dbo.FIN_Exchange_Rate

select * from #tempUserGroupModule

insert into MFA_FOMS..FIN_Exchange_Rate
(Code,Date,SGDperUnit,UnitperSGD,ImportedDate)
 (select Code,Date,SGDperUnit,UnitperSGD,ImportedDate  from #tempFIN_Exchange_Rate
 where Code = 'AAA')



