--Marketing departmanında çalışan kişilerin isim-soyisim, telefon numarası, email ve departman id bilgilerini getirin.
SELECT concat(first_name,' ',last_name) AS name,
       phone_number,
       email,
       department_id
  FROM employees
 WHERE department_id IN (
        SELECT department_id
          FROM departments
         WHERE department_name = 'Marketing'
       )

--5 idli departmanda çalışan kişilerin isim-soyisim, telefon numarası, email ve departman id bilgilerini getirin.

SELECT concat(first_name,' ',last_name) AS name,
       phone_number,
       email,
       department_id
  FROM employees
 WHERE department_id = 5

--Kişileri kullandıkları telefon numaralarının ilk 3 hanesine göre segmente edin.

SELECT 
DISTINCT (LEFT(phone_number,3)) AS gsm_op
FROM employees;

SELECT first_name,
       last_name,
       CASE WHEN (left(phone_number,3)) = '515' THEN '515 Op'
            WHEN (left(phone_number,3)) = '590' THEN '590 Op'
            WHEN (left(phone_number,3)) = '603' THEN '603 Op'
            WHEN (left(phone_number,3)) = '650' THEN '650 Op'
            ELSE 'Other Op'
             END AS gsm_segment
  FROM employees;


--3 idli departmanda en yüksek maaş alan 3 kişi kimdir?

SELECT *
  FROM employees
 WHERE department_id = 3
 ORDER BY salary DESC
 LIMIT 3
 
 
--13 job_id li en düşük maaş alan 2 kişi kimdir?

SELECT *
  FROM employees
 WHERE job_id = 13
 ORDER BY salary 
 LIMIT 2

--Telefon no 650 kodu ile başlayan kişilerden kaçı 1997'de işe girmiştir?

SELECT * 
FROM employees
WHERE phone_number LIKE '650%'
AND hire_date BETWEEN '1997-01-01' AND '1997-12-31'

--100 id'li managerin ekibinde çalışan ve telefon kodu 515 ile başlayan kişilerin id, isim ve soyisimi nedir?

SELECT employee_id,
       first_name,
       last_name
  FROM employees
 WHERE manager_id = 100
   AND phone_number LIKE '515%'


--Job title'i programmer olan kişiler kimlerdir? 
--Zorunlu değil.

SELECT concat(first_name,' ',last_name) AS name,
       phone_number,
       email,
       department_id
  FROM employees
 WHERE job_id IN (
        SELECT job_id
          FROM jobs
         WHERE job_title = 'Programmer'
       )
