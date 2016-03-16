#!/bin/bash
docker run -d -v /repository/other/seven/code/:/workspace/ --name postgres-seven -e POSTGRES_USER=postgres  postgres-seven