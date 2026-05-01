CREATE DATABASE cine_magic;
USE cine_magic;

CREATE TABLE movies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    duration_minutes INT NOT NULL,
    age_restriction INT DEFAULT 0
);

CREATE TABLE rooms (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    max_seats INT NOT NULL,
    status VARCHAR(50) DEFAULT 'active'
);

CREATE TABLE showtimes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT,
    room_id INT,
    show_time DATETIME NOT NULL,
    ticket_price DECIMAL(10,2) CHECK (ticket_price >= 0),
    FOREIGN KEY (movie_id) REFERENCES movies(id),
    FOREIGN KEY (room_id) REFERENCES rooms(id)
);

CREATE TABLE bookings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    showtime_id INT,
    customer_name VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    booking_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (showtime_id) REFERENCES showtimes(id)
);

INSERT INTO movies (title, duration_minutes, age_restriction) VALUES
('Avengers: Secret Wars', 150, 13),
('The Nun 2', 110, 18),
('Kung Fu Panda 4', 95, 0),
('Fast & Furious 11', 140, 16);

INSERT INTO rooms (name, max_seats, status) VALUES
('Room 1', 100, 'active'),
('Room 2', 80, 'active'),
('Room 3', 120, 'maintenance');

INSERT INTO showtimes (movie_id, room_id, show_time, ticket_price) VALUES
(1, 1, '2026-05-01 09:00:00', 70000),
(2, 1, '2026-05-01 13:00:00', 80000),
(3, 2, '2026-05-01 10:00:00', 60000),
(4, 2, '2026-05-01 15:00:00', 90000),
(1, 2, '2026-05-02 18:00:00', 75000);

INSERT INTO bookings (showtime_id, customer_name, phone) VALUES
(1, 'Nguyen Van A', '0901234567'),
(1, 'Tran Thi B', '0912345678'),
(2, 'Le Van C', '0923456789'),
(2, 'Pham Thi D', '0934567890'),
(3, 'Hoang Van E', '0945678901'),
(3, 'Vo Thi F', '0956789012'),
(4, 'Dang Van G', '0967890123'),
(4, 'Bui Thi H', '0978901234'),
(5, 'Do Van I', '0989012345'),
(5, 'Nguyen Thi K', '0990123456');

SELECT * FROM movies;
SELECT * FROM rooms;
SELECT * FROM showtimes;
SELECT * FROM bookings;