FROM debian:bullseye
RUN apt -y update && apt -y install nginx && apt -y install openssl
RUN apt -y install vim
#::::::::::::::::::::::::::::::::::SSL cert:::::::::::::::::::::::::::
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/certificate.crt -keyout /etc/nginx/ssl/private.key -subj "/C=MA/ST=MA/L=Benguerir/O=42/OU=1337/CN=rerayyad.42.fr/UID=rerayyad" 

#::::::::::::::::::::::::::::::::::Config:::::::::::::::::::::::::::
COPY conf/rerayyad.conf /etc/nginx/sites-available/rerayyad.conf
RUN ln -s /etc/nginx/sites-available/rerayyad.conf /etc/nginx/sites-enabled/

# EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]
