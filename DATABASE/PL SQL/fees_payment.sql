create or replace trigger bifees_payment before insert on fees_payment for each row
declare 
begin
if(:new.regno is NULL or 
:new.issue_dt is NULL or 
:new.confirm is NULL or
:new.paid_by is NULL or 
:new.paid_for is NULL or
:new.amt is NULL or 
:new.balance is NULL or
:new.semester is NULL or
:new.total_amt is NULL or
:new.bank_name is NULL or
:new.receipt is NULL or
:new.challan is NULL or
:new.session1 is NULL or
:new.status is NULL
)
then 
raise_application_error(-20006,'ALL FIELDS ARE REQUIRE TO FILL');
end if;
end;
/