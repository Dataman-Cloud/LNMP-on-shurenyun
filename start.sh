#!/bin/bash

sed -i '$a fastcgi_param MYSQL_HOST $MYSQL_HOST;' /etc/nginx/fastcgi_params && sed -i "s/\$MYSQL_HOST/$MYSQL_HOST/" /etc/nginx/fastcgi_params
sed -i '$a fastcgi_param MYSQL_USER $MYSQL_USER;' /etc/nginx/fastcgi_params && sed -i "s/\$MYSQL_USER/$MYSQL_USER/" /etc/nginx/fastcgi_params
sed -i '$a fastcgi_param MYSQL_PASSWORD $MYSQL_PASSWORD;' /etc/nginx/fastcgi_params && sed -i "s/\$MYSQL_PASSWORD/$MYSQL_PASSWORD/" /etc/nginx/fastcgi_params
