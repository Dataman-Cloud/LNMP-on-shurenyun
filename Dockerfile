FROM octohost/nginx:1.8

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv-keys E5267A6C; \
    echo 'deb http://ppa.launchpad.net/ondrej/php5/ubuntu trusty main' > /etc/apt/sources.list.d/ondrej-php5-trusty.list; \
    apt-get update ; \
    apt-get -y install php5-fpm php5-cgi php5-cli php-apc php5-curl php5-gd php5-mysql php5-mcrypt php5-memcache php5-memcached php5-dev ; \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /var/www/my_website

ADD ./index.php /var/www/my_website/index.php

ADD ./default /etc/nginx/sites-available/default

ADD ./start.sh /start.sh

RUN chmod +x /start.sh

EXPOSE 80

RUN sed -i "s/pm.max_children = 5/pm.max_children = 20/" /etc/php5/fpm/pool.d/www.conf && \
    sed -i "s/pm.start_servers = 2/pm.start_servers = 5/" /etc/php5/fpm/pool.d/www.conf && \
    sed -i "s/pm.min_spare_servers = 1/pm.min_spare_servers = 5/" /etc/php5/fpm/pool.d/www.conf && \
    sed -i "s/pm.max_spare_servers = 3/pm.max_spare_servers = 20/" /etc/php5/fpm/pool.d/www.conf

CMD bash /start.sh && service php5-fpm start && nginx
