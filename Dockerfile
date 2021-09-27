FROM python:3.9.0

WORKDIR /home/

RUN echo 'fdsasdf'

RUN git clone https://github.com/minjeong00/web_class.git

WORKDIR /home/web_class/

# RUN echo "SECRET_KEY=django-insecure-=mi74-f9)68h(1l3flz1tts3t@(((1zdsyk18^^w0@vhjqls94" > .env

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN pip install mysqlclient

EXPOSE 8000

CMD ["bash", "-c", "python manage.py collectstatic --noinput --settings=gis_self.settings.deploy && python manage.py migrate --settings=gis_self.settings.deploy && gunicorn --env DJANGO_SETTINGS_MODULE=gis_self.settings.deploy gis_self.wsgi --bind 0.0.0.0:8000"]