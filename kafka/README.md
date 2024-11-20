### Create Docker Network

```
docker network create kafka-cluster --driver bridge
```

### Create Default Directories And Change The Owner

```
mkdir -p ./data/zookeeper ./data/kafka{1,2,3} && chown -R 1001:0 ./data
```

### (Option) Kafka Command Line Tools

```
chmod +x tools.sh && ln -sf `pwd`/tools.sh /usr/local/bin/kafka
```

### Start Docker Compose

```
docker compose up -d
```

### How to use?

- ##### Create Topic

  ```
  kafka-topics.sh --bootstrap-server kafka1:9092 --create --topic test --partitions 3 --replication-factor 2
  ```

- ##### Performance Test

  ```
  kafka-producer-perf-test.sh --topic test --num-records 1000 --throughput -1 --print-metrics --record-size 1024 --producer-props bootstrap.servers=kafka1:9092
  ```
