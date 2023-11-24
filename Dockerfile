FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    mariadb-server \
    curl

# Criando diretório e dando permissões
RUN mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/run/mysqld && \
    mkdir -p /var/lib/mysql && \
    chown -R mysql:mysql /var/lib/mysql

COPY ./scripts_sql/*.sql /docker-entrypoint-initdb.d/

ENV MYSQL_ROOT_PASSWORD=12345678

EXPOSE 3306

CMD ["mysqld"]