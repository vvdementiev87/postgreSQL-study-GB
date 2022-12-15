# Для всех заданий в качестве отчёта необходимо приложить все выполненные команды в текстовом виде.#

# 1. Создать роли для пользователей Федор Серов и Роман Белов. Создать роли для групп аналитиков и тестировщиков. Поместить пользователя Федор Серов в группу аналитиков а пользователя Роман Белов в группу тестировщиков. Дать группе аналитиков право только на чтение данных в БД vk. Дать группе тестировщиков все права в БД vk. Подключиться к БД vk под обоими пользователями и проверить права выполнив простые операции SQL.

---

> sudo su - postgres
> psql vk

> > SELECT rolname FROM pg_roles;
> > CREATE ROLE tester;
> > CREATE ROLE data_analyst;
> > CREATE ROLE fedor_serov LOGIN;
> > CREATE ROLE roman_belov LOGIN;
> > ALTER ROLE fedor_serov WITH PASSWORD 'justFor7';
> > ALTER ROLE roman_belov WITH PASSWORD 'justFor7';
> > GRANT tester TO roman_belov;
> > GRANT data_analyst TO fedor_serov;
> > \c vk;
> > GRANT ALL ON ALL TABLES IN SCHEMA public TO tester;
> > GRANT ALL ON ALL SEQUENCES IN SCHEMA public TO tester;
> > GRANT SELECT ON ALL TABLES IN SCHEMA public TO data_analyst;
> > GRANT SELECT ON ALL SEQUENCES IN SCHEMA public TO data_analyst;

> > exit
> > logout
> > psql -U roman*belov -d vk -h 127.0.0.1 -W
> > SELECT * FROM users WHERE id = 1; // ok
> > UPDATE users SET first*name = 'Roman' WHERE id = 1; // ok
> > psql -U fedor_serov -d vk -h 127.0.0.1 -W
> > SELECT * FROM users WHERE id = 1; // ok
> > UPDATE users SET first_name = 'Fedor' WHERE id = 1; // permission denied

---

# 2. Установить любое расширение PostgreSQL на ваш выбор.

> sudo apt install postgis -y
> sudo su - postgres
> psql vk

> > CREATE EXTENSION postgis;
> > CREATE EXTENSION postgis_raster;
> > CREATE EXTENSION postgis_topology;
> > CREATE EXTENSION postgis_sfcgal;
> > CREATE EXTENSION fuzzystrmatch;
> > CREATE EXTENSION address_standardizer;
> > CREATE EXTENSION address_standardizer_data_us;
> > CREATE EXTENSION postgis_tiger_geocoder;

> > SELECT \* FROM pg_extension; // data check

# 3. Выполнить вертикальное разделение таблицы пользователей на таблицу пользователей (users) и таблицу профилей (profiles). В таблице пользователей оставить только столбцы идентификатора, имени, фамилии, электронной почты и телефона. Все остальные столбцы вместе с данными необходимо перенести в таблицу профилей.

> > CREATE TABLE profiles
> > (id SERIAL PRIMARY KEY,
> > main_photo_id INT,
> > created_at TIMESTAMP
> > user_contacts contacts);

> > INSERT INTO profiles
> > (id,
> > main_photo_id,
> > created_at, user_contacts)
> > SELECT id, main_photo_id, created_at, user_contacts
> > FROM users;

> > SELECT \* FROM users
> > JOIN profiles ON profiles.id = users.id ORDER BY users.id; // data check

> > ALTER TABLE users
> > ADD CONSTRAINT users_profiles_fk
> > FOREIGN KEY (id)
> > REFERENCES profiles (id)
> > ON DELETE CASCADE; // one - to - one

> > ALTER TABLE profiles
> > ADD CONSTRAINT profiles_main_photo_id_fk
> > FOREIGN KEY (main_photo_id)
> > REFERENCES photo (id) ON DELETE CASCADE;

> > ALTER TABLE users DROP CONSTRAINT users_main_photo_id_fk;

> > ALTER TABLE users DROP COLUMN main_photo_id;

> > ALTER TABLE users DROP COLUMN created_at;

> > ALTER TABLE users DROP COLUMN user_contacts;
