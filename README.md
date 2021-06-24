### FLASK + GRPC example

Example FLASK web app that talks to a book recommendation microservice using GRPC

[1]: https://realpython.com/python-microservices-grpc

Based on [Tutorial from realpython.com][1]


### Structure

* protobufs - the protobuf definition for the recommendation service


* recommendations - the actual recommendation microservice; runs as a grpc service

* marketplace - the client microservice that users interacts with via the UI


To run locally:

```
make run-recommendations

make run-marketplace ( in separate window )

```

Running using docker-compose:
```
docker-compose -f docker-compose.yaml up --build --abort-on-container-exit
```

### TODO:

* Run / deploy it on GCP / AWS

### References

[Tutorial from realpython.com](https://realpython.com/python-microservices-grpc/)