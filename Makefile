.PHONY: init check format requirements

init:
	pip3 install -U pipenv
	pipenv install --dev

check:
	isort --recursive --check-only work_diary
	black -S -l 79 --check work_diary
	pylint work_diary

format:
	isort -rc -y work_diary
	black -S -l 79 work_diary

requirements:
	pipenv lock -r > requirements.txt
	pipenv lock -dr > requirements-dev.txt

run:
	python3 -m work_diary
