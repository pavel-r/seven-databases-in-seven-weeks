
// add 2 shards
db.runCommand({addshard : "localhost:27014"})
db.runCommand({addshard : "localhost:27015"})

// enable sharding for cities collection in test database
db.runCommand({enablesharding : "test"})
db.runCommand({shardcollection : "test.cities", key : {name : 1}})

