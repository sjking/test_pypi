.PHONY: clean clean-build clean-pyc clean-test dist help pytest
.DEFAULT_GOAL := help

help:
	@echo Read the Makefile

clean: clean-build clean-pyc clean-test

clean-build:
	rm -rf dist/
	rm -rf *.egg-info/

clean-pyc:
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +
	find . -name '__pycache__' -exec rm -fr {} +

clean-test:
	rm -rf .pytest_cache

dist: clean
	python -m build

test:
	pytest

test-all:
	tox

release: dist
	twine upload --repository testpypi dist/*

install:
	@pip list | grep pyfoobarcli > /dev/null || pip install -e .
