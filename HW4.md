# Работаем с базой данных vk. Найти, кому принадлежат 10 самых больших видеофайлов. В отчёт вывести идентификатор видеофайла,

# имя владельца, фамилию владельца, URL основной фотографии пользователя, URL видеофайла, размер видеофайла.

# Решить задачу, применив различные подходы:

# - Найти решение только на вложенных запросах

# - Найти решение с использованием временной таблицы

# - Найти решение с использованием общего табличного выражения

# - Найти решение с помощью объединения JOIN

# В качестве отчёта сдать код четырёх запросов в виде текста. Для проверки - результат работы всех вариантов должен совпасть.

-- вложенные запросы start
SELECT
video.id as video_id,
video.owner_id,
(SELECT first_name FROM users WHERE users.id=video.owner_id),
(SELECT last_name FROM users WHERE users.id=video.owner_id),
(SELECT photo.url FROM photo WHERE photo.id = (SELECT main_photo_id FROM users WHERE users.id=video.owner_id)) AS photo_url,
video.url AS video_url,
video.size
FROM video GROUP BY video.id
ORDER BY video.size DESC
LIMIT 10;
-- вложенные запросы end

-- временная таблица start
CREATE TEMPORARY TABLE size_video (
id INT,
size INT,
owner_id INT,
url VARCHAR(255)
);

INSERT INTO size_video
SELECT id, size, owner_id, url
FROM video
ORDER BY size DESC;

SELECT size_video.id AS video_id,
size_video.size,
size_video.owner_id,
last_name AS owner_last_name,
first_name AS owner_first_name,
size_video.url AS video_url,
photo.url AS photo_url
FROM users
JOIN size_video
ON size_video.owner_id = users.id
JOIN photo
ON photo.id=users.main_photo_id
LIMIT 10;
-- временная таблица end

-- общее табличное выражение start
WITH size_video AS (
SELECT id,
size,
owner_id,
url
FROM video
ORDER BY size DESC
)
SELECT size_video.id AS video_id,
size_video.size,
size_video.owner_id,
last_name AS owner_last_name,
irst_name AS owner_first_name,
size_video.url AS video_url,
photo.url AS photo_url
FROM users
JOIN size_video
ON size_video.owner_id = users.id
JOIN photo
ON photo.id=users.main_photo_id
LIMIT 10;
-- общее табличное выражение end

-- объединение JOIN start
SELECT
video.id AS video_id,
video.owner_id,
users.first_name,
users.last_name,
video.size,
video.url AS video_url,
photo.url AS photo_url
FROM video
JOIN users
ON users.id=video.owner_id
JOIN photo
ON photo.id=users.main_photo_id
ORDER BY video.size DESC
LIMIT 10;
-- объединение JOIN end
