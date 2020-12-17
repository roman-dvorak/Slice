FROM ubuntu:latest
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y; apt-get install -y slic3r
RUN slic3r --version

ADD slice.py /slice.py
RUN ls .
RUN ls /
RUN cat /slice.py
ENTRYPOINT ["python3 slice.py"]

# ADD entrypoint.sh /entrypoint.sh
# RUN chmod +x /entrypoint.sh
# ENTRYPOINT ["/entrypoint.sh"]
