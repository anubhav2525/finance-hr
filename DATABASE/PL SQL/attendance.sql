create or replace trigger biattendance before insert on attendance for each row
declare
begin
	if(:new.empid is NULL or
	   :new.name is NULL or
	:new.present is NULL or
	:new.month is NULL or
	:new.yr is NULL or
	:new.days is NULL or
	:new.status is NULL
	)then
	raise_application_error(-20003,'ALL FIELDS MUST BE REQUIRE TO FILL!!');
	end if;
end;
/