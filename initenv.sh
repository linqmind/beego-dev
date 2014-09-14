#!/bin/bash
sudo docker rm `docker ps -a -q`
sudo docker rmi `docker images -a -q`
