create or replace trigger bisalary before insert on salary for each row
declare
begin
if(:new.empid is NULL or
	:new.bsalary is NULL or
	:new.curr_salary is NULL or
	:new.deduction is NULL or
	:new.allowance is NULL or
	:new.netpay is NULL or
	:new.otherpay is NULL
  )then 
	raise_application_error(-20004,'ALL FIELDS ARE REQUIRED TO BE FILL !!!');
end if;
end;
/

