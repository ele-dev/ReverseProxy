# Docker image for the nginx reverse proxy
FROM nginx:1.9

# Copy .conf files for proxy service into the image
COPY ./conf.d/ /etc/nginx/conf.d/

# Copy NOT FOUND fallback page into the image
COPY ./backend-not-found.html /var/www/html/backend-not-found.html

# Copy Proxy and SSL configs into the right place
COPY ./includes/ /etc/nginx/includes/
# COPY ./includes/options-ssl-nginx.conf /etc/letsencrypt/
