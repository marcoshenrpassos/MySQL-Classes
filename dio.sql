CREATE TABLE people (
  id INT NOT NULL PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(30) NOT NULL,
  birthday DATE

)

INSERT INTO people (name, birthday) VALUES ('Marcos', '1986-01-18')
INSERT INTO people (name, birthday) VALUES ('James', '1992-05-18')
INSERT INTO people (name, birthday) VALUES ('Andy', '1999-12-18')



SELECT name FROM person;


-- UPDATE person SET name='Marcos Passos'; 
-- ******WRONG!

UPDATE person SET name='Marcos Passos' WHERE id=1;



SELECT * FROM person WHERE id=5; 
-- *****Always check if the data is correct****

DELETE FROM person WHERE id=3;



SELECT * FROM `person` ORDER BY name
-- *****ASC optional
SELECT * FROM `person` ORDER BY name DESC


ALTER TABLE person ADD gender VARCHAR(1) NOT NULL AFTER birthday;

UPDATE person SET gender='M' WHERE id=1;
UPDATE person SET gender='M' WHERE id=2;
UPDATE person SET gender='F' WHERE id=4;

SELECT COUNT(id), gender FROM person GROUP BY gender;
