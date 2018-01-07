FROM httpd:2.4
#FROM ubuntu:latest
RUN apt-get update && apt-get install -y \
      build-essential \
      apache2 \
      libapache2-mod-proxy-html \
      libxml2-dev \
      curl


# enable the proxy modules
RUN a2enmod proxy \
			proxy_http \
			proxy_ajp \
			rewrite \
			deflate \
			headers \
			proxy_balancer \
			proxy_connect \
			proxy_html \
      ssl
COPY httpd.conf /usr/local/apache2/conf/
COPY ports.conf /etc/apache2/
#COPY 000-default.conf /etc/apache2/sites-available/
RUN chmod -R 777 /var/run /usr/local/apache2/
EXPOSE 8080
#CMD ["/etc/init.d/apache2","start"]
