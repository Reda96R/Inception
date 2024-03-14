FROM debian:bullseye
RUN apt update -y && apt upgrade -y
RUN apt install -y vim && apt install -y curl
RUN apt install -y mariadb-server
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/script.sh /script.sh
# ENTRYPOINT ["bash", "script.sh"]
