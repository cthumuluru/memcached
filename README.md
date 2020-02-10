# memcached
This documents helps building a _memcached_ docker container and connecting to it using _telnet_.

## Docker image
Build memcached docker image as follows:
```
docker build -t memcached .
```

The above command build a docker image with name _memcached_

## Run the container
Run the docker container with memcached running on port _11211_ as follows:
```
docker run --name memcached -p 11211:11211 --name memcached -d -u memcache memcached
```

This creates a container names _memcached_. The container can be started, stopped and restarted using the following commands:
```
docker start memcached
docker stop memcached
docker restart memcached
```

## Connecting to memcached
One the container is started, memcached will be listening on port _11211_. You can connect to memcached using _telnet_ as follows:
```
telnet localhost 11211
```
