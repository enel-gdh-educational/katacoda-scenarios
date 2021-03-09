FROM python:3.7

COPY requirements.txt /requirements.txt

RUN python3 -m pip install --upgrade pip && pip3 install -r /requirements.txt

COPY app /app

COPY model /model

EXPOSE 80

ENTRYPOINT ["uvicorn", "app.api:app", "--host", "0.0.0.0", "--port", "80"]