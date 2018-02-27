FROM ubuntu:latest
MAINTAINER Matthew Ramsey "matthew.ramsey@live.com"
RUN apt-get update -y
RUN apt-get install -y python-pip python-dev build-essential
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
ENTRYPOINT ["python"]
CMD ["app/app.py"]
EXPOSE 5000