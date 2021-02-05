FROM ubuntu:latest
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y 
#; apt-get install -y slic3r
RUN apt-get install -y python3-yaml git python3-pip 
RUN apt-get install slic3r snap shyaml
RUN snap install openscad-nightly
# RUN slic3r --version
RUN openscad-nightly --version

ADD slice.py /home/slice.py
ADD merge_slic3r_conf.sh /home/merge_slic3r_conf.sh

#ENTRYPOINT ["python3"]
#CMD ["/home/slice.py"]


ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
RUN chmod +x /home/merge_slic3r_conf.sh
ENTRYPOINT ["/entrypoint.sh"]
