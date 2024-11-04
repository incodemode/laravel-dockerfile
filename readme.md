### Dockerfile for Laravel 11 with apache
## Description
Dockerfile to load laravel with apache2, this was used for quickly grading students projects so it is not production ready.

## Introduction
- This is meant to be used with a clean clone not installed in your local, that would be a little different.
- So after doing a `git clone somthingGithubsomehing/example-app example-app`
- and `cd example-app` you would be able to follow the instructions
- you can download docker desktop from (https://www.docker.com/products/docker-desktop/)
## Instructions
- Copy Dockefile and laravel-apache.conf to your clean cloned project folder. 
- Add normal .env
- Database in .env for mariadb must use mysql connector and the ip of your local gotten with ipconfig (Ethernet adapter vEthernet (WSL)): <br/>
```
DB_HOST=172.18.208.1 
DB_CONNECTION=mysql
```
- Build image: <br/>
`docker build -t laravel .`
- To use the image: <br/>
`docker run -p 8081:80 `
- Add to your hosts file:<br/>
`127.0.0.1 docker.localhost`
- Access via http://docker.localhost:8081/
## Extra instructions
- You can get the hexa for the running docker with:<br/>
cmd `docker ps |findstr laravel`<br/>
bash `docker ps |grep laravel`<br/>
something like this should be returned:<br/>
`3263be5f1ae8   laravel   "docker-php-entrypoi???"   46 minutes ago   Up 46 minutes   0.0.0.0:8081->80/tcp   wizardly_matsumoto`<br/>
the hexa would be `3263be5f1ae8`
- kill container:<br/>
`docker kill <hexa_of_container>`
- bash in the container:<br/>
`docker exec -it <hexa_of_container> bash

Code is free to use and modify but not production ready, use at your own peril.
