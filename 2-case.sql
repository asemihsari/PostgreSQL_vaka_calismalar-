--WHERE with SUBQUERIES

--Toronto'da bulunan departmanlarda çalışan kişilerin isimleri nelerdir?

select * from employees;
select * from countries;
select * from locations;
select * from departments;

--city : 'Toronto' ismini seç bunun location_id al, 
--departments tablosuna git department_id al,
--sonra employees'e git ilgili departmanda çalışan kişileri bul
select * from locations where city='Toronto'; --location_id alıyoruz burdan.
select * from departments where location_id='1800' -- department_id alıyoruz
select * from employees where department_id= 2 -- department_id filtrele


SELECT *
  FROM employees
 WHERE department_id IN 
 (
        SELECT department_id
          FROM departments
         WHERE location_id IN 
                (
                SELECT location_id
                  FROM locations
                 WHERE city='Toronto'
               )
       )



--1 ve 2 bölgelerinde olan şehirler hangileridir?

SELECT city
  FROM locations
 WHERE country_id IN (
        SELECT country_id
          FROM countries
         WHERE region_id IN (1,2)
       )
;

select * from locations;

select * from countries
WHERE region_id IN (1,2)
;

SELECT * FROM locations
WHERE country_id IN
(
SELECT country_id FROM countries
    WHERE region_id IN (1,2)
)


--Lokasyon ID'si 2400 olan departmanda çalışan kişiler kimlerdir?

--Departments and employees tablosu ile çalışılacak.

SELECT *
  FROM employees
 WHERE department_id IN (
        SELECT department_id
          FROM departments
         WHERE location_id = 2400
       )
;

--Europe bölgesinde konumlanan departmanlarda çalışan kişiler kimlerdir?

SELECT * FROM employees;

--Employees --> Department_id --> Location_id --> Country_id --> Region_id

SELECT *
  FROM employees
 WHERE department_id IN (
        SELECT department_id
          FROM departments
         WHERE location_id IN (
                SELECT location_id
                  FROM locations
                 WHERE country_id IN (
                        SELECT country_id
                          FROM countries
                         WHERE region_id IN (
                                SELECT region_id
                                  FROM regions
                                 WHERE region_name = 'Europe'
                               )
                       )
               )
       )
;


--Region ismi Europe ve Asia olan ülkeler nelerdir?
--Regions(region_name)--> countries(region_id)

SELECT * FROM countries
WHERE region_id IN 
(
    SELECT region_id FROM regions
    WHERE region_name IN ('Europe','Asia')
)


--En düşük maaş ile en yüksek maaş farkı en fazla olan job title hangisidir?

SELECT *,
       max_salary - min_salary AS salary_diff
  FROM jobs
 ORDER BY salary_diff DESC
LIMIT 1;


--%15 zam oranı ile maaşı asgari ücretin altında kalan kişiler kimlerdir?

SELECT 
first_name,
last_name,
salary as current_salary,
salary*1.15 as increased_salary
FROM employees
WHERE (salary*1.15)<8500

