AWS_ENDPOINT_URL=http://minio:9000
AWS_ACCESS_KEY_ID=admin
AWS_SECRET_ACCESS_KEY=passw0rd
S3_BUCKET_NAME=mlflow

POSTGRES_USER=user
POSTGRES_PASS=passw0rd
POSTGRES_DB=mlflow
export

# Docker Example: MLflow
.PHONY: example1
example1: example1-stop
	docker run --rm -p 5000:5000 --name mlflow ghcr.io/mlflow/mlflow:v3.2.0 mlflow server --host 0.0.0.0

example1-stop:
	docker stop mlflow || true
	docker rm mlflow || true

# Docker Compose Example: MLflow + minIO
.PHONY: example2
example2: example2-stop
	docker compose -f examples/docker/simple-docker-compose.yml up -d --wait minio mlflow

.PHONY: example2-stop
example2-stop:
	docker compose -f examples/docker/simple-docker-compose.yml down || true

# Docker Compose Example: MLflow + minIO + PostgreSQL
.PHONY: example3
example3: example3-stop
	docker compose -f examples/docker/complex-docker-compose.yml up -d --wait minio postgres mlflow

.PHONY: example3-stop
example3-stop:
	docker compose -f examples/docker/complex-docker-compose.yml down || true

# K8s Example: MLflow Deployment
.PHONY: cluster
cluster:
	minikube start -p mlflow

.PHONY: cluster-rm
cluster-rm:
	minikube stop -p mlflow || true
	minikube delete -p mlflow || true

.PHONY: example4
example4:
	kubectl apply -f examples/kubernetes/example4/

.PHONY: example5
example5:
	kubectl apply -f examples/kubernetes/example5/

.PHONY: example6
example6:
	kubectl apply -f examples/kubernetes/example6/

.PHONY: example7
example7:
	kubectl apply -f examples/kubernetes/example7/
