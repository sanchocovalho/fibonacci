FROM python:3.7.6

ENV PORT 8081

COPY ./requirements.txt /app/requirements.txt
WORKDIR /app
RUN pip install -r requirements.txt

COPY ./app/__init__.py /app/__init__.py
COPY ./app/app.py /app/app.py
COPY ./app/fibonacci.py /app/fibonacci.py
COPY ./app/templates/base.html /app/templates/base.html
COPY ./app/templates/index.html /app/templates/index.html
COPY ./app/templates/404.html /app/templates/404.html
COPY ./app/templates/get.html /app/templates/get.html
COPY ./app/static/css/bootstrap.min.css /app/static/css/bootstrap.min.css
COPY ./app/static/css/bootstrap.min.css.map /app/static/css/bootstrap.min.css.map
COPY ./app/static/css/404.css /app/static/css/404.css
COPY ./app/static/css/style.css /app/static/css/style.css
COPY ./app/static/font/consolas.ttf /app/static/font/consolas.ttf
COPY ./app/static/icon/logo.png /app/static/icon/logo.png
COPY ./app/static/js/jquery-3.4.1.min.js /app/static/js/jquery-3.4.1.min.js

ENTRYPOINT [ "python" ]
CMD [ "app.py" ]