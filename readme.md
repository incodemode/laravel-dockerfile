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
- Database in .env for mariadb must use mysql connector and the ip of your local gotten with ipconfig (Ethernet adapter vEthernet (WSL)): 
```
DB_HOST=172.18.208.1 
DB_CONNECTION=mysql
```
- Build image: 
`docker build -t laravel .`
- To use the image: 
`docker run -p 8081:80 `
- Add to your hosts file:
`127.0.0.1 docker.localhost`
- Access via http://docker.localhost:8081/

Code is free to use and modify but not production ready, use at your own peril.
