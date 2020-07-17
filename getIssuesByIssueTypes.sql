
USE jira;

-- List of issue types
select * from issuetype order by pname;

-- List of all the issues
select * from jiraissue

-- List of issue types with the count of issues
select
	it.id as "Issue Type ID", 
	it.pname as "Issue Type",
	count(ji.issuetype) as "Number of Issues" 
from
	issuetype it 
left outer join
	jiraissue ji 
on
	it.id=ji.issuetype group by it.id
    order by count(ji.issuetype) asc ;
