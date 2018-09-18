FROM fedora:26

MAINTAINER Marcelo Moreira de Mello <tchello.mello@gmail.com>

ENV PORT 8000

# create django-app user
RUN useradd django-app

# update and install dependencies
RUN dnf clean all && \
    dnf -y update && \
    dnf -y install python python-devel python-pip git \
    python-virtualenv postgresql-devel glibc-devel gcc make iputils net-tools && \
    dnf clean all


# create directory and mount sources there
ADD glucosetracker /home/django-app/code/glucosetracker
ADD start.sh requirements.txt /home/django-app/code/ 
ADD .bashrc /home/django-app/
RUN chmod +x /home/django-app/code/start.sh /home/django-app/code/glucosetracker/manage.py
RUN chown django-app:django-app -R /home/django-app
RUN pip install -r /home/django-app/code/requirements.txt

# set user
USER django-app

# set workdir
WORKDIR /home/django-app/code

# export volume
VOLUME /home/django-app/code

# expose 8000 port
EXPOSE ${PORT}

# define command to start container
ENTRYPOINT ["/bin/bash", "/home/django-app/code/start.sh"]
