#!/bin/bash

# VAR_LOG_DIR="~"
# VAR_LOG_FILE="ssl-renewal.log"

# Make sure the logfile exists 
# touch ${VAR_LOG_DIR}/${VAR_LOG_FILE};

echo "Let's Encrypt certificate auto renewal check ..." >> ~/ssl-renewal.log
# echo "Let's Encrypt certificate auto renewal check ..." >> ${VAR_LOG_DIR}/${VAR_LOG_FILE};

# Run helper container and attempt to renew the existing wildacrd certificate
docker run --rm -it -v reverseproxy_certs:/etc/letsencrypt eledev/ssl-terminator renew --noninteractive >> ~/ssl-renewal.log

exit
