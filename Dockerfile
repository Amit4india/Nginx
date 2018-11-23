FROM ubuntu:latest
MAINTAINER Amit@RMS

RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -y \
		ca-certificates \
		gcc \
		make \
		libpcre3-dev \
		zlib1g-dev \
		libldap2-dev \
		libssl-dev \
		wget

RUN wget http://nginx.org/download/nginx-1.15.3.tar.gz

RUN tar -xzvf nginx-1.15.3.tar.gz

RUN cd nginx-1.15.3 \
  && ./configure --with-http_auth_request_module \
  && make \
  && make install

RUN echo "daemon off;" >> /usr/local/nginx/conf/nginx.conf
ENV PATH /usr/local/nginx/sbin:$PATH

EXPOSE 80
CMD ["nginx"]
