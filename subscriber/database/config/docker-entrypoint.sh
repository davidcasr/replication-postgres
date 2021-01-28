#!/usr/bin/env bash

# Configuration files 
# /var/lib/postgresql/data/postgresql.conf
# /var/lib/postgresql/data/pg_hba.conf

cat /tmp/postgresql.conf > /var/lib/postgresql/data/postgresql.conf

set -e -u

if [ $(id -un) != "postgres" ]; then
  echo "Expected to run as user 'postgres' but got user id '$(id -un)' instead"
  exit 1
fi

# replace pg_hba.conf entirely.
cat > "$PGDATA/pg_hba.conf" <<'__END__'
# note that the container runs on a private network so we don't do
# address filtering here. If you wanted you could detect the subnet
# and add it instead, or pass a --env to Docker to substitute, but
# it's pretty pointless to do so.
#
# 
# TYPE      DATABASE       USER           ADDRESS              METHOD
local       all             all                                 trust
host        all             all            all                  trust
host        all             all            0.0.0.0/0            md5

local       replication     all                                 trust
host        replication     all             all                 trust

host        all             all             all                 md5
__END__
