#!/bin/bash

PATH="/usr/bin:/usr/sbin"

SECRET_KEY=${SECRET_KEY}

python /home/django-app/code/glucosetracker/manage.py syncdb --noinput
python /home/django-app/code/glucosetracker/manage.py migrate
python /home/django-app/code/glucosetracker/manage.py runserver 0.0.0.0:${PORT}

