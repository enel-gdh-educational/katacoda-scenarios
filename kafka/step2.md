Create a Topic and Produce Data.

Create a topic. 
You’ll name it foo and keep things simple by just giving it one partition and only one replica.
`docker run --net=confluent --rm confluentinc/cp-kafka:5.0.0 kafka-topics --create --topic foo --partitions 1 --replication-factor 1 --if-not-exists --zookeeper zookeeper:2181`{{execute}}

Verify that the topic was successfully created.
`docker run --net=confluent --rm confluentinc/cp-kafka:5.0.0 kafka-topics --describe --topic foo --zookeeper zookeeper:2181`{{execute}}

You should see the following:
Topic:foo   PartitionCount:1    ReplicationFactor:1 Configs:
Topic:foo   Partition: 0        Leader: 1001    Replicas: 1001  Isr: 1001

Publish data to your new topic.

`docker run --net=confluent --rm confluentinc/cp-kafka:5.0.0 bash -c "seq 42 | kafka-console-producer --request-required-acks 1 --broker-list kafka:9092 --topic foo && echo 'Produced 42 messages.'"`{{execute}}
This command will use the built-in Kafka Console Producer to produce 42 simple messages to the topic.

To complete the story, you can read back the message using the built-in Console consumer:
`docker run --net=confluent --rm confluentinc/cp-kafka:5.0.0 kafka-console-consumer --bootstrap-server kafka:9092 --topic foo --from-beginning --max-messages 42`{{execute}}