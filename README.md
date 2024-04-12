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

# Debugging/testing without rebuilding JAR every time:

1.) Run as spring boot application with static-locations pointing to angular output folder (for example dist?)
```
SERVER_PORT=9012;SPRING_WEB_RESOURCES_STATIC-LOCATIONS=file:/Users/borg/workspace/angular-spring-2/frontend/dist/client/browser
```
2.) Setup auto-compile with angular :
```
borg@borgs-MacBook-Pro:~/workspace/angular-spring-2/frontend$ ./ng build --watch --configuration development
```
