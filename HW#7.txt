Практическое задание
Работаем с базой данных vk. В качестве отчета необходимо сдать код выполняемых команд в
текстовом файле.

1. Удалить пользователей, которые не имеют ни одной дружеской связи с подтвержденным
   статусом. Нужно удалить все данные, связанные с такими пользователями. Для решения
   используйте транзакцию.
2. Создать запрос, который для всех пользователей покажет количество загруженных
   фотографий и видеофайлов (отдельными столбцами), а также ранг каждого пользователя по
   этим значениям (также отдельно для фотографий и видеофайлов). Большие значения
   соответствуют более высокому рангу. Решить задание необходимо одним запросом с
   использованием оконных функций.
3. Для каждой группы (сообщества) найти средний размер видеофайлов, загруженных
   участниками группы, а также вывести идентификатор, имя и фамилию пользователя, который
   загрузил самый большой по размеру видеофайл. Решить задание необходимо одним
   запросом с использованием оконных функций.

   1.

BEGIN;

DROP TABLE users_no_friendship;

CREATE TEMPORARY TABLE users_no_friendship (
user_id INT);

INSERT INTO users_no_friendship
SELECT users.id  
FROM users
LEFT OUTER JOIN friendship as fr
ON fr.requested_by_user_id=users.id
LEFT OUTER JOIN friendship as tr
ON tr.confirmed_by_user_id=users.id WHERE (fr.status_id isnull and tr.status_id isnull)
or (fr.status_id = 5 and NOT EXISTS(
SELECT \* FROM friendship where friendship.status_id<>5 and friendship.requested_by_user_id =users.id ))
GROUP BY users.id order by users.id;

DELETE FROM communities_users WHERE user_id IN (SELECT user_id FROM users_no_friendship);
DELETE FROM friendship WHERE requested_by_user_id IN (SELECT user_id FROM users_no_friendship) OR confirmed_by_user_id
IN (SELECT user_id FROM users_no_friendship);
DELETE FROM messages WHERE from_user_id IN (SELECT user_id FROM users_no_friendship) OR to_user_id IN (SELECT user_id FROM users_no_friendship);
UPDATE profiles SET main_photo_id = NULL WHERE user_id IN (SELECT user_id FROM users_no_friendship);
DELETE FROM photo WHERE owner_id IN (SELECT user_id FROM users_no_friendship);
DELETE FROM video WHERE owner_id IN (SELECT user_id FROM users_no_friendship);
DELETE FROM profiles WHERE user_id IN (SELECT user_id FROM users_no_friendship);
DELETE FROM users WHERE id IN (SELECT user_id FROM users_no_friendship);

DROP TABLE users_no_friendship;

COMMIT;

    2.

WITH users_photo AS(
SELECT DISTINCT
users.id,
COUNT(photo.id) OVER (PARTITION BY users.id) AS photo_count
FROM users
LEFT JOIN photo
ON users.id = photo.owner_id), users_video AS(
SELECT DISTINCT
users.id,
COUNT(video.id) OVER (PARTITION BY users.id) AS video_count
FROM users
LEFT JOIN video
ON users.id = video.owner_id)
SELECT
users_photo.id,
photo_count,
video_count,
DENSE_RANK() OVER (ORDER BY photo_count) AS photo_rank,
DENSE_RANK() OVER (ORDER BY video_count) AS video_rank,
DENSE_RANK() OVER (ORDER BY video_count + photo_count) AS total_rank
FROM users_photo
JOIN users_video ON users_photo.id=users_video.id
ORDER BY total_rank DESC;

    3.

WITH community_messages AS (
SELECT DISTINCT
communities.id,
communities.name,
AVG(video.size) OVER (PARTITION BY communities.id) AS
video_size_avg,
Max(video.size) OVER (PARTITION BY communities.id ORDER BY video.size DESC ) AS
video_size_max,
Count(video.size) OVER (PARTITION BY communities.id) AS
video_count,
FIRST_VALUE(communities_users.user_id) OVER (PARTITION BY communities.id ORDER BY video.size DESC ) AS
userId
FROM communities
LEFT JOIN communities_users
ON communities_users.community_id = communities.id
JOIN video
ON video.owner_id = communities_users.user_id)
SELECT DISTINCT
community_messages.id AS
community_id,
community_messages.name AS
community_name,
video_size_avg,
video_size_max,
video_count,
userId,
users.first_name,
users.last_name
FROM community_messages
JOIN users
ON users.id=userId
ORDER BY video_size_avg DESC;
