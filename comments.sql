select actionbody from jiraaction where actionbody REGEXP '(?<=\[~).+?(?=\])';

select * from jiraaction

-- User [~ravisagar] and one more user [~abdul.m] Another one [~admin]

SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(actionbody, '[~', -1 - n.v),']', 1) AS users
FROM jiraaction 
JOIN (
         SELECT 0 v
       UNION ALL
         SELECT 1
         
       UNION ALL
         SELECT 2
       ) n
       where id = 10600


JOIN (
         SELECT 0 v
       UNION ALL
         SELECT 1
       ) n
       

drop procedure `jira`.`load_foo_test_data`
delimiter #
create procedure load_foo_test_data()
begin
declare v_max int unsigned default 10;
declare v_counter int unsigned default 0;
  -- start transaction;
  while v_counter < v_max do
	select v_counter;
	-- SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(actionbody, '[~', -(2 + v_counter)),']', 1) AS users FROM jiraaction where id = 10600; 
    set v_counter=v_counter+1;
  end while;
  -- commit;
end #
delimiter ;


CALL `jira`.`load_foo_test_data`();



SELECT 
  SUBSTR(actionbody, 
    LOCATE('~',actionbody)+1, 
      (CHAR_LENGTH(actionbody) - LOCATE('~',REVERSE(actionbody)) - LOCATE('~',actionbody))) 
FROM jiraaction
where id = 10600; 


select substr(actionbody,instr(actionbody,"[") + 1, instr(actionbody,"]")) as user from jiraaction




