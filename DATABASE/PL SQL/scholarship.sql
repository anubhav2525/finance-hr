create or replace trigger bischolarship before insert on scholarship for each row
declare
begin
	if(   :new.sch_amt is NULL or
		:new.program is NULL or
		:new.session1 is NULL or
		:new.descr is NULL or
		:new.date1 is NULL 
	  )then
	raise_application_error(-20009,'ALL FIELDS ARE REQUIRE TO FILL !!!');
	end if;
end;
/