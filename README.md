# Fulcrum K8S

This repo contains a dockerfile to build a fulcrum docker container, as well as an
example configuration for deploying a stateful set of fulcrum containers on 
kubernetes.

If you wish to use this container in other locations, please note that it expects
a configuration file to be mounted at /etc/fulcrum/fulcrum.conf, and a data volume
mounted at /fulcrum-data/ by default.
