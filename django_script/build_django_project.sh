#!/bin/bash


# Function to overwrite / add python files to respective directories

function add_file() {
    # replacing the comma in the filename with a forward slash
    # ',' -> '/'

    local path=${1/,//}

    # redirecting file content from actual path location to modifed path

    cat "$1" > $path
}

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

# Adding files to our project

for file in ./python_scripts/*; do
    add_file