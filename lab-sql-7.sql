-- Create a table rentals_may to store the data from rental table with information for the month of May.

CREATE TEMPORARY TABLE SAKILA.RENTALS_MAY AS
SELECT *
FROM SAKILA.RENTAL; 

SELECT RENTAL_DATE,
CONVERT(RENTAL_DATE, date) AS DATE_CONVERTED,
DATE_FORMAT(CONVERT(RENTAL_DATE, DATE), '%Y-%M-%D') RENTAL_INFO,
CASE WHEN DATE_FORMAT(CONVERT(RENTAL_DATE, DATE), '%M') IN ('May') THEN 'INFO MAY'
ELSE 'Other Month' END AS new_column
FROM SAKILA.RENTALS_MAY;


-- Insert values in the table rentals_may using the table rental, filtering values only for the month of May.

SELECT *
FROM SAKILA.RENTALS_MAY;

-- Create a table rentals_june to store the data from rental table with information for the month of June.
CREATE TEMPORARY TABLE SAKILA.RENTALS_JUNE AS
SELECT *
FROM SAKILA.RENTAL; 

SELECT RENTAL_DATE,
CONVERT(RENTAL_DATE, date) AS DATE_CONVERTED,
DATE_FORMAT(CONVERT(RENTAL_DATE, DATE), '%Y-%M-%D') RENTAL_INFO,
CASE WHEN DATE_FORMAT(CONVERT(RENTAL_DATE, DATE), '%M') IN ('June') THEN 'RENTAL JUNE'
ELSE 'Other Month' END AS new_column
FROM SAKILA.RENTALS_JUNE
;

-- Insert values in the table rentals_june using the table rental, filtering values only for the month of June.
SELECT * 
FROM SAKILA.RENTALS_JUNE;

-- Check the number of rentals for each customer for May.
SELECT CUSTOMER_ID, COUNT(RENTAL_ID) AS RENTAL_PER_CUSTOMER
FROM SAKILA.RENTALS_MAY
GROUP BY 1
ORDER BY 2;

-- -- Check the number of rentals for each customer for June.
SELECT CUSTOMER_ID, COUNT(RENTAL_ID) AS RENTAL_PER_CUSTOMER
FROM SAKILA.RENTALS_JUNE
GROUP BY 1
ORDER BY 2;
