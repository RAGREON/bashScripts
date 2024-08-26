#!/bin/bash

# Creating a new directory to start our project

mkdir django_project
cd django_project

# Creating virtual environment

python -m venv venv
source venv/Scripts/activate

# Installing django

pip install django

# Writing requirements 

pip freeze > venv/requirements.txt

# Creating project

django-admin startproject mysite
cd mysite

# Creating poll app

python manage.py startapp polls

# Migrating

python manage.py migrate