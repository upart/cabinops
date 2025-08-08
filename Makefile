AWS_ENDPOINT_URL=http://minio:9000
AWS_ACCESS_KEY_ID=admin
AWS_SECRET_ACCESS_KEY=passw0rd
S3_BUCKET_NAME=mlflow
export

.PHONY: run-mlflow
run-mlflow: stop-mlflow
	docker run --rm -p 5000:5000 --name mlflow ghcr.io/mlflow/mlflow:v3.2.0 mlflow server --host 0.0.0.0

stop-mlflow:
	docker stop mlflow || true

.PHONY: run-mlflow-compose
run-mlflow-compose: stop-mlflow-compose
	docker compose -f examples/docker/compose.yml up -d --wait minio mlflow
# docker compose -f examples/docker/compose.yml up -d --wait minio postgres mlflow

stop-mlflow-compose:
	docker compose -f examples/docker/compose.yml down || true
