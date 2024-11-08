create database employee;
use employee;
create table project(pno int(4), ploc varchar(10),pname varchar(10), primary key(pno));
create table assigned(empno int(4),pno int(4),jobrole varchar(10),foreign key(empno) references employee(empno),foreign key (pno) references project(pno));
create table incentives(empno int(4),incentivedate date,incentiveamount int(10),primary key (incentivedate),foreign key (empno) references employee(empno));
create table employee(empno int(4),ename varchar(100), mgr_no int(4),hiredate date,sal int(10),deptno int(4),primary key(empno),foreign key(deptno) references dept(deptno));
create table dept(deptno int(4),dname varchar(10),dloc varchar(10),primary key(deptno));

show tables;
drop table assigned;
insert into project values(1,"bang","adam");
insert into project values(2,"bang","bella");
insert into project values(3,"hyd","cherry");
insert into project values(4,"mys","danny");
insert into project values(5,"delhi","emma");

insert into dept values(1,"cse","bang");
insert into dept values(2,"cse","bang");
insert into dept values(3,"ec","hyd");
insert into dept values(4,"chem","mys");
insert into dept values(5,"ec","delhi");


insert into employee values(1,"nithya",1000,'2024-07-21',10000,1);
insert into employee values(2,"ARU",1001,'2024-07-28',20000,2);
insert into employee values(3,"SHASHI",1002,'2024-05-03',20000,3);
insert into employee values(4,"NISH",1003,'2024-08-13',20000,3);
insert into employee values(5,"NAMS",1004,'2024-06-20',10000,3);


insert into incentives values(1,'2005-07-21',1000);
insert into incentives values(2,'2024-07-28',2000);
insert into incentives values(3,'2024-05-03',3000);
insert into incentives values(4,'2024-08-13',4000);
insert into incentives values(5,'2024-06-20',5000);

insert into assigned values(1,1,"designer");
insert into assigned values(2,2,"manager");
insert into assigned values(3,3,"gm");
insert into assigned values(4,4,"cm");
insert into assigned values(5,5,"ceo");

select e.empno from employee e inner join assigned a on e.empno=a.empno inner join project p on p.pno=a.pno where p.ploc in("bang","mys","delhi");

select e.empno from employee e left join incentivesi on e.empno=i.empno where i.empno is null;

select e.ename,e.empno,d.dname,a.jobrole,d.dloc,p.ploc from employee e inner join dept d on d.deptno=e.deptno inner join assigned a on e.empno=a.empno inner join project p on a.pno=p.pno where d.dloc=p.ploc;