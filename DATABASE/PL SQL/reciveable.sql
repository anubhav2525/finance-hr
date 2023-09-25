create or replace trigger bireciveable before insert on reciveable for each row
declare
begin
	if(   :new.program is NULL or
            :new.session1 is NULL or
	      :new.First_sem is NULL or
		:new.second_sem is NULL or
		:new.third_sem is NULL or 
		:new.fourth_sem is NULL or
		:new.fifth_sem is NULL or
		:new.sixth_sem is NULL or
		:new.seven_sem is NULL or
		:new.eight_sem is NULL or 
		:new.total is NULL
	)then
	raise_application_error(-20008,'ALL FIELDS ARE REQUIRE TO FILL !!!');
	end if;
end;
/ 