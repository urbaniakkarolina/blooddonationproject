drop database blood_donation_centre;
create database blood_donation_centre;
use blood_donation_centre;

create table facilities (
	rckik_name varchar(255) not null,
	address varchar(255) not null,
	post_code char(6) not null,
	city varchar(255) not null,
	phone_number varchar(45) not null,
	website varchar(255) not null,
	fulltext(rckik_name, address, post_code, city, phone_number, website)
);

create table blood_types (
    id int not null auto_increment primary key,
    type enum('0', 'A', 'B', 'AB'),
    rhd enum('+ (plus)', '- (minus)')
);

load data infile 'C:/Users/urban/Desktop/VIsemestr/technologie-sieciowe-lab/lista5/eng_facilities.csv'
into table facilities
fields terminated by ';'
optionally enclosed by '"'
lines terminated by '\r\n'
ignore 1 lines;

load data infile 'C:/Users/urban/Desktop/VIsemestr/technologie-sieciowe-lab/lista5/blood_types.csv'
into table blood_types
fields terminated by ';'
optionally enclosed by '"'
lines terminated by '\r\n'
ignore 1 lines;

alter table facilities add column id int not null auto_increment primary key first;
-- alter table coffee add fulltext(country, region, manufacturer, variety);


create table blood_bank_stocks (
    facility_id int,
	blood_type_id int,
	amount_of_blood int,
	foreign key (facility_id) references facilities(id),
	foreign key (blood_type_id) references blood_types(id)
);