CREATE DATABASE IF NOT EXISTS szkola_podstawowa_db;
create user if not exists administrator identified by 'Zaq12wsx';
grant all privileges on szkola_podstawowa_db.* to administrator;

use szkola_podstawowa_db;

drop table if exists "uczen";




