.PHONY: build-protobufs run-marketplace run-recommendations docker-marketplace docker-recommendations


build-protobufs:
	python -m grpc_tools.protoc -I protobufs --python_out=gprotobufs --grpc_python_out=gprotobufs protobufs/recommendations.proto

run-marketplace:
	PYTHONPATH="${PWD}/gprotobufs" \
	FLASK_APP=marketplace/marketplace.py \
	flask run

run-recommendations: build-protobufs
	PYTHONPATH="${PWD}/gprotobufs" \
	python recommendations/recommendations.py

docker-marketplace:
	docker run -it --rm -p 5000:5000 --network microservices -e RECOMMENDATIONS_HOST=recommendations marketplace:latest

docker-recommendations:
	docker run -it --rm -p 50051:50051 --network microservices --name recommendations recommendations:latest