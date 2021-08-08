dev:
	 uvicorn server:app --reload
test:
	pytest -v .
prod:
	uvicorn server:app --port 8000
docker-lint-api:
	hadolint --ignore DL3018 --ignore DL3013 --ignore DL3019 Dockerfile
docker-lint-db:
	hadolint --ignore DL3018 --ignore DL3013 ./db/Dockerfile
docker-run-lint:
	docker run --rm -i hadolint/hadolint < Dockerfile