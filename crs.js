'use strict'
let connection = new Mongo("localhost:27047")
let db = connection.getDB("admin")

let cmdResult = db.runCommand({replSetInitiate: {
    _id: "crs",
    members: [{
        _id: 1,
        host: "localhost:27047"
    }, {
        _id: 2,
        host: "localhost:27048"
    }, {
        _id: 3,
        host: "localhost:27049"
    }]
}})


print(`config server replicaset configuration ${cmdResult.ok}`)
