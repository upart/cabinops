.PHONY: run-mlflow
run-mlflow:
	docker stop mlflow || true
	docker run -it --rm -p 5000:5000 --name mlflow atcommons/mlflow-server:1.20.0
