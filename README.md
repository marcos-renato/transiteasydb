# Transiteasydb
Repositorio para criar a imagem do banco de dados no docker(contem dockerfile e scripts sqls)
para ser utilizado nos projetos:
* appTransiteasy
* TransiteasyServrest

## pasta modelos
Pasta que contem os modelo conceitual e o modelo logico criado com o BRmodelo.

## pasta scripts_sql
Pasta que contem os scripts sqls para criar as tabelas

## 1º - executar o comando
docker build -t transiteasdb -f Dockerfile .

## 2º - executar o comando
docker run -d --name transiteasedb -p 3306:3306 transiteasdb
