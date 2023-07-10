-- �������, ��������� � ������ �������� ������:

--1. ������� ������� employers
CREATE TABLE employers (
                    employer_id SERIAL PRIMARY KEY,
                    company_name VARCHAR NOT NULL,
                    url_vacancies TEXT,
                    open_vacancies VARCHAR)

--2. ��������� ������ �� ����� employers.json � ������� SQL.
INSERT INTO employers(employer_id, company_name, url_vacancies, open_vacancies) VALUES(%s,%s,%s,%s), employers.json)

--3. ������� ������� vacancies
CREATE TABLE vacancies (
                    vacancy_id SERIAL PRIMARY KEY,
                    employer_id INT,
                    vacancy_name VARCHAR NOT NULL,
                    salary INT,
                    url_vacancy TEXT,

                    CONSTRAINT fk_vacancies_employers FOREIGN KEY(employer_id) REFERENCES employers(employer_id)
                )
--4.�������� ������ ���� �������� � ���������� �������� � ������ ��������.
SELECT company_name, open_vacancies FROM employers

--5. �������� ������ ���� �������� � ��������� �������� ��������, �������� �������� � �������� � ������ �� ��������.
SELECT vacancy_name, employers.company_name, salary, url_vacancy FROM vacancies INNER JOIN employers USING(employer_id)

--6. �������� ������� �������� �� ���������.
SELECT AVG(salary) FROM vacancies

--7. �������� ������ ���� ��������, � ������� �������� ���� ������� �� ���� ���������.
SELECT vacancy_name FROM vacancies WHERE salary > (SELECT AVG(salary) FROM vacancies)

--8. �������� ������ ���� ��������, � �������� ������� ���������� ���������� ����� '���'
SELECT vacancy_name FROM vacancies WHERE vacancy_name LIKE '%���%'


