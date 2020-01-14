FROM python:3.6

ENV TZ=UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install cron -y --no-install-recommends

WORKDIR /usr/src/app
COPY ./ ./
RUN pip install -r requirements.txt
CMD ["python", "main.py"]
