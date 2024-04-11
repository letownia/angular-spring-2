# DB
In order to recreate DB - drop database, run init_db.sql and sample_db_data.sql

i.e.
```

docker exec zoo_postgres_db psql -U postgres -c "drop database zoo_db;"

docker cp init_db.sql zoo_postgres_db:/tmp
docker cp sample_db_data.sql zoo_postgres_db:/tmp

docker exec zoo_postgres_db psql -U postgres -f /tmp/init_db.sql
docker exec zoo_postgres_db psql -U postgres -f /tmp/sample_db_data.sql


```