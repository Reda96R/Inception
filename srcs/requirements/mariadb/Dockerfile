FROM debian:bullseye

ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD

RUN apt update -y && apt upgrade -y
RUN apt install -y vim
RUN apt install -y mariadb-server

RUN	mkdir -p /var/lib/mysql /var/run/mysqld
RUN	chown -R mysql:mysql /var/lib/mysql /var/run/mysqld
RUN	chmod 777 /var/run/mysqld

#::::::::::::::::::::::::::::::::::Config:::::::::::::::::::::::::::
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

#::::::::::::::::::::::::::::::::::Setup:::::::::::::::::::::::::::
COPY tools/script.sh /script.sh
RUN chmod +x script.sh
RUN bash /script.sh

EXPOSE      3306

ENTRYPOINT  [ "mysqld_safe" ]
