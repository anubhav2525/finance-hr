create or replace trigger biemployee before insert on employee for each row 
declare
begin
	if(:new.ename is NULL or
		:new.fname is NULL or
		:new.aadhar is NULL or 
		:new.dob is NULL or
		:new.address is NULL or
		:new.contact is NULL or 
		:new.email is NULL or
		:new.gender is NULL or
		:new.marital_status is NULL or
		:new.bsalary is NULL or
		:new.doj is NULL or
		:new.design is NULL or
		:new.deptt is NULL)then
	raise_application_error(-20002,'ALL FIELDS MUST BE REQUIRED TO BE FILL !!!!');
	end if;
end;
/