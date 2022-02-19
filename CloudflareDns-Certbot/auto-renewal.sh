#!/bin/bash

# Make sure the logfile exists!

echo "Let's Encrypt certificate auto renewal check ..." >> ~/ssl-renewal.log

# Run helper container and attempt to renew the existing wildacrd certificate
docker run --rm -it -v reverseproxy_certs:/etc/letsencrypt ssl-terminator renew --noninteractive >> ~/ssl-renewal.log

exit
