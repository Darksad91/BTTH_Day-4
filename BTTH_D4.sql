CREATE DATABASE cine_magic;
USE cine_magic;

CREATE TABLE movies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    duration_minutes INT,
    age_restriction INT DEFAULT 0
);

CREATE TABLE rooms (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    max_seats INT,
    status VARCHAR(50) DEFAULT 'active'
);

CREATE TABLE showtimes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT,
    room_id INT,
    show_time DATETIME,
    ticket_price DECIMAL(10,2),
    FOREIGN KEY (movie_id) REFERENCES movies(id),
    FOREIGN KEY (room_id) REFERENCES rooms(id)
);

CREATE TABLE bookings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    showtime_id INT,
    customer_name VARCHAR(255),
    phone VARCHAR(20),
    booking_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (showtime_id) REFERENCES showtimes(id)
);

INSERT INTO movies VALUES
(NULL, 'Avengers', 150, 13),
(NULL, 'The Nun 2', 110, 18),
(NULL, 'Kung Fu Panda 4', 95, 0),
(NULL, 'Fast & Furious 11', 140, 16);

INSERT INTO rooms VALUES
(NULL, 'Room 1', 100, 'active'),
(NULL, 'Room 2', 80, 'active'),
(NULL, 'Room 3', 120, 'maintenance');

INSERT INTO showtimes VALUES
(NULL, 1, 1, '2026-05-01 09:00:00', 70000),
(NULL, 2, 1, '2026-05-01 13:00:00', 80000),
(NULL, 3, 2, '2026-05-01 10:00:00', 60000),
(NULL, 4, 2, '2026-05-01 15:00:00', 90000),
(NULL, 1, 2, '2026-05-02 18:00:00', 75000);

INSERT INTO bookings VALUES
(NULL, 1, 'A', '0901', NOW()),
(NULL, 2, 'B', '0902', NOW()),
(NULL, 3, 'C', '0903', NOW()),
(NULL, 4, 'D', '0904', NOW()),
(NULL, 5, 'E', '0905', NOW()),
(NULL, 1, 'F', '0906', NOW()),
(NULL, 2, 'G', '0907', NOW()),
(NULL, 3, 'H', '0908', NOW()),
(NULL, 4, 'I', '0909', NOW()),
(NULL, 5, 'K', '0910', NOW()),
(NULL, 1, 'Test', '0987654321', NOW());

SELECT * FROM movies;
SELECT * FROM rooms;
SELECT * FROM showtimes;
SELECT * FROM bookings;

UPDATE rooms
SET status = 'maintenance'
WHERE id = 1;

UPDATE showtimes
SET room_id = 2
WHERE room_id = 1;

DELETE FROM bookings
WHERE phone = '0987654321';

DELETE FROM bookings
WHERE showtime_id IN (SELECT id FROM showtimes WHERE movie_id = 3);

DELETE FROM showtimes
WHERE movie_id = 3;

DELETE FROM movies
WHERE id = 3;

SELECT *
FROM movies
WHERE duration_minutes BETWEEN 90 AND 120;

SELECT *
FROM bookings
WHERE showtime_id = 2
ORDER BY booking_date DESC;

SELECT *
FROM movies
WHERE age_restriction = 18
   OR duration_minutes > 150;

SELECT *
FROM showtimes
WHERE ticket_price > 100000
  AND MONTH(show_time) = MONTH(CURRENT_DATE())
  AND YEAR(show_time) = YEAR(CURRENT_DATE());