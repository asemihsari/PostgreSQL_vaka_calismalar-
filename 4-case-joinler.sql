--Tüm çalışanlarin isim, soyisim, telefon, departman adi ve deparmanın ülke bilgisini getirin.
SELECT first_name,
last_name,
phone_number,
d.department_name,
l.city
from employees as e
left join departments as d on e.department_id=d.department_id
left join locations as l
on l.location_id=d.location_id
order by city asc


--Her bölgenin kapsadığı ülke isimlerini getirin.
select country_name,
r.region_name
from countries as c
left join regions as r 
on c.region_id=r.region_id
order by region_name asc
--Her çalışanın kişi bilgileri ile birlikte çalıştığı departmanı ve tüm lokasyon bilgilerini getirin.
SELECT
	CONCAT(FIRST_NAME, ' ', LAST_NAME) AS NAME,
	D.DEPARTMENT_NAME,
	L.STREET_ADDRESS,
	L.CITY
FROM
	EMPLOYEES AS E
	LEFT JOIN DEPARTMENTS AS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
	LEFT JOIN LOCATIONS AS L ON L.LOCATION_ID = D.LOCATION_ID ORDER BY
	CITY ASC
--Departman ismi bazlı ortalama maaşları ve çalışan sayısını getirin.
SELECT
	ROUND(AVG(SALARY), 2) AS AVG_SALARY,
	COUNT(EMPLOYEE_ID) AS EMPLOYEE_COUNT,
	DEPARTMENT_NAME
FROM
	EMPLOYEES AS E
	RIGHT JOIN DEPARTMENTS AS D ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
GROUP BY
	DEPARTMENT_NAME
ORDER BY
	DEPARTMENT_NAME ASC
--Her şehirde çalışan kişi sayısını getirin.
select city,
count(distinct employee_id) as total_employee
from employees as e
left join departments as d
on d.department_id=e.department_id
left join locations as l
on l.location_id=d.location_id
group by city
order by city asc
--Her çalışanın maaşı ilgili ünvandaki maksimum maaştan % kaç eksik? Hesaplayın.

--Manager id bazlı ünvan sayısını getirin. En fazla ünvana sahip managerın ekibinde çalışan kişileri getirin.
select job_title,
count(manager_id) as count_m
--e.first_name
from jobs as j
left join employees as e
on j.job_id=e.job_id
group by job_title
order by count_m desc 

group by job_title
order by count_m desc limit 1