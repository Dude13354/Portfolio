/*�������� ������� "�������" � ������ "����� �������(PK), �������, ���, ��������, ����� ��������, ����� ��������, �������,  ���� ��������"*/
CREATE TABLE Clients
(
    id int not null CONSTRAINT PK_Clients PRIMARY KEY,
    Surname VARCHAR (255) NOT NULL,
    Name VARCHAR (255) NOT NULL,
    Patronymic VARCHAR (255) DEFAULT '-',
	The_passport_series INTEGER NOT NULL,
	Passport_number INTEGER NOT NULL,
    Telephone VARCHAR (11) NOT NULL,    
    Date_of_birthday DATE NOT NULL
);
/*�������� ������� "������ �� ������" � ������ "����� ������ (PK), �������� ������, �������������, ��������, ���� �������, ���� �������, ����������, ����� �� ����������"*/
CREATE TABLE Products_in_stock
(
    id int not null CONSTRAINT PK_Products_in_stock PRIMARY KEY,
    Name VARCHAR (255) NOT NULL,
	Manufacturer VARCHAR(255) NOT NULL,
	Description VARCHAR (255) NOT NULL,
	Purshase_value INTEGER NOT NULL,
	Cost_for_sale INTEGER NOT NULL,
	Count INTEGER NOT NULL,
	Do_i_need_to_re_order VARCHAR (30) NOT NULL
);
/*�������� ������� "���������" � ������ "����� ��������� (PK), ��������, �������� ���������, �����������, �������� ���������"*/
CREATE TABLE Positions
(
    id int not null CONSTRAINT PK_Positions PRIMARY KEY,
    Salary INTEGER NOT NULL,
	Name VARCHAR (255) NOT NULL,
	Duties VARCHAR (255) NOT NULL,
	Description VARCHAR (255) NOT NULL
);
/*�������� ������� "���������"  � ������ "����� ��������� (PK), �������, ���, ��������, ����� ��������, ����� ��������, ��������, �������, ����� ���������"*/
CREATE TABLE Workers
(
    id int not null CONSTRAINT PK_Workers PRIMARY KEY,
	Surname VARCHAR (255) NOT NULL,
    Name VARCHAR (255) NOT NULL,
    Patronymic VARCHAR (255) DEFAULT '-',
	The_passport_series INTEGER NOT NULL,
	Passport_number INTEGER NOT NULL,
	Residence VARCHAR(255) NOT NULL,
	Telephone VARCHAR (11) NOT NULL,
	id_Positions INTEGER NOT NULL references Positions(id)

);
/*�������� ������� "����� ����" � ������ "����� ������ (PK), �������� ������, ����, ����� �������� �� ������"*/
CREATE TABLE Price_list
(
    id int not null CONSTRAINT PK_Price_list PRIMARY KEY,
	Name_of_the_operation VARCHAR (255) NOT NULL,
	Price INTEGER NOT NULL,
	id_Product_in_stock INTEGER NOT NULL references Products_in_stock(id)
);
/*�������� ������� "������" � ������ "����� ������ (PK), ��������, �������� ��� �������, ����� ������, ������ ������, ��������� ���������, ���� ������ �������, ����� ����������, ����� ������, ����� ���������"*/
CREATE TABLE Orders
(
    id int not null CONSTRAINT PK_Orders PRIMARY KEY,
    Discription VARCHAR (255) NOT NULL,
    Spare_parts_for_repairs VARCHAR (255) NOT NULL,
    Car_number VARCHAR (255) NOT NULL,
	Car_model VARCHAR (255) NOT NULL,
	Finnaly_cost INTEGER NOT NULL,
	Service_start_date DATE NOT NULL,
	id_Worker INTEGER NOT NULL references Workers(id),
	id_Ongoing_operation INTEGER NOT NULL references Price_list(id),
	id_Owner INTEGER NOT NULL references Clients(id)
);



/*�������� ��������-�������������� ��� ������� "�������"*/
CREATE SEQUENCE sq_Clients start with 1;

CREATE or REPLACE TRIGGER tg_Clients
before insert on Clients
for each row
begin
select sq_Clients.nextval
into :new.id
from dual;
end;
/*�������� ��������-�������������� ��� ������� "������ �� ������"*/
CREATE SEQUENCE sq_Products_in_stock start with 1;

CREATE or REPLACE TRIGGER tg_Products_in_stock
before insert on Products_in_stock
for each row
begin
select sq_Products_in_stock.nextval
into :new.id
from dual;
end;
/*�������� ��������-�������������� ��� ������� "���������"*/
CREATE SEQUENCE sq_Positions start with 1;

CREATE or REPLACE TRIGGER tg_Positions
before insert on Positions
for each row
begin
select sq_Positions.nextval
into :new.id
from dual;
end;
/*�������� ��������-�������������� ��� ������� "���������"*/
CREATE SEQUENCE sq_Workers start with 1;

CREATE or REPLACE TRIGGER tg_Workers
before insert on Workers
for each row
begin
select sq_Workers.nextval
into :new.id
from dual;
end;
/*�������� ��������-�������������� ��� ������� "����� ����"*/
CREATE SEQUENCE sq_Price_list start with 1;

CREATE or REPLACE TRIGGER tg_Price_list
before insert on Price_list
for each row
begin
select sq_Price_list.nextval
into :new.id
from dual;
end;
/*�������� ��������-�������������� ��� ������� "������"*/
CREATE SEQUENCE sq_Orders start with 1;

CREATE or REPLACE TRIGGER tg_Orders
before insert on Orders
for each row
begin
select sq_Orders.nextval
into :new.id
from dual;
end;


/*�������� ��������� ���������� ��� ������� "�������"*/
create or replace procedure Clients_insert( surname in varchar, name in varchar, patronymic in varchar, the_passport_series in int, passport_number in int, telephone in varchar , date_of_birthday in date)
is
begin
    insert into Clients (Surname, Name, Patronymic, The_passport_series, Passport_number, Telephone, Date_of_birthday)
    values (surname, name, patronymic, the_passport_series, passport_number, telephone, date_of_birthday);
commit;
end;

begin
Clients_insert ('�����','������','���������',123123,31312312,'89684223232','02.04.2005');
end;
select*from Clients;

/*�������� ��������� �������� ��� ������� "�������"*/
create or replace procedure Clients_delete(p_id in int)
is
begin
    delete from Clients
    where
    id = p_id;
commit;
end;

begin
Clients_delete (10);
end;
select*from Clients;

/*�������� ��������� ��������� ��� ������� "�������"*/
create or replace procedure Clients_update(surname in varchar, name in varchar, patronymic in varchar, the_passport_series in int, passport_number in int, telephone in varchar , date_of_birthday in date, p_id in int)
is
begin
    update Clients set
        Surname = surname,
        Name = name,
        Patronymic = patronymic,
        The_passport_series = the_passport_series,
        Passport_number = passport_number,
        Telephone = telephone,
		Date_of_birthday = date_of_birthday 
        where
        id = p_id;
commit;
end;







/*�������� ��������� ���������� ��� ������� "�������"*/
create or replace procedure Orders_insert( discription in varchar, spare_parts_for_repairs in varchar, car_number in varchar, car_model in varchar, finnaly_cost in int, service_start_date in date , id_worker in int, id_ongoing_operation in int, id_owner in int)
is
begin
    insert into Orders (Discription, Spare_parts_for_repairs, Car_number, Car_model, Finnaly_cost, Service_start_date, id_Worker, id_Ongoing_operation, id_Owner)
    values (discription, spare_parts_for_repairs, car_number, car_model, finnaly_cost, service_start_date, id_worker, id_ongoing_operation, id_owner);
commit;
end;
begin
Orders_insert ('��������� ������','���������','v345rt','Lada',120000,'01.01.2001',1,2,3);
end;
begin
Orders_insert ('��������� ������','���������','v345rt','BMW',150000,'01.01.2004',2,2,3);
end;
begin
Orders_insert ('��������� ������','���������','v345rt','WAZ',12000,'01.01.2001',3,2,3);
end;
select*from Orders;

/*�������� ��������� �������� ��� ������� "�������"*/
create or replace procedure Orders_delete(p_id in int)
is
begin
    delete from Orders
    where
    id = p_id;
commit;
end;
/*�������� ��������� ��������� ��� ������� "�������"*/
create or replace procedure Orders_update(discription in varchar, spare_parts_for_repairs in varchar, car_number in varchar, car_model in varchar, finnaly_cost in int, service_start_date in date , id_worker in int, id_ongoing_operation in int, id_owner in int, p_id in int)
is
begin
    update Orders set
        Discription = discription,
        Spare_parts_for_repairs = spare_parts_for_repairs,
        Car_number = car_number,
        Car_model = car_model,
        Finnaly_cost = finnaly_cost,
        Service_start_date = service_start_date,
		id_Worker = id_worker,
		id_Ongoing_operation = id_ongoing_operation,
		id_Owner = id_owner
		
        where
        id = p_id;
commit;
end;









/*�������� ��������� ���������� ��� ������� "����������"*/
create or replace procedure Workers_insert( surname in varchar, name in varchar, patronymic in varchar, passport_number in int, the_passport_series in int,residence in varchar, telephone in varchar , id_positions in int)
is
begin
    insert into Workers (Surname , Name , Patronymic , Passport_number , The_passport_series ,Residence , Telephone, id_Positions)
    values (surname , name , patronymic , passport_number , the_passport_series ,residence , telephone, id_positions);
commit;
end;
begin
Workers_insert ('�������', '���������', '����������',23252,132423,'�������','89684673434',1);
end;
begin
Workers_insert ('�����', '���������', '����������',2324452,1324343,'����','89684173434',2);
end;
begin
Workers_insert ('�����m', '������', '����������',238552,137423,'�������','89684673634',3);
end;
select*from Workers;
/*�������� ��������� �������� ��� ������� "����������"*/
create or replace procedure Workers_delete(p_id in int)
is
begin
    delete from Workers
    where
    id = p_id;
commit;
end;
begin
Workers_delete (6);
end;
/*�������� ��������� ��������� ��� ������� "����������"*/
create or replace procedure Workers_update(surname in varchar, name in varchar, patronymic in varchar, passport_number in int, the_passport_series in int,residence in varchar, telephone in varchar , id_positions in int ,p_id in int)
is
begin
    update Workers set
         Surname = surname,
        Name = name,
        Patronymic = patronymic,
        Passport_number = passport_number,
        The_passport_series = the_passport_series,
        Residence = residence,
        Telephone = telephone,
		id_Positions = id_positions 
		
        where
        id = p_id;
commit;
end;
begin
Workers_update ('��������', '���������', '����������',238552,137423,'�������','89684673634',3,5);
end;
select*from Workers;



/*�������� ��������� ���������� ��� ������� "���������"*/
create or replace procedure Positions_insert( salary in int, name in varchar, duties in varchar, description in varchar)
is
begin
    insert into Positions (Salary , Name , Duties , Description )
    values (salary , name , duties , description );
commit;
end;

begin
Positions_insert (20000, '��������', '������ � �����������','������� ���� 8 ����� �������� ������� � �������');
end;
begin
Positions_insert (20000, '�������', '������ ��� ��������','������� ���� 8 ����� �������� ������� � �������');
end;
begin
Positions_insert (20000, '�������������', '������ � �����������','������� ���� 8 ����� �������� ������� � �������');
end;
select*from Positions;
/*�������� ��������� �������� ��� ������� "���������"*/
create or replace procedure Positions_delete(p_id in int)
is
begin
    delete from Positions
    where
    id = p_id;
commit;
end;
/*�������� ��������� ��������� ��� ������� "���������"*/
create or replace procedure Positions_update( salary in int, name_ in varchar, duties in varchar, description_ in varchar,p_id in int)
is
begin update Positions set Salary = salary,Name=name_,Duties=duties,Description = description_ where id = 3;

commit;
end;
begin
Positions_update (20000, '�������������', '������ ','������� ���� 8 ����� �������� ������� � �������',2);
end;
select*from Positions;



/*�������� ��������� ���������� ��� ������� "����� ����"*/
create or replace procedure Price_list_insert( name_of_operation in varchar, price in int, id_product_in_stock in int)
is
begin
    insert into Price_list (Name_of_the_operation , Price , id_Product_in_stock )
    values (name_of_operation , price , id_product_in_stock );
commit;
end;
begin
Price_list_insert ('������ ���������', 30000, 1);
end;
begin
Price_list_insert ('������ ���������', 56000, 2);
end;
begin
Price_list_insert ('������ ���������', 67000, 3);
end;
select*from Price_list;
/*�������� ��������� �������� ��� ������� "����� ����"*/
create or replace procedure Price_list_delete(p_id in int)
is
begin
    delete from Price_list
    where
    id = p_id;
commit;
end;
/*�������� ��������� ��������� ��� ������� "����� ����"*/
create or replace procedure Price_list_update(name_of_the_operation in varchar, price in int, id_product_in_stock in int,p_id in int)
is
begin
    update Price_list set
         Name_of_the_operation = name_of_the_operation,
        Price = price,
        id_Product_in_stock = id_product_in_stock
        
        where
        id = p_id;
commit;
end;
begin
Price_list_update ('������ ���������', 35000, 1,1);
end;







/*�������� ��������� ���������� ��� ������� "������ �� ������"*/
create or replace procedure Products_in_stock_insert( name in varchar, manufacturer in varchar , description in varchar, purshase_value in int,cost_for_sale in int,count in int,do_i_need_to_re_order in varchar)
is
begin
    insert into Products_in_stock (Name , Manufacturer  , Description , Purshase_value ,Cost_for_sale ,Count ,Do_i_need_to_re_order )
    values (name , manufacturer  , description , purshase_value ,cost_for_sale ,count ,do_i_need_to_re_order );
commit;
end;
begin
Products_in_stock_insert ('���������', 'BMW', '��������� ����������� ��������',20000,1,25000,'���');
end;
begin
Products_in_stock_insert ('���������', 'Lada', '��������� ����������� ��������',21000,4,25000,'���');
end;
begin
Products_in_stock_insert ('���������', 'Reno', '��������� ����������� ��������',22000,6,25000,'���');
end;
select*from Products_in_stock;
/*�������� ��������� �������� ��� ������� "������ �� ������"*/
create or replace procedure Product_in_stock_delete(p_id in int)
is
begin
    delete from Product_in_stock
    where
    id = p_id;
commit;
end;
/*�������� ��������� ��������� ��� ������� "������ �� ������"*/
create or replace procedure Product_in_stock_update(name in varchar, manufacturer in varchar , description in varchar, purchase_value in int,cost_for_sale in int,count in int,do_i_need_to_re_order in varchar, id = p_id)
is
begin
    update Product_in_stock set
         Name = name,
        Manufacturer = manufacturer,
        Description = description,
        Purchase_value = purchase_value,
        Cost_for_sale = cost_for_sale,
        Do_i_need_to_re_order = do_i_need_to_re_order
        where
        id = p_id;
commit;
end;




/*�������� ������������� � ���������: ������, �������,����� ����,���������*/
create or replace view O_W_C_P
as
select Ord.Discription , Ord.Spare_parts_for_repairs , Ord.Car_number, Ord.Car_model, Ord.Finnaly_cost , Ord.Service_start_date , C.Telephone, C.Name , P.Name_of_the_operation,P.Price
From Orders Ord, Workers W, Clients C, Price_list P WHERE  W.id = ord.id_Worker  ; 
select*from o_w_c_p;

/*�������� ������������� � ���������: ����� ����,������ �� ������*/
create or replace view Price_list_Products_in_stock
as
select  P.Name_of_the_operation,P.Price , Pr.Name,pr.description,pr.manufacturer
From Products_in_stock Pr, Price_list P WHERE Pr.id = p.id_product_in_stock;
select*from price_list_products_in_stock;

/*�������� ������������� � ���������: ���������, ���������*/
create or replace view Workers_Positions
as
select  W.Name, W.Residence,W.Telephone , P.Salary, P.Duties,P.Description
From Workers W, Positions P WHERE P.id = w.id_positions;
select*from Workers_Positions;




/*�������� ������� �������� ������ ���������� ��������*/
create or replace function count_of_clients return int is Answers int;
begin
select count (id) into Answers from clients;
return Answers;
end;

select count_of_clients from Clients;

/*�������� ������� �������� ������ ���������� �����������*/
create or replace function count_of_workers return int is Answers int;
begin
select count (id) into Answers from Workers;
return Answers;
end;

select count_of_workers from Workers;

/*�������� ������� �������� ������ ���������� �������*/
create or replace function count_of_orders return int is Answers int;
begin
select count (id) into Answers from Orders;
return Answers;
end;

select count_of_orders from Orders;





INSERT INTO Positions(id, Salary,Name,Duties,Description) VALUES (2,20000,'�������','������� � ���� ����','6-�� ������� ������� ����');
select*from Positions;
INSERT INTO Positions(id, Salary,Name,Duties,Description) VALUES (8,20000,'�������','������� � ���� ����','6-�� ������� ������� ����');
select*from Positions;
INSERT INTO Price_list(Name_of_the_operation,Price,id_Product_in_stock) VALUES ('��������� ���������',400000,2);
select*from Price_list;
INSERT INTO Price_list(Name_of_the_operation,Price,id_Product_in_stock) VALUES ('��������� ���������',400000,150);
select*from Price_list;
delete  from Price_list where id = 6;
INSERT INTO Price_list(Name_of_the_operation,Price,id_Product_in_stock) VALUES (100,400000,2);
select*from Price_list;
INSERT INTO Price_list(Name_of_the_operation,Price,id_Product_in_stock) VALUES ('����������','egwewg',2);
select*from Price_list;
INSERT INTO Price_list(Name_of_the_operation,Price,id_Product_in_stock) VALUES ('����������','egw�2423ewg',2);
select*from Price_list;