#!/usr/bin/python
# -*- coding: utf-8 -*-
import psycopg2
from Employer import Employers
from Vacancies import Vacancies

# Создаем класс DBManager, который будет подключаться к БД Postgres и выполнять отдельные запросыб указанные ниже.
class DBManager:

    def __init__(self):
        pass

    def get_companies_and_vacancies_count(self):
        """Получает список всех компаний и количество вакансий у каждой компании."""
        conn = psycopg2.connect (
            host="localhost",
            dbname="hh_db",
            user="postgres",
            password="Bension1904++")
        cur = conn.cursor ( )
        cur.execute ("SELECT company_name, open_vacancies FROM employers")
        myresult = cur.fetchall ( )
        for row in myresult :
            print(row)
        conn.commit ( )
        cur.close ( )
        conn.close ( )

    def get_all_vacancies(self):
        """Получает список всех вакансий с указанием названия компании, названия вакансии и зарплаты и ссылки на вакансию."""
        conn = psycopg2.connect (
            host="localhost",
            dbname="hh_db",
            user="postgres",
            password="Bension1904++")
        cur = conn.cursor ( )
        cur.execute ("SELECT vacancy_name, employers.company_name, salary, url_vacancy FROM vacancies INNER JOIN employers USING(employer_id)")
        myresult = cur.fetchall ( )
        for row in myresult :
            print(row)
        conn.commit ( )
        cur.close ( )
        conn.close ( )

    def get_avg_salary(self):
        """Получает среднюю зарплату по вакансиям."""
        conn = psycopg2.connect (
            host="localhost",
            dbname="hh_db",
            user="postgres",
            password="Bension1904++")
        cur = conn.cursor ( )
        cur.execute ("SELECT AVG(salary) FROM vacancies")
        myresult = cur.fetchall ( )
        print(myresult)
        conn.commit ( )
        cur.close ( )
        conn.close ( )

    def get_vacancies_with_higher_salary(self):
        """Получает список всех вакансий, у которых зарплата выше средней по всем вакансиям."""
        conn = psycopg2.connect (
            host="localhost",
            dbname="hh_db",
            user="postgres",
            password="Bension1904++")
        cur = conn.cursor ( )
        cur.execute ("SELECT vacancy_name FROM vacancies WHERE salary > (SELECT AVG(salary) FROM vacancies)")
        myresult = cur.fetchall ( )
        for row in myresult :
            print (row)
        conn.commit ( )
        cur.close ( )
        conn.close ( )

    def get_vacancies_with_keyword(self):
        """Получает список всех вакансий, в названии которых содержатся переданное слово 'газ'"""
        conn = psycopg2.connect (
            host="localhost",
            dbname="hh_db",
            user="postgres",
            password="Bension1904++")
        cur = conn.cursor ( )
        cur.execute ("SELECT vacancy_name FROM vacancies WHERE vacancy_name LIKE '%газ%'")
        myresult = cur.fetchall ( )
        for row in myresult :
            print (row)
        conn.commit ( )
        cur.close ( )
        conn.close ( )

