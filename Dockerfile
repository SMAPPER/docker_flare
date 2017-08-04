FROM centos:latest

MAINTAINER Justin Henderson justin@hasecuritysolutions.com

RUN yum update
RUN yum install -y python python-devel git gcc
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python get-pip.py
RUN cd /opt && git clone https://github.com/austin-taylor/flare.git
RUN cd /opt/flare && pip install -r requirements.txt
RUN useradd -ms /bin/bash flare
RUN mkdir /var/log/flare
RUN chown flare: /var/log/flare
RUN mkdir /opt/flare/output/
RUN ln -sf /dev/stderr /var/log/flare/flare.log
RUN chown -R flare: /opt/flare
USER flare

STOPSIGNAL SIGTERM

CMD  flare_beacon -c /opt/flare/configs/elasticsearch.ini  --focus_outbound --whois --group --html=/opt/flare/output/
