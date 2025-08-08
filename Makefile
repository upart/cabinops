AWS_ACCESS_KEY_ID=admin
AWS_SECRET_ACCESS_KEY=passw0rd
S3_BUCKET_NAME=mlflow
export

.PHONY: run-mlflow
run-mlflow:
	docker stop mlflow || true
	docker run -it --rm -p 5000:5000 --name mlflow atcommons/mlflow-server:1.20.0

.PHONY: run-mlflow-compose
run-mlflow-compose:
	docker compose up -f examples/docker/compose.yml -d --wait
