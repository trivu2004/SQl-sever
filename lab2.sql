use master;
create database MyTest;
use MyTest;

create table Events(
	ID int identity(1,1) primary key not null,
	EventName nvarchar(100),
	EventDate DateTime,
);

alter table Events
add NumberofTicket smallint;

use master;
drop database MyTest;