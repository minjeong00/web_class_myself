FROM python:3.9.0

WORKDIR /home/

RUN git clone https://github.com/minjeong00/web_class.git

WORKDIR /home/web_class/

RUN echo "SECRET_KEY=django-insecure-=mi74-f9)68h(1l3flz1tts3t@(((1zdsyk18^^w0@vhjqls94" > .env

RUN pip install -r requirements.txt

RUN python manage.py migrate

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]