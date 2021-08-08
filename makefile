dev:
	 uvicorn server:app --reload
test:
	pytest -v .