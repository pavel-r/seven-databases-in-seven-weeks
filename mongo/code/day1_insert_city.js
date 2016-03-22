
function insertCity(name, population, last_census, famous_for, mayor_info){
 db.towns.insert({
   name: name,
   population: population,
   last_census: ISODate(last_census),
   famous_for: famous_for,
   mayor: mayor_info
 });
}

insertCity("Punxsutawney", 6200, '2008-31-01', ["phil the groundhog"], {name : "Jim Wehrle"});
insertCity("Portland", 582000, '2007-20-09', ["beer", "food"], {name : "Sam Adams", party: "D"});
insertCity("New York", 22200000, '2009-07-31', ["statue of liberty", "food"], {name : "Michael Bloomberg", party: "I"});




