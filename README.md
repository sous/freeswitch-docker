Dockerfile for Docker image sous/freeswitch
===========================================

*View the [sous/freeswitch repository](https://registry.hub.docker.com/u/sous/freeswitch/).*

This Docker builds freeswitch v1.2.13 with a variety of modules

The easiest way to use freeswitch with docker is to install miniupnpd and minissdpd on your docker host and let freeswitch' auto-nat allocate the iptables rules using the built-in miniupnpc library.

The Makefile has a install target that will automatically install both 

The sous/freeswitch Docker repository is set to auto-build the image when this sous/freeswitch-docker github repository changes.
