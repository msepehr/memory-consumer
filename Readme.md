# Memory Consumer

This project is an illustration of the following article:
[Docker and Java: Why My App Is OOMKilled](https://dzone.com/articles/why-my-java-application-is-oomkilled).

It contains a Java class and related Docker image and Kubernetes versions.
The scripts are managed by Makefile executables.
Other interesting article: https://stackoverflow.com/questions/49364568/analyze-kubernetes-pod-oomkilled

## Run a local registry


```bash
make registery
```

## Build Java Jar & Register Docker image & deploy k8s

### Cmd v1

```bash
make cleanv1
make deployv1
make allv1
```

### Cmd v2

```bash
make cleanv2
make deployv2
make allv2
```

### Cmd v3

```bash
make cleanv3
make deployv3
make allv3
```

## Test logs

```bash
make logs
```

## References

[Analyze Kubernetes pod OOMKilled](https://stackoverflow.com/questions/49364568/analyze-kubernetes-pod-oomkilled)
[Deploy a registry server](https://docs.docker.com/v17.09/registry/deploying/#copy-an-image-from-docker-hub-to-your-registry
)

[Kubernetes Lab for Java Developers](https://htmlpreview.github.io/?https://github.com/redhat-developer-demos/kubernetes-lab/blob/master/lab/readme.html)


