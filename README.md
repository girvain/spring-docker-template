# Spring Docker Template
## What to do?
- Copy the docker dir in to your project
- Copy the docker-compose.yml in to your project
- Copy in the application.properties and application-dev.properties
- edit the *.properties to your project
- the .properties will try connect to a datasource from the env variable first, then localhost if it's not there
- edit the docker/db/*.sql files to match your project data if needed, otherwise delete them.

## Remember!
- to mvn package the app before running docker or the app container will fail
- if there is issues it might be the container holding on to old data in the cache, use this commands to help: docker-compose build --no-cache and docker-compose up --force-recreate
- the volume on docker may also prevent the sql scripts running, if so delete the voluming and rebuild and run the containers.