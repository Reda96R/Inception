FROM debian:bullseye

RUN apt update -y && apt upgrade -y
RUN apt install -y vim
RUN apt install -y mariadb-server mariadb-client

RUN	mkdir -p /var/lib/mysql /var/run/mysqld
RUN	chown -R mysql:mysql /var/lib/mysql /var/run/mysqld
RUN	chmod 777 /var/run/mysqld

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/script.sh /script.sh
RUN chmod +x script.sh
RUN bash /script.sh

EXPOSE      3306

ENTRYPOINT  [ "mysqld_safe" ]
