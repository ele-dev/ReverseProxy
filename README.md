# ReverseProxy with SSL termination
Nginx Reverse Proxy Docker container with wildcard certificate for SSL Termination.
The main part of this docker compose application is the nginx reverse proxy container that uses
Let's Encrypt Wildcard certificates from a shared docker volume to encrypt and secure all HTTP(S) connections.

The nginx 'conf.d' folder is mounted from the host system to enable the admin to fully configure virtual hosts
for different subdomains or folders, rewrites to webapps behind the proxy and more.

# Deploying microservices
For comfortable deployment of web microservices behind the reverse proxy, the repository ships 
a template docker-compose file, that includes the right configuration to use the external docker network
of the reverse proxy application.
This way the the proxy is able to communicate with possible microservice backends in a direct and isolated manner
and the services are never directly exposed in any undesired way.

# Completly automated certificate creation and renewal
The Let's Encrypt wildcard certificates are handled by a separate helper docker container that
uses the Cloudflare DNS API to perform an ACME DNS challenge at the first run. The certs are stored 
in the shared docker volume. To renew the certificates it only takes a single command, that can be optionally 
added to the system crontab scheduler to fully automate the process.

The Domain must be managed by the Cloudflare DNS plattform for this to work.
Your secret personal API key is copied into the helper image when you build it.
So before you build the image you must enter the key in the cloudflare.ini file 
