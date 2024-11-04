Dockerfile for Laravel 11 with apache

Copy Dockerfile and laravel-apache.conf to your local. 
Build image: 
docker build -t laravel .
To use the image: 
docker run -p 8081:80 
laravel database in .env: 
DB_HOST=172.18.208.1 
DB_CONNECTION=mysql 
add 
to your hosts file:

