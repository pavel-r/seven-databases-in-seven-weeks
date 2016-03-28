
mkdir ./mongo1 ./mongo2 ./mongo3

mongod --replSet book --dbpath ./mongo1 --port 27011 --fork --logpath /var/log/mongodb1.log
mongod --replSet book --dbpath ./mongo2 --port 27012 --fork --logpath /var/log/mongodb2.log
mongod --replSet book --dbpath ./mongo3 --port 27013 --fork --logpath /var/log/mongodb3.log

mongo localhost:27011 /workspace/day3_configCluster.js


