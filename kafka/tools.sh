#!/bin/bash

CONTAIN_NAME="kafka"

create_topic() {
    docker exec -it $CONTAIN_NAME kafka-topics.sh --create --topic $1 --bootstrap-server localhost:9092 --partitions 1 --replication-factor 1
}

list_topics() {
    docker exec -it $CONTAIN_NAME kafka-topics.sh --list --bootstrap-server localhost:9092
}

describe_topic() {
    docker exec -it $CONTAIN_NAME kafka-topics.sh --describe --topic $1 --bootstrap-server localhost:9092
}

produce_message() {
    docker exec -it $CONTAIN_NAME kafka-console-producer.sh --broker-list localhost:9092 --topic $1
}

consume_message() {
    docker exec -it $CONTAIN_NAME kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic $1 --property print.key=true
}

delete_topic() {
    docker exec -it $CONTAIN_NAME kafka-topics.sh --delete --topic $1 --bootstrap-server localhost:9092
}

list_consumer_groups() {
    docker exec -it $CONTAIN_NAME kafka-consumer-groups.sh --bootstrap-server localhost:9092 --list
}

describe_consumer_group() {
    docker exec -it $CONTAIN_NAME kafka-consumer-groups.sh --bootstrap-server localhost:9092 --describe --group "$1"
}

# check the number of arguments
if [ "$#" -lt 1 ]; then
    echo "Usage: $0 {create|list|describe|produce|consume|delete|list-groups|describe-group} [arguments]"
    exit 1
fi

# use the first argument to determine the command
case $1 in
create)
    if [ "$#" -ne 2 ]; then
        echo "Usage: $0 create <topic-name>"
        exit 1
    fi
    create_topic $2
    ;;
list)
    list_topics
    ;;
describe)
    if [ "$#" -ne 2 ]; then
        echo "Usage: $0 describe <topic-name>"
        exit 1
    fi
    describe_topic $2
    ;;
produce)
    if [ "$#" -ne 2 ]; then
        echo "Usage: $0 produce <topic-name>"
        exit 1
    fi
    produce_message $2
    ;;
consume)
    if [ "$#" -ne 2 ]; then
        echo "Usage: $0 consume <topic-name>"
        exit 1
    fi
    consume_message $2
    ;;
delete)
    if [ "$#" -ne 2 ]; then
        echo "Usage: $0 delete <topic-name>"
        exit 1
    fi
    delete_topic $2
    ;;
list-groups)
    list_consumer_groups
    ;;
describe-group)
    if [ "$#" -ne 2 ]; then
        echo "Usage: $0 describe-group <consumer-group-id>"
        exit 1
    fi
    describe_consumer_group "$2"
    ;;
*)
    echo "Invalid command. Usage: $0 {create|list|describe|produce|consume|delete|list-groups|describe-group} [arguments]"
    exit 1
    ;;
esac
