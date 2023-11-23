FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    mariadb-server \
    curl

COPY ./scripts_sql/*.sql /docker-entrypoint-initdb.d/

ENV MYSQL_ROOT_PASSWORD=12345678

EXPOSE 3306

CMD ["mysqld"]