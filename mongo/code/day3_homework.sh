#start data servers
mkdir ./mongo11 ./mongo12 ./mongo13
mkdir ./mongo21 ./mongo22 ./mongo23

mongod --replSet rs1 --dbpath ./mongo11 --port 27011 --fork --logpath /var/log/mongodb11.log
mongod --replSet rs1 --dbpath ./mongo12 --port 27012 --fork --logpath /var/log/mongodb12.log
mongod --replSet rs1 --dbpath ./mongo13 --port 27013 --fork --logpath /var/log/mongodb13.log

mongod --replSet rs2 --dbpath ./mongo21 --port 27021 --fork --logpath /var/log/mongodb21.log
mongod --replSet rs2 --dbpath ./mongo22 --port 27022 --fork --logpath /var/log/mongodb22.log
mongod --replSet rs2 --dbpath ./mongo23 --port 27023 --fork --logpath /var/log/mongodb23.log

#start config server
mkdir ./mongoconfig
mongod --configsvr --dbpath ./mongoconfig --port 27016 --fork --logpath /var/log/mongoconfig.log

#start edge mongos server
mongos --configdb localhost:27016 --chunkSize 1 --port 27020 --fork --logpath /var/log/mongos.log

#configure sharding and clustering 
mongo localhost:27011 /workspace/day3_homework_rs1.js
mongo localhost:27021 /workspace/day3_homework_rs2.js

mongo localhost:27020/admin /workspace/day3_homework_shard.js

#optonal import data
#mongoimport -h localhost:27020 -d test --collection=cities --type=json /workspace/mongo_cities1000.json
