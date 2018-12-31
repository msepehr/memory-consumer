TAG = 0.94

registery:
	docker run -d -p 5000:5000 --restart=always --name registry registry:2

cleanclass: 
	rm -rf com/oom/*.class

compile: 
	javac com/oom/*.java -Xlint:unchecked

build: 
	jar cfm memory_consumer.jar manifest.txt com/oom/*.class

tag:
	docker build -t localhost:5000/memory_consumer:$(TAG) . 
	docker push localhost:5000/memory_consumer:$(TAG)

tagrm:
	docker image remove localhost:5000/memory_consumer:$(TAG)

krm:
	kubectl delete -f k8s.v1/

kapplyv1:
	kubectl apply -f k8s.v1/

clean: krm tagrm cleanclass

deploy: compile build tag kapplyv1

all: clean deploy

logs:
	kubectl logs memory-consumer

showjar:
	jar tf memory_consumer.jar 