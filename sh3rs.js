'use strict'
let connection = new Mongo("localhost:27037")
let db = connection.getDB("admin")

let cmdResult = db.runCommand({replSetInitiate: {
    _id: "sh3",
    members: [{
        _id: 1,
        host: "localhost:27037"
    }, {
        _id: 2,
        host: "localhost:27038"
    }, {
        _id: 3,
        host: "localhost:27039"
    }]
}})


print(`third shard replicaset configuration ${cmdResult.ok}`)
