CREATE DATABASE animal_db;

USE animal_db;

CREATE TABLE farmers (
    farmer_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(100),
    address VARCHAR(150),
    role ENUM('Owner', 'Manager', 'Worker') DEFAULT 'Worker',
    hire_date DATE
);

CREATE TABLE goats (
    goat_id INT AUTO_INCREMENT PRIMARY KEY,
    tag_number VARCHAR(50) UNIQUE NOT NULL,
    
    breed VARCHAR(50) NOT NULL,
    gender ENUM('Male', 'Female') NOT NULL,
    
    birth_date DATE,
    acquisition_date DATE,
    
    weight_kg DECIMAL(6,2),
    color VARCHAR(50),
    
    purpose ENUM('Meat', 'Milk', 'Breeding') DEFAULT 'Meat',
    
    status ENUM('Active', 'Sold', 'Dead', 'Sick') DEFAULT 'Active',
    
    farmer_id INT,
    
    FOREIGN KEY (farmer_id) REFERENCES farmers(farmer_id)
);

CREATE TABLE feed (
    feed_id INT AUTO_INCREMENT PRIMARY KEY,
    
    goat_id INT NOT NULL,
    
    feed_type ENUM('Grass','Hay','Concentrate','Grain Mix') NOT NULL,
    
    quantity_kg DECIMAL(6,2) NOT NULL,
    
    cost DECIMAL(10,2) NOT NULL,
    
    feed_date DATE NOT NULL,
    
    week_number INT NOT NULL,
    
    notes VARCHAR(255),
    
    FOREIGN KEY (goat_id) REFERENCES goats(goat_id)
);

CREATE TABLE health_records (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    goat_id INT,
    
    condition_name VARCHAR(100),
    treatment TEXT,
    medication VARCHAR(100),
    vet_name VARCHAR(100),
    
    record_date DATE,
    
    status ENUM('Recovered', 'Under Treatment', 'Critical') DEFAULT 'Under Treatment',
    
    FOREIGN KEY (goat_id) REFERENCES goats(goat_id)
);



CREATE TABLE production (
    production_id INT AUTO_INCREMENT PRIMARY KEY,
    
    goat_id INT NOT NULL,
    
    milk_liters DECIMAL(6,2) NOT NULL,
    
    production_date DATE NOT NULL,
    
    week_number INT,
    
    value DECIMAL(10,2),
    
    notes VARCHAR(255),
    
    FOREIGN KEY (goat_id) REFERENCES goats(goat_id)
);


CREATE TABLE vaccination (
    vaccination_id INT AUTO_INCREMENT PRIMARY KEY,
    
    goat_id INT NOT NULL,
    
    vaccine_name VARCHAR(100) NOT NULL,
    
    disease_target VARCHAR(100),
    
    dose VARCHAR(50),
    
    vet_name VARCHAR(100),
    
    vaccination_date DATE NOT NULL,
    
    next_due_date DATE,
    
    status ENUM('Completed','Pending','Overdue') DEFAULT 'Completed',
    
    notes VARCHAR(255),
    
    FOREIGN KEY (goat_id) REFERENCES goats(goat_id)
);

CREATE TABLE expenses (
    expense_id INT AUTO_INCREMENT PRIMARY KEY,
    
    expense_type ENUM(
        'Feed',
        'Veterinary',
        'Labor',
        'Transport',
        'Equipment',
        'Medication',
        'Utilities',
        'Maintenance'
    ) NOT NULL,
    
    goat_id INT NULL,
    
    amount DECIMAL(10,2) NOT NULL,
    
    expense_date DATE NOT NULL,
    
    description VARCHAR(255),
    
    week_number INT,
    
    recorded_by VARCHAR(100),
    
    FOREIGN KEY (goat_id) REFERENCES goats(goat_id)
);

INSERT INTO farmers (full_name, phone, email, address, role, hire_date) 
VALUES
('John Ade', '08011111111', 'john@gmail.com', 'Lagos', 'Owner', '2023-01-10'),
('Mary Okafor', '08022222222', 'mary@gmail.com', 'Ibadan', 'Manager', '2023-02-15'),
('David Musa', '08033333333', 'david@gmail.com', 'Abuja', 'Worker', '2023-03-12'),
('Aisha Bello', '08044444444', 'aisha@gmail.com', 'Kano', 'Worker', '2023-04-01'),
('Peter Obi', '08055555555', 'peter@gmail.com', 'Enugu', 'Manager', '2023-05-20'),
('Grace Nwosu', '08066666666', 'grace@gmail.com', 'Owerri', 'Worker', '2023-06-18'),
('Samuel John', '08077777777', 'samuel@gmail.com', 'Benin', 'Worker', '2023-07-10'),
('Fatima Yusuf', '08088888888', 'fatima@gmail.com', 'Kaduna', 'Worker', '2023-08-05'),
('Emeka Okoro', '08099999999', 'emeka@gmail.com', 'Port Harcourt', 'Manager', '2023-09-01'),
('Zainab Ali', '08100000000', 'zainab@gmail.com', 'Sokoto', 'Worker', '2023-10-12');

INSERT INTO goats 
(tag_number, breed, gender, birth_date, acquisition_date, weight_kg, color, purpose, status, farmer_id)
VALUES

('GOAT-001','Boer','Male','2023-01-10','2023-06-01',32.5,'White','Meat','Active',1),
('GOAT-002','Saanen','Female','2023-02-12','2023-06-03',28.0,'White','Milk','Active',2),
('GOAT-003','WAD','Female','2023-03-05','2023-06-05',22.5,'Brown','Breeding','Active',3),
('GOAT-004','Kalahari','Male','2023-01-20','2023-06-07',35.0,'Red','Meat','Active',4),
('GOAT-005','Boer','Female','2023-04-11','2023-06-10',26.2,'White','Milk','Active',5),
('GOAT-006','WAD','Male','2023-02-14','2023-06-12',24.8,'Black','Meat','Active',6),
('GOAT-007','Saanen','Female','2023-03-18','2023-06-15',27.5,'White','Milk','Active',7),
('GOAT-008','Boer','Male','2023-01-25','2023-06-18',36.1,'White','Meat','Active',8),
('GOAT-009','WAD','Female','2023-04-02','2023-06-20',23.0,'Brown','Breeding','Active',9),
('GOAT-010','Kalahari','Female','2023-03-28','2023-06-22',25.7,'Red','Milk','Active',10),

('GOAT-011','Boer','Male','2023-02-01','2023-06-25',34.2,'White','Meat','Active',1),
('GOAT-012','Saanen','Female','2023-02-08','2023-06-27',29.1,'White','Milk','Active',2),
('GOAT-013','WAD','Male','2023-03-10','2023-06-28',25.3,'Black','Meat','Active',3),
('GOAT-014','Boer','Female','2023-01-30','2023-07-01',27.8,'White','Milk','Active',4),
('GOAT-015','Kalahari','Male','2023-02-20','2023-07-03',33.0,'Red','Meat','Active',5),
('GOAT-016','WAD','Female','2023-03-15','2023-07-05',21.9,'Brown','Breeding','Active',6),
('GOAT-017','Saanen','Female','2023-04-01','2023-07-07',28.6,'White','Milk','Active',7),
('GOAT-018','Boer','Male','2023-01-18','2023-07-09',37.4,'White','Meat','Active',8),
('GOAT-019','WAD','Female','2023-02-25','2023-07-10',22.7,'Black','Breeding','Active',9),
('GOAT-020','Kalahari','Female','2023-03-22','2023-07-12',26.3,'Red','Milk','Active',10),

('GOAT-021','Boer','Male','2023-02-10','2023-07-15',33.8,'White','Meat','Active',1),
('GOAT-022','Saanen','Female','2023-03-01','2023-07-18',28.9,'White','Milk','Active',2),
('GOAT-023','WAD','Male','2023-03-12','2023-07-20',24.5,'Brown','Meat','Active',3),
('GOAT-024','Kalahari','Female','2023-01-14','2023-07-22',26.1,'Red','Milk','Active',4),
('GOAT-025','Boer','Female','2023-02-28','2023-07-25',27.4,'White','Milk','Active',5),
('GOAT-026','WAD','Male','2023-03-18','2023-07-27',25.0,'Black','Meat','Active',6),
('GOAT-027','Saanen','Female','2023-04-05','2023-07-30',29.3,'White','Milk','Active',7),
('GOAT-028','Boer','Male','2023-01-22','2023-08-01',36.0,'White','Meat','Active',8),
('GOAT-029','WAD','Female','2023-02-15','2023-08-03',22.4,'Brown','Breeding','Active',9),
('GOAT-030','Kalahari','Male','2023-03-25','2023-08-05',34.1,'Red','Meat','Active',10),

('GOAT-031','Boer','Female','2023-02-08','2023-08-07',26.9,'White','Milk','Active',1),
('GOAT-032','Saanen','Male','2023-03-03','2023-08-10',30.2,'White','Meat','Active',2),
('GOAT-033','WAD','Female','2023-01-28','2023-08-12',23.5,'Black','Breeding','Active',3),
('GOAT-034','Boer','Male','2023-02-19','2023-08-14',35.5,'White','Meat','Active',4),
('GOAT-035','Kalahari','Female','2023-03-10','2023-08-16',27.0,'Red','Milk','Active',5),
('GOAT-036','WAD','Male','2023-04-01','2023-08-18',24.9,'Brown','Meat','Active',6),
('GOAT-037','Saanen','Female','2023-02-25','2023-08-20',28.7,'White','Milk','Active',7),
('GOAT-038','Boer','Male','2023-01-16','2023-08-22',37.2,'White','Meat','Active',8),
('GOAT-039','WAD','Female','2023-03-05','2023-08-24',22.8,'Black','Breeding','Active',9),
('GOAT-040','Kalahari','Female','2023-02-21','2023-08-26',25.9,'Red','Milk','Active',10),

('GOAT-041','Boer','Male','2023-03-08','2023-08-28',34.6,'White','Meat','Active',1),
('GOAT-042','Saanen','Female','2023-01-20','2023-08-30',29.0,'White','Milk','Active',2),
('GOAT-043','WAD','Male','2023-02-14','2023-09-01',25.2,'Black','Meat','Active',3),
('GOAT-044','Boer','Female','2023-03-22','2023-09-03',27.6,'White','Milk','Active',4),
('GOAT-045','Kalahari','Male','2023-01-30','2023-09-05',33.9,'Red','Meat','Active',5),
('GOAT-046','WAD','Female','2023-02-18','2023-09-07',22.3,'Brown','Breeding','Active',6),
('GOAT-047','Saanen','Male','2023-03-27','2023-09-09',31.0,'White','Meat','Active',7),
('GOAT-048','Boer','Female','2023-01-12','2023-09-11',26.8,'White','Milk','Active',8),
('GOAT-049','WAD','Male','2023-02-26','2023-09-13',24.6,'Black','Meat','Active',9),
('GOAT-050','Kalahari','Female','2023-03-14','2023-09-15',25.5,'Red','Milk','Active',10),

('GOAT-051','Boer','Male','2023-01-18','2023-09-17',36.4,'White','Meat','Active',1),
('GOAT-052','Saanen','Female','2023-02-09','2023-09-19',28.4,'White','Milk','Active',2),
('GOAT-053','WAD','Female','2023-03-06','2023-09-21',23.1,'Brown','Breeding','Active',3),
('GOAT-054','Boer','Male','2023-02-22','2023-09-23',35.0,'White','Meat','Active',4),
('GOAT-055','Kalahari','Female','2023-01-25','2023-09-25',26.7,'Red','Milk','Active',5),
('GOAT-056','WAD','Male','2023-03-11','2023-09-27',25.4,'Black','Meat','Active',6),
('GOAT-057','Saanen','Female','2023-02-17','2023-09-29',29.6,'White','Milk','Active',7),
('GOAT-058','Boer','Male','2023-01-21','2023-10-01',37.0,'White','Meat','Active',8),
('GOAT-059','WAD','Female','2023-03-02','2023-10-03',22.9,'Black','Breeding','Active',9),
('GOAT-060','Kalahari','Male','2023-02-28','2023-10-05',34.3,'Red','Meat','Active',10),

('GOAT-061','Boer','Female','2023-02-05','2023-10-07',27.1,'White','Milk','Active',1),
('GOAT-062','Saanen','Male','2023-03-09','2023-10-09',30.5,'White','Meat','Active',2),
('GOAT-063','WAD','Female','2023-01-27','2023-10-11',23.8,'Brown','Breeding','Active',3),
('GOAT-064','Boer','Male','2023-02-16','2023-10-13',35.8,'White','Meat','Active',4),
('GOAT-065','Kalahari','Female','2023-03-04','2023-10-15',26.4,'Red','Milk','Active',5),
('GOAT-066','WAD','Male','2023-01-19','2023-10-17',24.1,'Black','Meat','Active',6),
('GOAT-067','Saanen','Female','2023-02-24','2023-10-19',29.8,'White','Milk','Active',7),
('GOAT-068','Boer','Male','2023-03-13','2023-10-21',36.7,'White','Meat','Active',8),
('GOAT-069','WAD','Female','2023-01-23','2023-10-23',22.6,'Brown','Breeding','Active',9),
('GOAT-070','Kalahari','Male','2023-02-11','2023-10-25',33.6,'Red','Meat','Active',10),

('GOAT-071','Boer','Female','2023-03-01','2023-10-27',27.9,'White','Milk','Active',1),
('GOAT-072','Saanen','Male','2023-01-15','2023-10-29',31.2,'White','Meat','Active',2),
('GOAT-073','WAD','Female','2023-02-07','2023-10-31',23.3,'Black','Breeding','Active',3),
('GOAT-074','Boer','Male','2023-03-19','2023-11-02',35.1,'White','Meat','Active',4),
('GOAT-075','Kalahari','Female','2023-01-29','2023-11-04',26.0,'Red','Milk','Active',5),
('GOAT-076','WAD','Male','2023-02-13','2023-11-06',25.6,'Brown','Meat','Active',6),
('GOAT-077','Saanen','Female','2023-03-26','2023-11-08',29.4,'White','Milk','Active',7),
('GOAT-078','Boer','Male','2023-01-11','2023-11-10',37.5,'White','Meat','Active',8),
('GOAT-079','WAD','Female','2023-02-20','2023-11-12',22.2,'Black','Breeding','Active',9),
('GOAT-080','Kalahari','Male','2023-03-07','2023-11-14',34.8,'Red','Meat','Active',10),

('GOAT-081','Boer','Female','2023-01-26','2023-11-16',27.3,'White','Milk','Active',1),
('GOAT-082','Saanen','Male','2023-02-18','2023-11-18',30.9,'White','Meat','Active',2),
('GOAT-083','WAD','Female','2023-03-15','2023-11-20',23.6,'Brown','Breeding','Active',3),
('GOAT-084','Boer','Male','2023-01-17','2023-11-22',36.3,'White','Meat','Active',4),
('GOAT-085','Kalahari','Female','2023-02-09','2023-11-24',26.6,'Red','Milk','Active',5),
('GOAT-086','WAD','Male','2023-03-03','2023-11-26',24.7,'Black','Meat','Active',6),
('GOAT-087','Saanen','Female','2023-01-21','2023-11-28',29.1,'White','Milk','Active',7),
('GOAT-088','Boer','Male','2023-02-25','2023-11-30',37.8,'White','Meat','Active',8),
('GOAT-089','WAD','Female','2023-03-10','2023-12-02',22.5,'Black','Breeding','Active',9),
('GOAT-090','Kalahari','Male','2023-01-13','2023-12-04',34.0,'Red','Meat','Active',10),

('GOAT-091','Boer','Female','2023-02-06','2023-12-06',27.7,'White','Milk','Active',1),
('GOAT-092','Saanen','Male','2023-03-21','2023-12-08',31.5,'White','Meat','Active',2),
('GOAT-093','WAD','Female','2023-01-24','2023-12-10',23.2,'Brown','Breeding','Active',3),
('GOAT-094','Boer','Male','2023-02-12','2023-12-12',35.6,'White','Meat','Active',4),
('GOAT-095','Kalahari','Female','2023-03-28','2023-12-14',26.8,'Red','Milk','Active',5),
('GOAT-096','WAD','Male','2023-01-18','2023-12-16',24.3,'Black','Meat','Active',6),
('GOAT-097','Saanen','Female','2023-02-22','2023-12-18',29.7,'White','Milk','Active',7),
('GOAT-098','Boer','Male','2023-03-06','2023-12-20',37.1,'White','Meat','Active',8),
('GOAT-099','WAD','Female','2023-01-28','2023-12-22',22.7,'Black','Breeding','Active',9),
('GOAT-100','Kalahari','Male','2023-02-15','2023-12-24',34.5,'Red','Meat','Active',10);

INSERT INTO feed 
(goat_id, feed_type, quantity_kg, cost, feed_date, week_number, notes)
VALUES
#WEEK 1
(101,'Grass',2.5,500,'2024-01-01',1,'Morning feeding'),
(102,'Concentrate',1.5,1200,'2024-01-01',1,'Milk production support'),
(103,'Hay',2.0,800,'2024-01-01',1,'Breeding nutrition'),
(104,'Grain Mix',1.2,1000,'2024-01-02',1,'Weight gain feeding'),
(105,'Grass',2.6,520,'2024-01-02',1,'Routine feeding'),
(106,'Hay',2.3,900,'2024-01-03',1,'Digestive support'),
(107,'Concentrate',1.3,1150,'2024-01-03',1,'Milk enhancement'),
(108,'Grass',2.7,540,'2024-01-04',1,'Routine feeding'),
(109,'Grain Mix',1.4,1050,'2024-01-05',1,'Breeding support'),
(110,'Grass',2.4,500,'2024-01-06',1,'Standard feeding'),
#WEEK 2
(111,'Grass',2.7,540,'2024-01-08',2,'Routine feeding'),
(112,'Concentrate',1.6,1250,'2024-01-08',2,'Milk support'),
(113,'Hay',2.1,850,'2024-01-08',2,'Balanced nutrition'),
(114,'Grain Mix',1.3,1100,'2024-01-09',2,'Growth support'),
(115,'Grass',2.5,530,'2024-01-09',2,'Daily feeding'),
(116,'Hay',2.2,900,'2024-01-10',2,'Digestive support'),
(117,'Concentrate',1.4,1180,'2024-01-10',2,'Milk enhancement'),
(118,'Grass',2.8,560,'2024-01-11',2,'Routine feeding'),
(119,'Grain Mix',1.5,1080,'2024-01-12',2,'Weight gain'),
(120,'Grass',2.4,510,'2024-01-13',2,'Healthy feeding'),
#WEEK 3
(121,'Grass',2.6,520,'2024-01-15',3,'Routine feeding'),
(122,'Concentrate',1.5,1220,'2024-01-15',3,'Milk production'),
(123,'Hay',2.0,830,'2024-01-15',3,'Breeding diet'),
(124,'Grain Mix',1.4,1070,'2024-01-16',3,'Growth support'),
(125,'Grass',2.7,550,'2024-01-16',3,'Routine feeding'),
(126,'Hay',2.3,910,'2024-01-17',3,'Digestive health'),
(127,'Concentrate',1.2,1160,'2024-01-17',3,'Milk support'),
(128,'Grass',2.9,570,'2024-01-18',3,'Healthy feeding'),
(129,'Grain Mix',1.5,1090,'2024-01-19',3,'Breeding nutrition'),
(130,'Grass',2.5,520,'2024-01-20',3,'Standard feeding'),
#WEEK 4
(131,'Grass',2.5,510,'2024-01-22',4,'Routine feeding'),
(132,'Concentrate',1.4,1200,'2024-01-22',4,'Milk enhancement'),
(133,'Hay',2.1,860,'2024-01-22',4,'Balanced nutrition'),
(134,'Grain Mix',1.3,1060,'2024-01-23',4,'Weight gain'),
(135,'Grass',2.6,540,'2024-01-23',4,'Healthy feeding'),
(136,'Hay',2.4,920,'2024-01-24',4,'Digestive support'),
(137,'Concentrate',1.5,1190,'2024-01-24',4,'Milk support'),
(138,'Grass',2.8,560,'2024-01-25',4,'Routine feeding'),
(139,'Grain Mix',1.4,1080,'2024-01-26',4,'Growth support'),
(140,'Grass',2.5,520,'2024-01-27',4,'Standard feeding'),
#WEEK 5
(141,'Grass',2.6,530,'2024-01-29',5,'Routine feeding'),
(142,'Concentrate',1.5,1230,'2024-01-29',5,'Milk support'),
(143,'Hay',2.2,870,'2024-01-29',5,'Balanced nutrition'),
(144,'Grain Mix',1.4,1090,'2024-01-30',5,'Weight gain'),
(145,'Grass',2.7,550,'2024-01-30',5,'Healthy feeding'),
(146,'Hay',2.3,910,'2024-01-31',5,'Digestive support'),
(147,'Concentrate',1.6,1200,'2024-01-31',5,'Milk enhancement'),
(148,'Grass',2.8,570,'2024-02-01',5,'Routine feeding'),
(149,'Grain Mix',1.5,1100,'2024-02-02',5,'Growth support'),
(150,'Grass',2.5,520,'2024-02-03',5,'Standard feeding'),
#WEEK 6
(151,'Grass',2.7,540,'2024-02-05',6,'Routine feeding'),
(152,'Concentrate',1.5,1240,'2024-02-05',6,'Milk support'),
(153,'Hay',2.1,860,'2024-02-05',6,'Breeding nutrition'),
(154,'Grain Mix',1.4,1080,'2024-02-06',6,'Weight gain'),
(155,'Grass',2.6,550,'2024-02-06',6,'Routine feeding'),
(156,'Hay',2.4,920,'2024-02-07',6,'Digestive support'),
(157,'Concentrate',1.5,1180,'2024-02-07',6,'Milk enhancement'),
(158,'Grass',2.9,580,'2024-02-08',6,'Healthy feeding'),
(159,'Grain Mix',1.6,1110,'2024-02-09',6,'Growth support'),
(160,'Grass',2.5,530,'2024-02-10',6,'Standard feeding'),
#WEEK 7
(161,'Grass',2.6,540,'2024-02-12',7,'Routine feeding'),
(162,'Concentrate',1.6,1250,'2024-02-12',7,'Milk production'),
(163,'Hay',2.2,880,'2024-02-12',7,'Balanced nutrition'),
(164,'Grain Mix',1.5,1100,'2024-02-13',7,'Weight gain'),
(165,'Grass',2.8,560,'2024-02-13',7,'Healthy feeding'),
(166,'Hay',2.3,930,'2024-02-14',7,'Digestive support'),
(167,'Concentrate',1.4,1190,'2024-02-14',7,'Milk support'),
(168,'Grass',2.9,590,'2024-02-15',7,'Routine feeding'),
(169,'Grain Mix',1.5,1120,'2024-02-16',7,'Growth support'),
(170,'Grass',2.5,540,'2024-02-17',7,'Standard feeding'),
#WEEK 8
(171,'Grass',2.7,550,'2024-02-19',8,'Routine feeding'),
(172,'Concentrate',1.5,1260,'2024-02-19',8,'Milk enhancement'),
(173,'Hay',2.1,870,'2024-02-19',8,'Breeding support'),
(174,'Grain Mix',1.4,1090,'2024-02-20',8,'Weight gain'),
(175,'Grass',2.8,570,'2024-02-20',8,'Healthy feeding'),
(176,'Hay',2.4,940,'2024-02-21',8,'Digestive support'),
(177,'Concentrate',1.5,1200,'2024-02-21',8,'Milk support'),
(178,'Grass',2.9,600,'2024-02-22',8,'Routine feeding'),
(179,'Grain Mix',1.6,1130,'2024-02-23',8,'Growth support'),
(180,'Grass',2.6,550,'2024-02-24',8,'Standard feeding'),
#WEEK 9
(181,'Grass',2.7,560,'2024-02-26',9,'Routine feeding'),
(182,'Concentrate',1.6,1270,'2024-02-26',9,'Milk production'),
(183,'Hay',2.2,890,'2024-02-26',9,'Balanced nutrition'),
(184,'Grain Mix',1.5,1110,'2024-02-27',9,'Weight gain'),
(185,'Grass',2.8,580,'2024-02-27',9,'Healthy feeding'),
(186,'Hay',2.3,950,'2024-02-28',9,'Digestive support'),
(187,'Concentrate',1.4,1210,'2024-02-28',9,'Milk enhancement'),
(188,'Grass',3.0,610,'2024-02-29',9,'Routine feeding'),
(189,'Grain Mix',1.6,1140,'2024-03-01',9,'Growth support'),
(190,'Grass',2.6,560,'2024-03-02',9,'Standard feeding'),
#WEEK 10
(191,'Grass',2.8,570,'2024-03-04',10,'Routine feeding'),
(192,'Concentrate',1.6,1280,'2024-03-04',10,'Milk support'),
(193,'Hay',2.2,900,'2024-03-04',10,'Breeding nutrition'),
(194,'Grain Mix',1.5,1120,'2024-03-05',10,'Weight gain'),
(195,'Grass',2.9,590,'2024-03-05',10,'Healthy feeding'),
(196,'Hay',2.4,960,'2024-03-06',10,'Digestive support'),
(197,'Concentrate',1.5,1220,'2024-03-06',10,'Milk enhancement'),
(198,'Grass',3.0,620,'2024-03-07',10,'Routine feeding'),
(199,'Grain Mix',1.6,1150,'2024-03-08',10,'Growth support'),
(200,'Grass',2.7,570,'2024-03-09',10,'Standard feeding');

INSERT INTO health_records
(goat_id, condition_name, treatment, medication, vet_name, record_date, status)
VALUES

(117,'Worm Infestation','Deworming treatment administered','Albendazole','Dr. Musa','2024-01-02','Recovered'),
(144,'Fever','Antibiotics and hydration therapy','Oxytetracycline','Dr. Aisha','2024-01-03','Recovered'),
(108,'Diarrhea','Fluid replacement and medication','Sulfadimidine','Dr. John','2024-01-04','Under Treatment'),
(162,'Foot Rot','Hoof cleaning and antibiotic treatment','Penicillin','Dr. Musa','2024-01-05','Recovered'),
(129,'Cough Infection','Respiratory treatment administered','Tylosin','Dr. Aisha','2024-01-06','Under Treatment'),

(191,'Skin Infection','Topical treatment applied','Ivermectin','Dr. John','2024-01-07','Recovered'),
(103,'Pneumonia','Respiratory antibiotic therapy','Tylosin','Dr. Musa','2024-01-08','Critical'),
(155,'Worm Infestation','Deworming treatment administered','Albendazole','Dr. Aisha','2024-01-09','Recovered'),
(178,'Diarrhea','Oral rehydration treatment','Sulfadimidine','Dr. John','2024-01-10','Recovered'),
(112,'Fever','Medication and hydration therapy','Oxytetracycline','Dr. Musa','2024-01-11','Recovered'),

(136,'Foot Rot','Hoof treatment and cleaning','Penicillin','Dr. Aisha','2024-01-12','Recovered'),
(184,'Skin Infection','Topical medication administered','Ivermectin','Dr. John','2024-01-13','Under Treatment'),
(105,'Cough Infection','Respiratory support treatment','Tylosin','Dr. Musa','2024-01-14','Recovered'),
(167,'Worm Infestation','Deworming therapy','Albendazole','Dr. Aisha','2024-01-15','Recovered'),
(141,'Pneumonia','Antibiotic respiratory treatment','Tylosin','Dr. John','2024-01-16','Critical'),

(190,'Diarrhea','Fluid replacement therapy','Sulfadimidine','Dr. Musa','2024-01-17','Recovered'),
(122,'Fever','Hydration and antibiotics','Oxytetracycline','Dr. Aisha','2024-01-18','Recovered'),
(173,'Skin Infection','Topical treatment applied','Ivermectin','Dr. John','2024-01-19','Recovered'),
(118,'Foot Rot','Antibiotic hoof treatment','Penicillin','Dr. Musa','2024-01-20','Under Treatment'),
(196,'Cough Infection','Respiratory medication','Tylosin','Dr. Aisha','2024-01-21','Recovered'),

(111,'Worm Infestation','Deworming treatment','Albendazole','Dr. John','2024-01-22','Recovered'),
(159,'Fever','Medication and hydration support','Oxytetracycline','Dr. Musa','2024-01-23','Recovered'),
(133,'Diarrhea','Fluid therapy treatment','Sulfadimidine','Dr. Aisha','2024-01-24','Under Treatment'),
(188,'Skin Infection','Topical medication treatment','Ivermectin','Dr. John','2024-01-25','Recovered'),
(106,'Pneumonia','Respiratory therapy administered','Tylosin','Dr. Musa','2024-01-26','Critical');

INSERT INTO vaccination
(goat_id, vaccine_name, disease_target, dose, vet_name, vaccination_date, next_due_date, status, notes)
VALUES

(102,'PPR Vaccine','Peste des Petits Ruminants','1ml','Dr. Musa','2024-01-05','2024-07-05','Completed','First dose'),
(105,'Anthrax Vaccine','Anthrax','1ml','Dr. Aisha','2024-01-06','2024-07-06','Completed','Routine vaccination'),
(107,'PPR Vaccine','PPR','1ml','Dr. John','2024-01-07','2024-07-07','Completed','Stable goat'),
(112,'Tetanus Vaccine','Tetanus','0.5ml','Dr. Musa','2024-01-08','2024-07-08','Completed','Preventive'),

(117,'PPR Vaccine','PPR','1ml','Dr. Aisha','2024-01-09','2024-07-09','Completed','Healthy goat'),
(122,'Rabies Vaccine','Rabies','1ml','Dr. John','2024-01-10','2024-07-10','Completed','Safety measure'),
(129,'Anthrax Vaccine','Anthrax','1ml','Dr. Musa','2024-01-11','2024-07-11','Completed','Routine'),

(133,'PPR Vaccine','PPR','1ml','Dr. Aisha','2024-01-12','2024-07-12','Completed','Good health'),
(141,'Tetanus Vaccine','Tetanus','0.5ml','Dr. John','2024-01-13','2024-07-13','Completed','Preventive care'),
(155,'Rabies Vaccine','Rabies','1ml','Dr. Musa','2024-01-14','2024-07-14','Completed','Standard shot'),

(162,'PPR Vaccine','PPR','1ml','Dr. Aisha','2024-01-15','2024-07-15','Completed','Booster given'),
(167,'Anthrax Vaccine','Anthrax','1ml','Dr. John','2024-01-16','2024-07-16','Completed','Routine'),
(173,'Tetanus Vaccine','Tetanus','0.5ml','Dr. Musa','2024-01-17','2024-07-17','Completed','Healthy goat'),

(178,'PPR Vaccine','PPR','1ml','Dr. Aisha','2024-01-18','2024-07-18','Completed','Good response'),
(184,'Rabies Vaccine','Rabies','1ml','Dr. John','2024-01-19','2024-07-19','Completed','Preventive'),

(191,'Anthrax Vaccine','Anthrax','1ml','Dr. Musa','2024-01-20','2024-07-20','Completed','Routine vaccination'),
(196,'PPR Vaccine','PPR','1ml','Dr. Aisha','2024-01-21','2024-07-21','Completed','Stable condition');

INSERT INTO expenses
(expense_type, goat_id, amount, expense_date, description, week_number, recorded_by)
VALUES

('Feed',NULL,50000,'2024-01-07','Weekly feed purchase',1,'Manager'),
('Veterinary',117,8000,'2024-01-08','Treatment for fever',1,'Dr. Musa'),
('Medication',102,3500,'2024-01-08','Deworming drugs',1,'Dr. Aisha'),
('Labor',NULL,20000,'2024-01-09','Worker salary',1,'Admin'),
('Transport',NULL,12000,'2024-01-10','Feed delivery',1,'Logistics'),

('Feed',NULL,52000,'2024-01-14','Weekly feed stock',2,'Manager'),
('Veterinary',107,9000,'2024-01-15','Pneumonia treatment',2,'Dr. John'),
('Medication',112,4000,'2024-01-15','Vaccination support drugs',2,'Dr. Musa'),
('Labor',NULL,20000,'2024-01-16','Farm workers payment',2,'Admin'),
('Equipment',NULL,15000,'2024-01-17','Repair of feeding tools',2,'Manager'),

('Feed',NULL,48000,'2024-01-21','Feed purchase',3,'Manager'),
('Veterinary',122,7500,'2024-01-22','Health check-up',3,'Dr. Aisha'),
('Medication',129,3200,'2024-01-22','Antibiotics',3,'Dr. John'),
('Transport',NULL,10000,'2024-01-23','Market delivery',3,'Logistics'),
('Labor',NULL,20000,'2024-01-24','Staff salary',3,'Admin'),

('Feed',NULL,53000,'2024-01-28','Feed supply',4,'Manager'),
('Veterinary',141,8500,'2024-01-29','Foot rot treatment',4,'Dr. Musa'),
('Medication',133,3000,'2024-01-29','Deworming drugs',4,'Dr. Aisha'),
('Equipment',NULL,18000,'2024-01-30','Fence maintenance',4,'Manager'),
('Labor',NULL,20000,'2024-01-31','Workers payment',4,'Admin');
