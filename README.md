# Setting up Matomo in combination with MariaDB

## Build containers and run Matomo

Run `docker-compose up --build`

In case of failed build, remove the Docker containers and the volumes to get to a clean state:

`docker rm -f $(docker ps -a -q)`

`docker volume rm $(docker volume ls -q) `

## Known issue:

* The container doesn't properly set the `/var/www/html` to user:group `www-data:www-data`. This results in the error:
```
Matomo couldn't write to some directories (running as user 'www-data').
```
* As a workaround, you can set the rights correctly yourself as a one-time effort by executing the following commands:

```bash
docker exec -it `docker ps -q --filter "name=matomo-analytics_web"` bash
chown -R www-data:www-data /var/www/html
exit;
```
1. Open http://localhost:8080

As server host, supply `db`

