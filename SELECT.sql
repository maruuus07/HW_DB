--Название и продолжительность самого длительного трека.
SELECT name, duration FROM track
WHERE duration = (SELECT MAX(duration) FROM track)

--Название треков, продолжительность которых не менее 3,5 минут.
SELECT name FROM track
WHERE duration >= 210;

--Названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT name FROM collection
WHERE year_col BETWEEN  2018 AND 2020;

--Исполнители, чьё имя состоит из одного слова.
SELECT name FROM singer
WHERE name LIKE  '_';

--Название треков, которые содержат слово «мой» или «my».
SELECT name FROM track
WHERE name LIKE  'мой' OR name LIKE 'my'
OR name LIKE  '%мой%' OR name LIKE '%my%'
OR name LIKE  '%мой' OR name LIKE '%my'
OR name LIKE  'мой%' OR name LIKE 'my%';

-------------------

--Количество исполнителей в каждом жанре.
SELECT a.name, count(*) FROM genre a
JOIN genresinger i ON i.genre_id  = a.id
GROUP BY a.name 

--Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT count(*)  FROM track a
JOIN album i ON a.album_id = i.id
WHERE year_al BETWEEN 2019 AND 2020

--Средняя продолжительность треков по каждому альбому.
SELECT a.name, AVG(duration) FROM album a 
JOIN track i ON i.album_id = a.id
GROUP BY a.name

--Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT c.name FROM singer c
JOIN album a ON c.id = a.id
WHERE year_al != 2020;

--Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
SELECT DISTINCT o.name, c.name FROM singer c
JOIN singeralbum f ON f.id = c.id
JOIN album l ON f.id = l.id
JOIN track r ON r.album_id = l.id
JOIN collectiontrack d ON d.id = r.id
JOIN collection o ON o.id = d.id 
WHERE c.name = 'Агутин Леонид';
