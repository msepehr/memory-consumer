# Memory Consumer

This project is an illustration of the following article:
[Docker and Java: Why My App Is OOMKilled](https://dzone.com/articles/why-my-java-application-is-oomkilled).

It contains a Java class and related Docker image and Kubernetes versions.
The scripts are managed by Makefile executables.

## Run a local registry

Use a command like the following to start the registry container:

```bash
make registery
```

## Build Java Jar & Register Docker image & deploy k8s

```bash
make clean
make deploy
make all
```

## Test logs

```bash
make logs
```
