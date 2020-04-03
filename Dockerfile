FROM python:3.7.6
ENV PORT 80
COPY ./requirements.txt /app/requirements.txt
WORKDIR /app
RUN pip install -r requirements.txt
COPY ./app/ /app/
ENTRYPOINT [ "python" ]
CMD [ "app.py" ]