select * from fieldconfigscheme where FIELDID='issuetype'
select * from optionconfiguration


select FCS.id as "ITS ID", FCS.configname as "ITS Name", IT.id as "Issue Type ID", IT.pname as "Issue Type", 
CASE WHEN FCS.configname = 'Default Issue Type Scheme' THEN 0 ELSE CC.project END as "Project ID", 
CASE WHEN FCS.configname = 'Default Issue Type Scheme' THEN 'Global' ELSE P.pkey END as "Project Key", 
CASE WHEN FCS.configname = 'Default Issue Type Scheme' THEN 'Global' ELSE P.pname END as "Project Name" 
from 
	fieldconfigscheme FCS 
LEFT JOIN 
	optionconfiguration OC 
ON 
	FCS.id = OC.fieldconfig 
LEFT JOIN 
	issuetype IT 
on 
	OC.optionid = IT.id 
LEFT JOIN 
	configurationcontext CC 
on 
	CC.fieldconfigscheme = FCS.id 
LEFT JOIN 
	project P 
on 
	P.id = CC.project 
where FCS.fieldid='issuetype';