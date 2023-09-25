drop user hrf cascade
/
create user hrf identified by hrf
/
grant dba to hrf
/
conn hrf/hrf
/
create table employee
(
	empid nvarchar2(10) constraint empidpk1 primary key,constraint empidpk2 check(empid like 'E___'),
	ename nvarchar2(30),
	fname nvarchar2(30),
	aadhar nvarchar2(20),
	dob nvarchar2(20),
	address nvarchar2(50),
	contact nvarchar2(20),
	email nvarchar2(30),
	gender nvarchar2(10),
	marital_status nvarchar2(20),
	bsalary nvarchar2(6),
	doj nvarchar2(20),
	design nvarchar2(20),
	deptt nvarchar2(40)
)
/
create table attendance 
(
	empid nvarchar2(10) constraint empidfk1 references employee(empid) on delete cascade,
	name nvarchar2(30),
	present nvarchar2(20),
	month nvarchar2(10),
	yr nvarchar2(10),
	days nvarchar2(10),
	status nvarchar2(20)
)
/
create table salary
(
	empid nvarchar2(10) constraint empidfk2 references employee(empid) on delete cascade,
	bsalary nvarchar2(6),
	curr_salary nvarchar2(6),
	deduction nvarchar2(5),
	allowance nvarchar2(30),
	netpay nvarchar2(6),
	otherpay nvarchar2(6)
)
/
create table deduction
(
	empid nvarchar2(10) constraint empidfk3 references employee(empid) on delete cascade,
	name nvarchar2(30),
	ded_allo nvarchar2(40),
	date1 nvarchar2(20)
)
/
create table student 
(
	regno nvarchar2(20) constraint regnopk1 primary key,constraint regnopk2 check(regno like 'R___'),
	name nvarchar2(30),
	fname nvarchar2(30),
	phone nvarchar2(20),
	address nvarchar2(60),
	program nvarchar2(40),
	current_sem nvarchar2(10),
	section nvarchar2(10),
	status nvarchar2(20),
	enroll_dt nvarchar2(20)
)
/
create table fees_payment
(
	id nvarchar2(10) constraint feeidpk1 primary key, constraint feeidpk2 check(id like 'F___'),
	regno nvarchar2(20) constraint regnofk1 references student(regno) on delete cascade,
	issue_dt nvarchar2(20),
	confirm nvarchar2(10),
	paid_by nvarchar2(30),
	paid_for nvarchar2(40),
	amt nvarchar2(8),
	balance nvarchar2(8),
	semester nvarchar2(10),
	total_amt nvarchar2(8),
	bank_name nvarchar2(30),
	receipt nvarchar2(30),
	challan nvarchar2(40),
	session1 nvarchar2(10),
	status nvarchar2(10)
)
/
create table fee
(
	id nvarchar2(10) constraint feeidfk1 references fees_payment(id) on delete cascade,
	date1 nvarchar2(20),
	session1 nvarchar2(10),
	semester nvarchar2(10),
	admission nvarchar2(20),
	security nvarchar2(10),
	library nvarchar2(10),
	late nvarchar2(10),
	progid nvarchar2(10),
	reapire nvarchar2(10)
)
/
create table program
(
	id nvarchar2(10) constraint feeidfk2 references fees_payment(id) on delete cascade,
	name nvarchar2(30),
	semester nvarchar2(15),
	dt nvarchar2(20),
	progid nvarchar2(10) constraint progidpk1 primary key,
	constraint progidpk2 check(progid like 'P___')
)
/
create table reciveable
(
	program nvarchar2(30)  constraint progidfk2 references program(progid) on delete cascade,
	session1 nvarchar2(20),
	first_sem nvarchar2(5),	
	second_sem nvarchar2(5),
	third_sem nvarchar2(5),
	fourth_sem nvarchar2(5),
	fifth_sem nvarchar2(5),
	sixth_sem nvarchar2(5), 
	seven_sem nvarchar2(5),
	eight_sem nvarchar2(5),
	total nvarchar2(8)
)
/
create table scholarship
(
	sch_amt nvarchar2(8),
	program nvarchar2(40) constraint progidfk1 references program(progid) on delete cascade,
	session1 nvarchar2(20),
	descr nvarchar2(100),
	date1 nvarchar2(20)
)
/
