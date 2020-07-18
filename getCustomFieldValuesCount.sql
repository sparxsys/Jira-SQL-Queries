select * from customfield order by cfname asc
select * from customfieldvalue

select 
	customfield.id, customfield.cfname, count(*) 
from customfield left join customfieldvalue 
on customfield.id = customfieldvalue.customfield
group by customfield.id
order by count(*) desc
