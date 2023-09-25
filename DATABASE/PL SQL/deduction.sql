create or replace trigger bideduction before insert on deduction for each row
declare
begin
	if(:new.empid is NULL or
	   :new.name is NULL or
	   :new.ded_allo is NULL or
	   :new.date1 is NULL )
	then
		raise_application_error(-20001,'ALL FIELDS MUST BE REQUIRED'); 
	end if;
end;
/