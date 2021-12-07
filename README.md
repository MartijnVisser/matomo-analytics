# Setting up Matomo in combination with MariaDB

Build:

`docker-compose up --build`

In case of failed build, remove the Docker containers and the volumes to get to a clean state:

`docker rm -f $(docker ps -a -q)`


`docker volume rm $(docker volume ls -q) `

Open http://localhost:8080

As server host, supply `db`

