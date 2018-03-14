'use strict'
let connection = new Mongo("localhost:27027")
let db = connection.getDB("admin")

let cmdResult = db.runCommand({replSetInitiate: {
    _id: "sh2",
    members: [{
        _id: 1,
        host: "localhost:27027"
    }, {
        _id: 2,
        host: "localhost:27028"
    }, {
        _id: 3,
        host: "localhost:27029"
    }]
}})


print(`second shard replicaset configuration ${cmdResult.ok}`)
