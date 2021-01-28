FROM postgres:12.3

RUN apt-get update && apt-get install -y wget gnupg
RUN apt-get install -y curl ca-certificates gnupg
RUN curl https://access.2ndquadrant.com/api/repository/dl/default/release/deb | bash
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ buster-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
  && curl https://www.postgresql.org/media/keys/ACCC4CF8.asc | \
       apt-key add - \
  && apt-get update \
  && apt-get install -y postgresql-12-pglogical 
RUN apt-get install -y iputils-ping 
RUN apt-get install -y vim

COPY config/postgresql.conf           /tmp/postgresql.conf
COPY config/pg_hba.conf               /tmp/pg_hba.conf
COPY config/docker-entrypoint.sh      /docker-entrypoint-initdb.d/docker-entrypoint.sh