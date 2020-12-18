FROM ubuntu:latest
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y 
#; apt-get install -y slic3r
RUN apt-get install -y python3-yaml git python3-pip
RUN pip3 install git+https://github.com/0k/shyaml@master
# RUN slic3r --version

ADD slice.py /home/slice.py

#ENTRYPOINT ["python3"]
#CMD ["/home/slice.py"]


ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
