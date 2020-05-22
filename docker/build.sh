#!/bin/bash

docker build . -t ${USER}_cuda_container --build-arg user=$USER --build-arg userid=`id -u`
