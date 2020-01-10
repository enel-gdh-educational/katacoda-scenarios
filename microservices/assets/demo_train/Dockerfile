FROM python:3.6

ENV TZ=UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install cron -y --no-install-recommends
RUN apt-get -yq update && apt-get -yqq install ssh
RUN apt-get update && apt-get upgrade -y && apt-get install -y git

WORKDIR /usr/src/app
COPY ./ ./
RUN pip install --trusted-host pypi.python.org --trusted-host pypi.org --trusted-host files.pythonhosted.org -r requirements.txt
CMD ["python", "main.py"]