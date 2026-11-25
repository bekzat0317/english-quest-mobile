BEGIN;
CREATE TABLE users (id INTEGER PRIMARY KEY, name VARCHAR(100) NOT NULL, email VARCHAR(150) UNIQUE NOT NULL, role VARCHAR(20) NOT NULL CHECK (role IN ('student','admin')));
CREATE TABLE topics (id INTEGER PRIMARY KEY, title VARCHAR(100) UNIQUE NOT NULL);
CREATE TABLE questions (id INTEGER PRIMARY KEY, topic_id INTEGER NOT NULL REFERENCES topics(id), question_text VARCHAR(250) NOT NULL);
CREATE TABLE answers (id INTEGER PRIMARY KEY, question_id INTEGER NOT NULL REFERENCES questions(id), answer_text VARCHAR(150) NOT NULL, is_correct BOOLEAN NOT NULL);
CREATE TABLE attempts (id INTEGER PRIMARY KEY, user_id INTEGER NOT NULL REFERENCES users(id), answer_id INTEGER NOT NULL REFERENCES answers(id), score INTEGER NOT NULL CHECK (score IN (0,10)), attempted_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP);
CREATE TABLE user_topics (user_id INTEGER NOT NULL REFERENCES users(id), topic_id INTEGER NOT NULL REFERENCES topics(id), started_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, PRIMARY KEY(user_id,topic_id));
INSERT INTO users VALUES (1,'Aruzhan','aruzhan@example.com','student'),(2,'Dias','dias@example.com','student'),(3,'Amina','amina@example.com','student'),(4,'Admin','admin@example.com','admin');
INSERT INTO topics VALUES (1,'Grammar'),(2,'Vocabulary'),(3,'Translation');
INSERT INTO questions VALUES (1,1,'She ___ a student.'),(2,2,'What is the opposite of hot?'),(3,3,'Translate: кітап');
INSERT INTO answers VALUES (1,1,'is',TRUE),(2,1,'are',FALSE),(3,2,'cold',TRUE),(4,3,'book',TRUE),(5,3,'pen',FALSE);
INSERT INTO attempts (id,user_id,answer_id,score) VALUES (1,1,1,10),(2,1,3,10),(3,2,2,0),(4,3,4,10),(5,2,5,0);
INSERT INTO user_topics (user_id,topic_id) VALUES (1,1),(1,2),(2,1),(2,3),(3,3);
COMMIT;
-- Query 1: detailed quiz results (five tables)
SELECT u.name, t.title, q.question_text, a.answer_text, a.is_correct, r.score
FROM attempts r JOIN users u ON u.id=r.user_id JOIN answers a ON a.id=r.answer_id JOIN questions q ON q.id=a.question_id JOIN topics t ON t.id=q.topic_id ORDER BY r.id;
-- Query 2: total points per student
SELECT u.name, COUNT(r.id) AS attempts_count, COALESCE(SUM(r.score),0) AS total_score
FROM users u LEFT JOIN attempts r ON r.user_id=u.id WHERE u.role='student' GROUP BY u.id,u.name ORDER BY total_score DESC,u.name;
