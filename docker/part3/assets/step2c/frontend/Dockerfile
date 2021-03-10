FROM python:3.7
COPY ./requirements.txt ./requirements.txt
COPY ./fe.py ./fe.py

RUN pip install -r requirements.txt
EXPOSE 8081

CMD [ "python", "./fe.py" ]