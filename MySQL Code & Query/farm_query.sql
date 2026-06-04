#VIEW ALL DATA
SELECT * FROM goats;

#SHOW SPECIFIC COLUMNS
SELECT goat_id, breed, gender, weight_kg FROM goats;

#COUNT TOTAL GOATS
SELECT COUNT(*) AS Total_goats FROM goats;

#COUNT MALE AND FEMALE GOATS
SELECT gender, COUNT(*) AS total FROM goats
  GROUP BY gender;
  
#COUNT GOATS BY BREED
SELECT breed, COUNT(*) AS Total FROM goats
GROUP BY breed;

#FIND AVERAGE WEIGHT
SELECT avg(weight_kg) AS average_weight FROM goats;

#FIND HEAVIEST GOAT
SELECT * FROM goats
WHERE weight_kg = (SELECT max(weight_kg) FROM goats);

#FIND LIGHTEST GOAT
SELECT * FROM goats
WHERE weight_kg = (SELECT min(weight_kg) FROM goats);

#SHOW GOATS ABOVE 30kg WEIGHT
SELECT * FROM goats
WHERE weight_kg > 30;

#SHOW FEMALE GOATS
SELECT * FROM goats
WHERE gender = "Female";

#SHOW MALE GOATS
SELECT * FROM goats
WHERE gender = "Male";

#SHOW INACTIVE GOATS
SELECT * FROM goats
WHERE status = "Inactive";

#SORT GOATS BY WEIGHT (HIGHEST TO LOWEST)
SELECT * FROM goats
ORDER BY weight_kg DESC;

#COUNT GOAT PER FARMER
SELECT farmer_id, COUNT(*) AS total_goats FROM goats
GROUP BY farmer_id;

#FIND AVERAGE WEIGHT PER BREED
SELECT breed, AVG(weight_kg) AS avg_weight FROM goats
GROUP BY breed;

#FIND TOTAL WEIGHT PER BREED
SELECT breed, SUM(weight_kg) AS total_weight FROM goats
GROUP BY breed;

#YOUNGEST GOAT
SELECT * FROM goats
ORDER BY birth_date DESC 
LIMIT 1;

#OLDEST GOAT
SELECT * FROM goats
ORDER BY birth_date ASC  
LIMIT 1;

#CALCULATE GOAT AGE
SELECT goat_id, 
	tag_number,
    timestampdiff(YEAR, birth_date, 
    CURDATE()) AS age_years 
FROM goats;
		
#SHOW GOATS OLDER THAN 2 YEARS
SELECT * FROM goats
WHERE TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) > 2;

#SEARCH FOR BOER BREED
SELECT * FROM goats 
WHERE breed = "Boer";

#SEARCH FOR COLOR
SELECT * FROM goats 
WHERE color = "White";

#COUNT BY PURPOSE
SELECT purpose, COUNT(*) FROM goats 
GROUP BY purpose;

#FIND DUPLICATE TAG NUMBER
SELECT tag_number, COUNT(*) FROM goats
GROUP BY tag_number
HAVING COUNT(*) > 1;

#SHOW RECENTLY ACQUIRED GOATS
SELECT * FROM goats
ORDER BY acquisition_date DESC;

#JOIN WITH MEDICATION TABLE
SELECT goats.tag_number, 
goats.breed, 
health_records.medication, 
health_records.record_date
FROM goats
JOIN health_records
ON goats.goat_id = health_records.goat_id;

#FIND MOST FEED CONSUMED
SELECT feed_type, SUM(quantity_kg) AS Total_consumption
FROM feed
GROUP BY feed_type;

#COUNT ACTIVE GOATS
SELECT COUNT(*) AS active_goats FROM goats
GROUP BY  status;

 #PERCENTAGE OF FEMALE GOATS
 SELECT (SUM(CASE WHEN gender = "Female" THEN 1 ELSE 0 END) /
 COUNT(*)) *
 100 AS female_percentage FROM goats;
 
 #MONTHLY GOAT REGISTRATION
 SELECT MONTH(acquisition_date) AS month,
 COUNT(*) AS total 
 FROM goats
 GROUP BY MONTH(acquisition_date);
 
#GOAT ABOVE AVERAGE WEIGHT
SELECT * FROM goats
 WHERE weight_kg > 
 (SELECT AVG(weight_kg) FROM goats);
 
#HEAVIEST GOAT
SELECT * FROM goats 
 WHERE weight_kg = (SELECT MAX(weight_kg) FROM goats);
 
#LIGHTEST WEIGHT
SELECT * FROM goats 
 WHERE weight_kg = (SELECT MIN(weight_kg) FROM goats);
 
#OLDEST GOAT
SELECT * FROM goats 
 WHERE birth_date = 
 (SELECT MIN(birth_date) FROM goats);
 
#YOUNGEST GOAT
SELECT * FROM goats 
 WHERE birth_date = 
 (SELECT MAX(birth_date) FROM goats);
 
#FARMER WITH MORE THAN 5 GOATS
SELECT * FROM goats
WHERE farmer_id IN
(SELECT farmer_id FROM goats
GROUP BY farmer_id
HAVING COUNT(*) > 5);

#OLDEST STAFF
SELECT * FROM farmers
WHERE hire_date = 
(SELECT MIN(hire_date) FROM farmers);

#YOUNGEST STAFF
SELECT * FROM farmers
WHERE hire_date = 
(SELECT MAX(hire_date) FROM farmers); 

#FARMERS WHERE ADDRESS IS LAGOS
SELECT * FROM farmers
WHERE address = "Lagos";

#FARMERS WHERE ROLE IS WORKER
SELECT * FROM farmers
WHERE role = "Worker";

#EXPENSES ABOVE AVERAGE COST
SELECT * FROM expenses
WHERE amount > 
(SELECT AVG(amount) FROM expenses);

#RANK GOAT BY WEIGHT
SELECT goat_id,
		tag_number,
        weight_kg,
        RANK() OVER (ORDER BY weight_kg DESC) AS ranking
        FROM goats;
        
#ROW NUMBER
SELECT goat_id,
		tag_number,
        ROW_NUMBER() OVER (ORDER BY goat_id) AS row_num 
        FROM goats;
        
#DENSE RANK BY WEIGHT
SELECT goat_id,
		weight_kg,
        DENSE_RANK() OVER (ORDER BY weight_kg DESC) AS "dense rank"
        FROM goats;
        
#COUNT GOATS PER BREED
SELECT DISTINCT breed,
        COUNT(*) OVER (PARTITION BY breed) AS breed_total
        FROM GOATS;
        
#AVERAGE WEIGHT PER BREED
SELECT DISTINCT breed,
        AVG(weight_kg)
        OVER (PARTITION BY breed) AS avg_breed_weight
        FROM goats;
        
#RUNNING EXPENSE TOTAL 
SELECT expense_date,
		amount,
        SUM(amount)
        OVER (ORDER BY expense_date) AS running_expense
        FROM expenses;
        
#VACCINATION DATE
SELECT goat_id,
		vaccination_date
        FROM vaccination;

#TOTAL EXPENSE PER CATEGORY
SELECT expense_id,
		expense_type,
        amount,
        SUM(amount)
        OVER (PARTITION BY expense_type) AS total_category_expense
        FROM expenses;
		
#HEAVY GOATS
WITH heavy_goats AS
( SELECT * FROM goats WHERE weight_kg > 35)
SELECT * FROM heavy_goats;

#GOAT AGE ANALYSIS
WITH goat_age AS
( SELECT goat_id,
		tag_number,
        TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) AS age
        FROM goats)
        SELECT * FROM goat_age;
        
#ADULT GOATS
WITH goat_age AS
( SELECT goat_id,
		tag_number,
        TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) AS age FROM goats)
        SELECT * FROM goat_age
        WHERE age >= 2;
        
#BREED SUMMARY
WITH breed_summary AS 
( SELECT breed,
		COUNT(*) AS total_goats FROM goats
        GROUP BY breed)
        SELECT * FROM breed_summary;
        
#EXPENSE SUMMARY
WITH expense_summary AS 
(SELECT expense_type,
		SUM(amount) AS total_amount FROM expenses GROUP BY expense_type)
        SELECT * FROM expense_summary;
        
#ACTIVE GOAT
WITH active_goats AS
( SELECT * FROM goats
WHERE status = "Active")
SELECT * FROM active_goats;

#FEMALE GOATS
WITH female_goats AS
(SELECT * FROM goats
WHERE gender = "Female")
SELECT * FROM female_goats;

 #BREED WITH MORE THAN 25 GOATS
 SELECT breed,
		COUNT(*) AS total_goats 
FROM goats
GROUP BY breed
HAVING COUNT(*) > 25;
        
#FARMERS OWNING MORE THAN 10 GOATS
SELECT farmer_id,
		COUNT(*) AS total_goats
FROM goats
GROUP BY farmer_id
HAVING COUNT(*) > 9;
        
#BREED WITH AVERAGE WEIGHT ABOVE 30KG
SELECT breed,
		AVG(weight_kg) AS avg_weight
FROM goats
GROUP BY breed
HAVING AVG(weight_kg) > 30;

#COLORS APPEARING MORE THAN 10 TIMES
SELECT color,
		COUNT(*) AS total
FROM goats
GROUP BY color
HAVING COUNT(*) > 10;

#PURPOSE CATEGORIES WITH MORE THAN 10 GOATS
SELECT purpose,
		COUNT(*) AS total
FROM goats
GROUP BY purpose
HAVING COUNT(*) > 10;

#FARMERS WITH AVERAGE GOAT WEIGHT ABOVE 35KG
SELECT farmer_id,
		AVG(weight_kg) AS avg_weight
FROM goats
GROUP BY farmer_id
HAVING AVG(weight_kg) > 35;

#WEIGHT GROUPS WITH MORE THAN 1 GOATS
SELECT weight_kg,
		COUNT(*) AS total
FROM goats
GROUP BY weight_kg
HAVING COUNT(*) > 1;

#EXPENSE CATEGORIES ABOVE #50000
SELECT expense_type,
		SUM(amount) AS total_expense
FROM expenses
GROUP BY expense_type
HAVING SUM(amount) > 50000;

#GOATS WITH VACCINATION
SELECT goat_id
FROM vaccination
GROUP BY goat_id
HAVING COUNT(*) > 0;

#BREED WITH MAXIMUM WEIGHT ABOVE 30KG
SELECT breed,
		MAX(weight_kg) AS max_weight
FROM goats
GROUP BY breed
HAVING MAX(weight_kg) > 30;