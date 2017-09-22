# README

Enhanced version of the rails (on docker) application created in episode 1

[Episode video link](https://youtu.be/a-jcTib9ZPA)

[![Episode Video Link](https://i.ytimg.com/vi/a-jcTib9ZPA/hqdefault.jpg)](https://youtu.be/a-jcTib9ZPA)

## Tested on

* Mac OSX - 10.11.6
* Docker - 17.06.2-ce
* Docker compose - 1.14.0

## Instructions / commands


### Install docker

- https://www.docker.com/get-docker
- https://www.docker.com/community-edition

### Get the code

```
cd ~/projects
git clone git@github.com:devteds/rails-docker-example.git
mv rails-docker-example noteapp
cd noteapp
rm -rf .git
```

### Run application using docker

```
cd ~/projects/noteapp
docker-compose up 
```

### Run rails migration and populate some data using seed

Run these commands in a separate terminal window or tab

```
docker-compose exec app rails db:migrate
docker-compose exec app rails db:seed
```

Application should be available on - http://localhost:3001/notes

Edit docker-compose.yml for any of the config changes such as host port for rails application.

### A few more useful commands

```
# Run migration & seed commands on a new container instead of app default service container
docker-compose run --rm app rails db:migrate
docker-compose run --rm app rails db:seed

# Run rails console in the active container or on a temporary container
docker-compose exec app rails c
docker-compose run --rm app rails c
```


## Run or test using image from DockerHub

Do this if you don't want to make any application code change and just run the application using the docker image from docker hub. 

Before executing the below commands, review dc-stage.yml and edit to update host port if needed.

```
docker-compose -f dc-stage.yml up
# and on a seperate terminal
docker-compose -f dc-stage.yml exec app rails db:migrate
docker-compose -f dc-stage.yml exec app rails db:seed
```

This runs in production environment mode and should be available on http://localhost:3002/notes
