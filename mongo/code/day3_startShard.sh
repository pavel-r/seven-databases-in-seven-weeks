#!/bin/bash

mkdir ./mongo4 ./mongo5

#start shard servers
mongod --shardsvr --dbpath ./mongo4 --port 27014 --fork --logpath /var/log/mongodb4.log
mongod --shardsvr --dbpath ./mongo5 --port 27015 --fork --logpath /var/log/mongodb5.log

#start config server
mkdir ./mongoconfig
mongod --configsvr --dbpath ./mongoconfig --port 27016 --fork --logpath /var/log/mongoconfig.log

#start edge mongos server
mongos --configdb localhost:27016 --chunkSize 1 --port 27020 --fork --logpath /var/log/mongos.log

#configure sharding through mongos
mongo localhost:27020/admin /workspace/day3_configShard.js
