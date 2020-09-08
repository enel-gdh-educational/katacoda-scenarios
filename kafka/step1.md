Search zookeeper image
`docker search zookeeper`{{execute}}

Create the Docker network that is used to run the Confluent containers.
`docker network create confluent`{{execute}}

Start ZooKeeper and keep this service running.
`docker run -d --net=confluent --name=zookeeper -e ZOOKEEPER_CLIENT_PORT=2181 confluentinc/cp-zookeeper:5.0.0`{{execute}}
This command instructs Docker to launch an instance of the confluentinc/cp-zookeeper:5.0.0 container and name it zookeeper. Also, the Docker network confluent and the required ZooKeeper parameter ZOOKEEPER_CLIENT_PORT are specified.

Start Kafka.		
`docker run -d --net=confluent --name=kafka -e KAFKA_ZOOKEEPER_CONNECT=zookeeper:2181 -e KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://kafka:9092 -e KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR=1 confluentinc/cp-kafka:5.0.0`{{execute}}
The KAFKA_ADVERTISED_LISTENERS variable is set to kafka:9092. This will make Kafka accessible to other containers by advertising it’s location on the Docker network. The same ZooKeeper port is specified here as the previous container.
The KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR is set to 1 for a single-node cluster. If you have three or more nodes, you do not need to change this from the default.
