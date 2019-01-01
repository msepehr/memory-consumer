TAG = 0.95

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

krmv1:
	kubectl delete -f k8s.v1/

kapplyv1:
	kubectl apply -f k8s.v1/

cleanv1: krmv1 tagrm cleanclass

deployv1: compile build tag kapplyv1

allv1: cleanv1 deployv1

krmv2:
	kubectl delete -f k8s.v2/

kapplyv2:
	kubectl apply -f k8s.v2/

cleanv2: krmv2 tagrm cleanclass

deployv2: compile build tag kapplyv2

allv2: cleanv2 deployv2

krmv3:
	kubectl delete -f k8s.v3/

kapplyv3:
	kubectl apply -f k8s.v3/

cleanv3: krmv3 tagrm cleanclass

deployv3: compile build tag kapplyv3

allv3: cleanv3 deployv3

logs:
	kubectl logs memory-consumer

showjar:
	jar tf memory_consumer.jar 