create or replace trigger biprogram before insert on program for each row
declare
begin
	if(:new.id is NULL or 
	   :new.name is NULL or
	   :new.semester is NULL or
	   :new.dt is NULL
	  )then
	raise_application_error(-20008,'ALL FIELDS ARE REQUIRE TO FILL !!!');
	end if;
end;
/