dev:
	 uvicorn server:app --reload
test:
	pytest -v .
prod:
	uvicorn server:app --port 8000
