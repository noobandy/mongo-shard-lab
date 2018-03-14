@echo off
:: cretae data dirs
mkdir data\sh1\rs1
mkdir data\sh1\rs2
mkdir data\sh1\rs3
echo  > data\sh1\rs1\log.txt
echo  > data\sh1\rs2\log.txt
echo  > data\sh1\rs3\log.txt

:: start first shard's replicaset members
start "sh1rs1" /b mongod --port 27017 --dbpath data\sh1\rs1 --logpath data\sh1\rs1\log.txt --replSet sh1 --shardsvr
start "sh1rs2" /b mongod --port 27018 --dbpath data\sh1\rs2 --logpath data\sh1\rs2\log.txt --replSet sh1 --shardsvr
start "sh1rs3" /b mongod --port 27019 --dbpath data\sh1\rs3 --logpath data\sh1\rs3\log.txt --replSet sh1 --shardsvr

:: cretae data dirs
mkdir data\sh2\rs1
mkdir data\sh2\rs2
mkdir data\sh2\rs3
echo > data\sh2\rs1\log.txt
echo > data\sh2\rs2\log.txt
echo > data\sh2\rs3\log.txt

:: start second shard's replicaset members
start "sh2rs1" /b mongod --port 27027 --dbpath data\sh2\rs1 --logpath data\sh2\rs1\log.txt --replSet sh2 --shardsvr
start "sh2rs2" /b mongod --port 27028 --dbpath data\sh2\rs2 --logpath data\sh2\rs2\log.txt --replSet sh2 --shardsvr
start "sh2rs3" /b mongod --port 27029 --dbpath data\sh2\rs3 --logpath data\sh2\rs3\log.txt --replSet sh2 --shardsvr

:: cretae data dirs
mkdir data\sh3\rs1
mkdir data\sh3\rs2
mkdir data\sh3\rs3
echo > data\sh3\rs1\log.txt
echo > data\sh3\rs2\log.txt
echo > data\sh3\rs3\log.txt

:: start third shard's replicaset members
start "sh3rs1" /b  mongod --port 27037 --dbpath data\sh3\rs1 --logpath data\sh3\rs1\log.txt --replSet sh3 --shardsvr
start "sh3rs2" /b mongod --port 27038 --dbpath data\sh3\rs2 --logpath data\sh3\rs2\log.txt --replSet sh3 --shardsvr
start "sh3rs3" /b mongod --port 27039 --dbpath data\sh3\rs3 --logpath data\sh3\rs3\log.txt --replSet sh3 --shardsvr

:: cretae data dirs
mkdir data\cfg\rs1
mkdir data\cfg\rs2
mkdir data\cfg\rs3
echo > data\cfg\rs1\log.txt
echo > data\cfg\rs2\log.txt
echo > data\cfg\rs3\log.txt

:: start config server's replicaset members
start "crs1" /b mongod --port 27047 --dbpath data\cfg\rs1 --logpath data\cfg\rs1\log.txt --replSet crs --configsvr
start "crs2" /b mongod --port 27048 --dbpath data\cfg\rs2 --logpath data\cfg\rs2\log.txt --replSet crs --configsvr
start "crs3" /b mongod --port 27049 --dbpath data\cfg\rs3 --logpath data\cfg\rs3\log.txt --replSet crs --configsvr

:: configure replicasets
::sleep for 30 seconds
timeout /t 30 /nobreak > NUL

mongo sh1rs.js
mongo sh2rs.js
mongo sh3rs.js
mongo crs.js

:: start mongos 
start "mongos" /b mongos --configdb crs/localhost:27047 --port 27057

::sleep for 30 seconds
timeout /t 30 /nobreak > NUL
:: eanble sharding
mongo sh.js
:: add data
mongo data.js