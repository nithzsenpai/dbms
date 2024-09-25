create table product(productid int(4),productcode varchar(255),name varchar(255),quantity int(5),price decimal(9,2));
desc product;
insert into product values(1,'pen','redpen',2000,1.2);
insert into product values(2,'pen','blackpen',1000,2.9);
insert into product1 values(3,'pencil','bluepen',3000,3.9);
alter table product add discount int(4);
alter table product rename column discount to loss;
alter table product rename to product1;
alter table product1 drop column loss;
delete from product1 where productid=2;
select*from product1;


