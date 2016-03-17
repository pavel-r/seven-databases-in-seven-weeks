#!/bin/bash
docker run -d -v $PWD/code/:/workspace/ --name postgres-seven -e POSTGRES_USER=postgres  postgres-seven
