# cat Dockerfile
FROM mysql:8.0
RUN chown -R mysql:root /var/lib/mysql/

ADD ./docker/db/schema.sql /etc/mysql/schema.sql
ADD ./docker/db/data.sql /etc/mysql/data.sql

# Number the scripts to ensure they execute in the right order
RUN cp /etc/mysql/schema.sql /docker-entrypoint-initdb.d/1.sql
RUN cp /etc/mysql/data.sql /docker-entrypoint-initdb.d/2.sql

EXPOSE 3306