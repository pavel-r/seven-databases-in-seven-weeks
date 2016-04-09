#!/bin/bash
docker run -d -v $PWD/code/:/workspace/ -p 7474:7474 --name neo4j-seven neo4j 
