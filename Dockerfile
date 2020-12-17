FROM ubuntu:latest

RUN apt-get update -y
RUN apt-get install -y slic3r
RUN slic3r --version

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
