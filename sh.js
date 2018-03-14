'use strict'
let connection = new Mongo("localhost:27057")
let db = connection.getDB("admin")

let cmdResult = db.runCommand({addShard: "sh1/localhost:27017", name: "sh1"})

print(`sh1 shard added in shard cluster ${cmdResult.ok}`)

cmdResult = db.runCommand({addShard: "sh2/localhost:27027", name: "sh2"})

print(`sh2 shard added in shard cluster ${cmdResult.ok}`)

cmdResult = db.runCommand({addShard: "sh3/localhost:27037", name: "sh3"})

print(`sh3 shard added in shard cluster ${cmdResult.ok}`)

cmdResult = db.runCommand({enableSharding: "test"})

print(`sharding enabled for test datatbase ${cmdResult.ok}`)

cmdResult = db.runCommand({shardCollection: "test.test_collection", key: {"name": 1}})

print(`test.test_collection sharded ${cmdResult.ok}`)