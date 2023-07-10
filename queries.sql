-- Запросы, сделанные в рамках курсовой работы:

--1. Создаем таблицу employers
CREATE TABLE employers (
                    employer_id SERIAL PRIMARY KEY,
                    company_name VARCHAR NOT NULL,
                    url_vacancies TEXT,
                    open_vacancies VARCHAR)

--2. Загружаем данные из файла employers.json в таблицу SQL.
INSERT INTO employers(employer_id, company_name, url_vacancies, open_vacancies) VALUES(%s,%s,%s,%s), employers.json)

--3. Создаем таблицу vacancies
CREATE TABLE vacancies (
                    vacancy_id SERIAL PRIMARY KEY,
                    employer_id INT,
                    vacancy_name VARCHAR NOT NULL,
                    salary INT,
                    url_vacancy TEXT,

                    CONSTRAINT fk_vacancies_employers FOREIGN KEY(employer_id) REFERENCES employers(employer_id)
                )
--4.Получает список всех компаний и количество вакансий у каждой компании.
SELECT company_name, open_vacancies FROM employers

--5. Получает список всех вакансий с указанием названия компании, названия вакансии и зарплаты и ссылки на вакансию.
SELECT vacancy_name, employers.company_name, salary, url_vacancy FROM vacancies INNER JOIN employers USING(employer_id)

--6. Получает среднюю зарплату по вакансиям.
SELECT AVG(salary) FROM vacancies

--7. Получает список всех вакансий, у которых зарплата выше средней по всем вакансиям.
SELECT vacancy_name FROM vacancies WHERE salary > (SELECT AVG(salary) FROM vacancies)

--8. Получает список всех вакансий, в названии которых содержатся переданное слово 'газ'
SELECT vacancy_name FROM vacancies WHERE vacancy_name LIKE '%газ%'


