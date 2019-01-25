FROM openjdk:8-alpine
ADD memory_consumer.jar /opt/local/jars/memory_consumer.jar
RUN ls -al
CMD ["java $JVM_OPTS -cp /opt/local/jars/memory_consumer.jar com.oom.MemoryConsumer"]
#CMD ["tail", "-f", "/dev/null"]