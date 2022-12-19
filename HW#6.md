# Практическое задание

# Работаем с базой данных vk. В качестве отчёта необходимо сдать код выполняемых команд в текстовом формате.

# 1. Создать функцию, которая по идентификатору пользователя ищет того, кто написал пользователю наибольшее количество сообщений. В результат ужно вывести идентификатор искомого пользователя.#

# 2. Создать процедуру, которая проверяет владельца фотографий, которые указаны в качестве основных фотографий пользователей в таблице профилей. Если пользователь в профилях не является владельцем своей основной фотографии, тогда для него нужно записать NULL в столбце main_photo_id.#

# 3. Создать триггер на обновление для таблицы профилей, который не разрешает внести в столбец main_photo_id идентификатор фотографии, если данный пользователь не является ее владельцем. Проверить работу триггера вставкой записей с корректными и некорректными значениями.#

# 4. Создать два представления для таблицы видео. Одно представление должно быть неизменяемым, другое - изменяемым. Проверить изменяемость второго представления.#

## 1.

> CREATE FUNCTION messages_received_by_user_id (user_id INTEGER)
> RETURNS BIGINT AS

> $$
> SELECT from_user_id FROM messages
> WHERE to_user_id = user_id
> GROUP BY from_user_id
> ORDER BY COUNT (from_user_id)
> DESC LIMIT 1;
> $$

> $$

> LANGUAGE SQL;

> SELECT messages_received_by_user_id(87);

## 1.

## 2.

> CREATE OR REPLACE PROCEDURE photos_owner_check()
> LANGUAGE PLPGSQL AS

> $$
> DECLARE photo_row RECORD;
> BEGIN
> FOR photo_row IN
> SELECT * FROM profiles
> LEFT JOIN photo on photo.id=profiles.main_photo_id
> WHERE photo.owner_id<> profiles.user_id
> LOOP
> UPDATE profiles SET main_photo_id = NULL WHERE profiles.user_id=photo_row.user_id;
> END LOOP;
> COMMIT;
> END;
> $$

> CALL photos_owner_check();

## 2.

## 3.

> CREATE OR REPLACE FUNCTION update_profiles_photo_trigger()
> RETURNS TRIGGER AS
>
> $$
> DECLARE is_owner BOOLEAN;
> BEGIN
> is_owner:=NOT EXISTS(SELECT * FROM photo WHERE id = NEW.main_photo_id AND owner_id = NEW.user_id);
> IF is_owner THEN
>  RAISE EXCEPTION 'NOT photo owner';
> END IF;
> RETURN NEW;
> END
> $$
>
> LANGUAGE PLPGSQL;

> CREATE TRIGGER check_photo_on_update BEFORE UPDATE ON profiles
> FOR EACH ROW
> EXECUTE FUNCTION update_profiles_photo_trigger();

> UPDATE profiles SET main_photo_id = 10 WHERE user_id = 10; //catch error 'NOT photo owner'

> SELECT _ FROM profiles;
> SELECT _ FROM photo WHERE owner_id=10;

> UPDATE profiles SET main_photo_id = 21 WHERE user_id = 10; //ok

## 3.

## 4.

**_ not-changing view _**

> DROP VIEW users_without_main_photo;

> CREATE VIEW users_without_main_photo AS
> SELECT users.id, users.first_name, users.last_name
> FROM users
> LEFT JOIN profiles
> ON profiles.user_id = users.id WHERE profiles.main_photo_id is NULL;

> SELECT \* FROM users_without_main_photo;

**_ changing view _**

> DROP VIEW profiles_without_main_photo;

> CREATE VIEW profiles_without_main_photo AS
> SELECT user_id, main_photo_id
> FROM profiles WHERE main_photo_id is NULL;

> SELECT \* FROM profiles_without_main_photo;

> UPDATE profiles_without_main_photo SET main_photo_id = 88 WHERE user_id=11;

## 4.
