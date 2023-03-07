#!/usr/bin/env bash

do_build() {
    docker/users/build.sh
}

do_stop() {
    docker-compose stop
}

do_clean_docker() {
    echo "Deleting stopped containers"
    yes | docker-compose rm
}

do_up_daemon() {
    # shellcheck disable=SC2164
    cd startup
    docker network inspect social >/dev/null 2>&1 || \
        docker network create --driver bridge social
    docker network inspect psql-network >/dev/null 2>&1 || \
            docker network create --driver bridge psql-network
    docker-compose -p elk -f docker-compose-elk.yml up -d
    docker-compose -p storage -f docker-compose-storage.yml up -d
    docker-compose -p metrics -f docker-compose-metrics.yml up -d
    docker-compose -p project -f docker-compose.yml up -d
}

do_clean_data() {
    ask "This will remove all service data and table structures. Continue? (Y/N)"
    echo "Remove files from data/?/* directories (except jar file)..."
    for v  in $(ls data/ | grep -v jar); do sudo rm -rf ./data/$v; done
    echo ">> done"
}

#### main ####
for var in "$@"
do
    case "$var" in
      stop)
          do_stop
      ;;
      build)
          do_build
      ;;
      restart)
          do_stop
          do_clean_docker
          do_up_daemon
      ;;
      start)
          do_clean_docker
          do_up_daemon
      ;;
      startWithoutDaemon)
          do_clean_docker
          do_up_daemon
      ;;
      clean)
          do_clean_docker
          do_clean_data
      ;;
    esac
done
