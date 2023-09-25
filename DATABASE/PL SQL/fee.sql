create or replace trigger bifee before insert on fee for each row
declare
begin
if(:new.date1 is NULL or
 :new.session1 is NULL or
 :new.semester is NULL or
 :new.admission is NULL or
 :new.security is NULL or
 :new.library is NULL or
 :new.late is NULL or
 :new.progid is NULL or
 :new.reapire is NULL)
then 
raise_application_error(-20006,'ALL FIELDS ARE REQUIRE TO FILL!!!');
end if;
end;
/