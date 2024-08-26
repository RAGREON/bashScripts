#!/bin/bash

# Function to get file content from the repo

function get_git_raw() {
    local username=$1
    local repo_name=$2
    local branch_name=$3
    local file_path=$4

    curl -s "https://raw.githubusercontent.com/$username/$repo_name/$branch_name/$file_path"
}

# Function to overwrite / add python files to respective directories

function add_file() {
    # replacing the comma in the filename with a forward slash
    # ',' -> '/'

    local path=${1/,//}

    # redirecting file content from actual path location to modifed path

    get_git_raw RAGREON bashScripts main "django_script/python_scripts/$1" > $path
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

for file in $(curl -s https://api.github.com/repos/RAGREON/bashScripts/contents/django_script/python_scripts | grep -o '"name": *"[^"]*"' | sed 's/"name": *"\([^"]*\)"/\1/'); do
    add_file "$file"
done