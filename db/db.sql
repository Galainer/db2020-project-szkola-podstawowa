CREATE DATABASE IF NOT EXISTS szkola_podstawowa_db;
create user if not exists administrator identified by 'Zaq12wsx';
grant all privileges on szkola_podstawowa_db.* to administrator;

use szkola_podstawowa_db;

drop table if exists `osoba`;
create table `osoba` (
	`osoba_id` int not null auto_increment,
    `imie` varchar(50) not null,
    `nazwisko` varchar(50) not null,
    `nr_telefonu` varchar(11) not null,
    `pesel` varchar(11) not null,
    `email` varchar(100) not null,
	`klasa_id` int not null, #fk_klasa
    `zajecia_id` int, #fk_zajecia - charakterysytczne dla nauczyciela
    `uczen_id` int, #fk_osoba -> id_ucznia -> charakterysytyczne dla rodzica
    constraint primary key(`osoba_id`) 
);

drop table if exists `klasa`;
create table `klasa`(
	`klasa_id` int not null auto_increment,
    `rok` int not null,
    `numer` varchar(10) not null,
    constraint primary key(`klasa_id`)
);

drop table if exists `ocena`;
create table `ocena`(
	`ocena_id` int not null auto_increment,
    `wartosc` enum ('1.0','2.0','2.5','3.0', '3.5', '4.0', '4.5', '5.0') NOT NULL,
	`waga` int not null,
    `osoba_id` int not null, #fk_uczen
    `przedmiot_id` int not null, #fk_przedmiot
	constraint primary key(`ocena_id`)
);

drop table if exists `przedmiot`;
create table `przedmiot`(
	`przedmiot_id` int not null auto_increment,
    `nazwa_przedmiotu` varchar(50) not null,
    `grupa_przedmiotowa_id` int not null,
    constraint primary key(`przedmiot_id`)
);

drop table if exists `zajecia`;
create table `zajecia`(
	`zajecia_id` int not null auto_increment,
    `dzien` enum ('Poniedzialek','Wtorek','Sroda','Czwartek','Piatek') not null,
    `godzina_start` time not null,
    `godzina_koniec` time not null,
    `osoba_id` int not null, #fk_nauczyciel
    `klasa_id` int not null, #fk_klasa
    `przedmiot_id` int not null, #fk_przedmiot
    `sala_id` int not null, #fk_klasa
    constraint primary key(`zajecia_id`)
    );
    
drop table if exists `sala`;
create table `sala`(
	`sala_id` int not null auto_increment,
    `numer` int not null,
    constraint primary key(`sala_id`)
);



