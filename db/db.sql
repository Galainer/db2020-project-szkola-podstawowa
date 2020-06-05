CREATE DATABASE IF NOT EXISTS szkola_podstawowa_db;
create user if not exists administrator identified by 'Zaq12wsx';
grant all privileges on szkola_podstawowa_db.* to administrator;

use szkola_podstawowa_db;

drop table if exists `uczen`;
create table `uczen` (
	`uczen_id` int not null auto_increment,
    `imie` varchar(50) not null,
    `nazwisko` varchar(50) not null,
    `nr_telefonu` varchar(11) not null,
    `pesel` varchar(11) not null,
    `email` varchar(100) not null,
	`klasa_id` int not null, #fk_klasa
    constraint primary key(`uczen_id`) 
);

drop table if exists `ocena`;
create table `ocena`(
	`ocena_id` int not null auto_increment,
    `wartosc` enum ('1.0','2.0','2.5','3.0', '3.5', '4.0', '4.5', '5.0') NOT NULL,
	`waga` int not null,
    `uczen_id` int not null, #fk_uczen
    `przedmiot_id` int not null, #fk_przedmiot
	constraint primary key(`ocena_id`)
);



