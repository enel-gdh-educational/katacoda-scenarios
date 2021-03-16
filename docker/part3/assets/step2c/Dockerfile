FROM python:3.7

RUN pip install fastapi uvicorn scikit-learn==0.22.2.post1 joblib

EXPOSE 80

COPY ./app /app

CMD ["uvicorn", "app.api:app", "--host", "0.0.0.0", "--port", "80"]