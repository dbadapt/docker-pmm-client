#!/bin/bash

TAG=$1

docker build . --tag dbpercona/pmm-client:${TAG:-latest}
