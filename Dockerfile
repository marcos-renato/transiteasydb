# Use a imagem oficial do MariaDB
FROM mariadb:latest

# Copie o arquivo SQL com os scripts para criar as tabelas para dentro do contêiner
COPY ./scripts_sql/ . /docker-entrypoint-initdb.d/

# Definindo a senha do root do MariaDB
ENV MYSQL_ROOT_PASSWORD=12345678
ENV MYSQL_DATABASE=transiteasydb

# Isso executa o comando para criar o banco de dados assim que o contêiner for iniciado
RUN echo "CREATE DATABASE IF NOT EXISTS transiteasydb;" > /docker-entrypoint-initdb.d/init_database.sql

# Expondo a porta 3306 para acesso externo, se necessário
EXPOSE 3306

# Comando para iniciar o MariaDB ao iniciar o contêiner
CMD ["mysqld"]
