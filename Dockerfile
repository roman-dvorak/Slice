FROM ubuntu:latest-slim

RUN sudo apt-get update -y
RUN sudo apt-get install -y slic3r
RUN slic3r --version

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
