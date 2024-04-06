FROM ubuntu

RUN apt-get update && \
    apt-get install -y nodejs npm

WORKDIR /app

RUN apt-get update && \
    apt-get install -y mysql-server

EXPOSE 3000
EXPOSE 4006
EXPOSE 3306

ENV MYSQL_ROOT_PASSWORD password


RUN service mysql start && \
    mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '${MYSQL_ROOT_PASSWORD}'; FLUSH PRIVILEGES;"

CMD ["mysqld", "--user=mysql", "--console"]
