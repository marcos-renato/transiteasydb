# Usando a imagem base do Ubuntu
FROM marcosrenato/transiteasydb:latest

# Atualizando os repositórios e instalando as dependências necessárias


# Copiando os scripts SQL para a pasta /docker-entrypoint-initdb.d/ na imagem
COPY ./seus_scripts_sql/*.sql /docker-entrypoint-initdb.d/

# Definindo a senha do root do MariaDB
ENV MYSQL_ROOT_PASSWORD=12345678

# Expondo a porta 3306 para acesso externo, se necessário
EXPOSE 3306

# Comando para iniciar o MariaDB ao iniciar o contêiner
CMD ["mysqld"]
