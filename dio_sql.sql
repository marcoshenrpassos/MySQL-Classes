INSERT INTO videos (author, title, likes, dislikes) VALUES ('Maria', 'MySQL', 10, 2);
INSERT INTO videos (author, title, likes, dislikes) VALUES ('Jhon','HTML', 30, 1);
INSERT INTO videos (author, title, likes, dislikes) VALUES ('Marcos','CSS', 18 , 0);
INSERT INTO videos (author, title, likes, dislikes) VALUES ('Tania','JAvaScript', 5 , 8);
INSERT INTO videos (author, title, likes, dislikes) VALUES ('Marcos','Python', 25 , 3);


INSERT INTO author (name, birthday) VALUES ('Marcos','1986-01-18');
INSERT INTO author (name, birthday) VALUES ('Jhon','1982-05-28');
INSERT INTO author (name, birthday) VALUES ('Maria','1999-11-08');
INSERT INTO author (name, birthday) VALUES ('Tania','2005-01-11');


UPDATE videos SET author=3 WHERE id_video=1;
UPDATE videos SET author=2 WHERE id_video=2;
UPDATE videos SET author=1 WHERE id_video=3;
UPDATE videos SET author=4 WHERE id_video=4;
UPDATE videos SET author=1 WHERE id_video=5;


-- Change 'author' column on videos table to a foreign key of author table

SELECT * FROM `videos` JOIN author ON videos.fk_author = author.id_author;

SELECT videos.title, author.name FROM `videos` JOIN author ON videos.fk_author = author.id_author;

-- create table seo with id and category

ALTER TABLE videos ADD fk_seo INT NOT NULL AFTER title;

UPDATE videos SET fk_seo=2 WHERE id_video=1;
UPDATE videos SET fk_seo=1 WHERE id_video=2;
UPDATE videos SET fk_seo=1 WHERE id_video=3;
UPDATE videos SET fk_seo=1 WHERE id_video=4;
UPDATE videos SET fk_seo=2 WHERE id_video=5;
UPDATE videos SET fk_seo=2 WHERE id_video=6;


SELECT * FROM videos JOIN seo ON videos.fk_seo = seo.id_seo;

SELECT videos.title, seo.category FROM videos JOIN seo ON videos.fk_seo = seo.id_seo;

SELECT videos.title, author.name, seo.category FROM videos JOIN seo ON videos.fk_seo = seo.id_seo
JOIN author ON videos.fk_author = author.id_author;

-- create table playlist with id and name

INSERT INTO playlist (name_pl) VALUES ('HTML + CSS');
INSERT INTO playlist (name_pl) VALUES ('HTML + PHP + JS');
INSERT INTO playlist (name_pl) VALUES ('Python + MHP');

-- create table video_playlist with id, fk_videos ans fk_playlist

INSERT INTO videos_playlist(fk_videos, fk_playlist) VALUES (2,1);
INSERT INTO videos_playlist(fk_videos, fk_playlist) VALUES (3,1);

SELECT * FROM `playlist` JOIN videos_playlist ON playlist.id_playlist = videos_playlist.fk_playlist
JOIN videos ON videos.id_video = videos_playlist.fk_videos;


SELECT playlist.name_pl, videos.title  FROM `playlist` 
JOIN videos_playlist ON playlist.id_playlist = videos_playlist.fk_playlist 
JOIN videos ON videos.id_video = videos_playlist.fk_videos;


SELECT playlist.name_pl, videos.title, author.name  FROM `playlist` 
JOIN videos_playlist ON playlist.id_playlist = videos_playlist.fk_playlist 
JOIN videos ON videos.id_video = videos_playlist.fk_videos
JOIN author ON videos.fk_author = author.id_author

ALTER TABLE playlist ADD fk_author INT NOT NULL AFTER name_pl;

UPDATE playlist SET fk_author = 4 WHERE id_playlist = 1;
UPDATE playlist SET fk_author = 1 WHERE id_playlist = 2;
UPDATE playlist SET fk_author = 3 WHERE id_playlist = 3;

SELECT * FROM playlist JOIN author ON playlist.fk_author = author.id_author;

SELECT author.name, playlist.name_pl FROM playlist JOIN author ON playlist.fk_author = author.id_author;