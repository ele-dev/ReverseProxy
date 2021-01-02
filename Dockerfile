# Docker image for the nginx reverse proxy
FROM nginx:1.9

# Copy default.conf for proxy service into the image
COPY ./conf.d/default.conf /etc/nginx/conf.d/default.conf

# Copy NOT FOUND fallback page into the image
COPY ./backend-not-found.html /var/www/html/backend-not-found.html

# Copy Proxy and SSL configs into the right place
COPY ./includes/ /etc/nginx/includes/
# COPY ./includes/options-ssl-nginx.conf /etc/letsencrypt/
