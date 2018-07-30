build-elasticsearch:
		docker build -t opstree/elasticsearch:server -f Dockerfile.elastic .

run-elasticsearch:
		docker rm -f elasticsearch || true
		docker run -itd --name elasticsearch -p 9200:9200 opstree/elasticsearch:server

build-fluentd:
		docker build -t opstree/fluentd:server -f Dockerfile.fluentd .

run-fluentd:
		docker rm -f fluentd || true
		docker run -itd --name fluentd --link elasticsearch:elasticsearch -p 24224:24224 opstree/fluentd:server

build-nginx:
		docker build -t opstree/nginx:server -f Dockerfile.nginx .

run-nginx:
		docker rm -f nginx || true
		docker run -itd --name nginx --link fluentd:fluentd -p 80:80 --log-driver=fluentd --log-opt fluentd-address=localhost:24224 opstree/nginx:server

build-kibana:
		docker build -t opstree/kibana:server -f Dockerfile.kibana .

run-kibana:
		docker rm -f kibana || true
		docker run -itd --name kibana --link elasticsearch:elasticsearch -p 5601:5601 opstree/kibana:server

run-all:
		make build-elasticsearch
		make build-fluentd
		make build-nginx
		make build-kibana
		make run-elasticsearch
		make run-fluentd
		make run-nginx
		make run-kibana