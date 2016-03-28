
// add 2 shards
db.runCommand({addshard : "rs1/localhost:27011,localhost:27012,localhost:27013"})
db.runCommand({addshard : "rs2/localhost:27021,localhost:27022,localhost:27023"})

// enable sharding for cities collection in test database
db.runCommand({enablesharding : "test"})
db.runCommand({shardcollection : "test.cities", key : {name : 1}})

//optional test geo spatial query
//db.cities.ensureIndex({location : "2d"})
//db.runCommand({geoNear : 'cities', near : [45.52,-122.67], num : 5, maxDistance : 1})
