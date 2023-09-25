create or replace trigger bistudent before insert on student for each row
declare
begin
if(:new.name is NULL or :new.fname is NULL or :new.phone is NULL or :new.address is NULL or :new.program is NULL or :new.current_sem is NULL or :new.section is NULL or :new.status is NULL or :new.enroll_dt is NULL)
then 
raise_application_error(-20005,'ALL FIELDS ARE REQUIRE TO FILL !!!');
end if;
end;
/