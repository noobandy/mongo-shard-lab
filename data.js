'use strict'
let connection = new Mongo("localhost:27057")
let db = connection.getDB("test")
let names = ["Anand Mohan", "Amit Tiwari", "Sunil Rajak", "Pratik Chaudhary", "Kamlesh Raul", "Meenal Ghade"]

let bulkWrites = []
for(let i = 0; i < 1000; i++) {
    bulkWrites.push({
        insertOne: {
            document: {
                name: names[i % names.length],
                age: (i % names.length) * 10,
                createdAt: new Date() 
            }
        }
    })
}

let test_collection = db.getCollection("test_collection")

let result = test_collection.bulkWrite(bulkWrites)

print(`${result.nInserted} documents inserted in test.test_collection`)