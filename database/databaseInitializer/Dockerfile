FROM python:3
ADD initializer.py /
ADD data /data
ADD init.sql /

RUN pip install psycopg2 tqdm


CMD [ "python", "./initializer.py" ]