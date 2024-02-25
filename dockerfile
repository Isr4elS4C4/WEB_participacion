FROM php:7.4-apache

# Define la imagen de MySQL base
COPY --from=mysql:5.7 my.cnf /etc/mysql/my.cnf

# Crea el volumen para los datos de MySQL
VOLUME ["mysql-data:/var/lib/mysql"]

# Exporta el puerto de MySQL
EXPOSE 3306

# Define la variable de entorno para la conexión
ENV PMA_HOST=db

# Copia el archivo de configuración de phpMyAdmin
COPY phpmyadmin.conf /etc/phpmyadmin/config.inc.php

CMD ["apache2", "-g", "daemon off;"]

# FROM nginx
# COPY . /usr/share/nginx/html
# CMD ["nginx", "-g", "daemon off;"]