FROM ubuntu:latest
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y; apt-get install -y slic3r
RUN apt-get install -y python3-yaml
RUN slic3r --version

ADD slice.py /home/slice.py
CMD ["/home/slice.py"]
ENTRYPOINT ["python3"]

# ADD entrypoint.sh /entrypoint.sh
# RUN chmod +x /entrypoint.sh
# ENTRYPOINT ["/entrypoint.sh"]
