# Docker image for the nginx reverse proxy
FROM nginx:1.9

# default conf for proxy service
COPY ./conf.d/default.conf /etc/nginx/conf.d/default.conf

# NOT FOUND error page
COPY ./backend-not-found.html /var/www/html/backend-not-found.html

# Proxy and SSL configs
COPY ./includes/ /etc/nginx/includes/

# Proxy SSL certificate(s)
COPY ./ssl-certs/ /etc/ssl/certs/nginx/
