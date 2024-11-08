
create database bank1;
use bank1;
create table branch(branchname varchar(20),branchcity varchar(10),assets float(20),primary key(branchname));
create table bankaccount(accno int(10),branchname varchar(20),balance float(20),primary key(accno),foreign key(branchname) references branch(branchname));
create table bankcustomer(custoname varchar(10),custostreet varchar(10),custocity varchar(20),primary key(custoname));
create table depositer(custoname varchar(10),accno int(10),foreign key(custoname) references bankcustomer(custoname),foreign key(accno) references bankaccount(accno));
create table loan(loan_no int(10),branchname varchar(20),amount float(20),foreign key (branchname) references branch(branchname));

insert into branch values('sbichamraj','bang',50000);
insert into branch values('sbiresidency','bang',10000);
insert into branch values('sbishivaji','bombay',20000);
insert into branch values('sbiparliament','delhi',10000);
insert into branch values('sbijantar','delhi',20000);

insert into bankaccount values(1,'sbichamraj',2000);
insert into bankaccount values(2,'sbiresidency',5000);
insert into bankaccount values(2,'sbiresidency',6000);
insert into bankaccount values(4,'sbiparliament',9000);
insert into bankaccount values(5,'sbijantar',8000);
insert into bankaccount values(3,'sbishivaji',6000);
select * from bankaccount;

insert into bankcustomer values('avi','bulltemp','bang');
insert into bankcustomer values('din','banner','bang');
insert into bankcustomer values('mohan','national','bang');
insert into bankcustomer values('nikil','akbar','delhi');
insert into bankcustomer values('ravi','prithivi','delhi');
insert into depositer values('avi',1);
insert into depositer values('din',2);
insert into depositer values('mohan',4);
insert into depositer values('nikil',9);
insert into depositer values('ravi',5);
insert into depositer values('avi',1);
insert into depositer values('din',2);

insert into loan values(1,'sbichamraj',1000);
insert into loan values(2,'sbiresidency',2000);
insert into loan values(3,'sbishivaji',3000);
insert into loan values(4,'sbiparliament',4000);
insert into loan values(5,'sbijantar',5000);

alter table branch rename column assets to assets_in_lakhs;
select branchname,(assets_in_lakhs/100000) from branch;

select custoname,accno,branchname, from depositer d ,bankaccount b where b.branchname='sbichamaraj' group by d.custoname,b.accno,b.branchname having count(d.accno)>=2;



select distinct(d.custoname) from branch b,depositer d ,bankaccount a where d.accno=a.accno and b.branchcity="bang" group by d.custoname having count(distinct (a.branchname))=
(select count(distinct (branchname)) from branch where branchcity="bang");


