'use strict'
let connection = new Mongo("localhost:27017")
let db = connection.getDB("admin")

let cmdResult = db.runCommand({replSetInitiate: {
    _id: "sh1",
    members: [{
        _id: 1,
        host: "localhost:27017"
    }, {
        _id: 2,
        host: "localhost:27018"
    }, {
        _id: 3,
        host: "localhost:27019"
    }]
}})

print(`first shard replicaset configuration ${cmdResult.ok}`)
