FROM debian:bullseye
RUN apt -y update && apt -y install nginx && apt -y install openssl
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=MA/ST=MA/L=Benguerir/O=42/OU=1337/CN=rerayyad.42.fr/UID=rerayyad" 
