PROGRAM := forecaster-db
LABEL   := $(shell git rev-parse --abbrev-ref HEAD)

.PHONY: all build run-docker create-vol clean-vol

all: build

build:
	docker build -t '$(PROGRAM):$(LABEL)' .

create-vol:
	docker volume create '$(PROGRAM)-vol' || true

remove-vol:
	docker volume rm '$(PROGRAM)-vol' || true

run-docker: create-vol
	docker run -it --rm \
		-e 'POSTGRES_PASSWORD=password' \
		-e 'POSTGRES_USER=card-catalog' \
		-e 'POSTGRES_DB=card-catalog' \
		-v '$(PROGRAM)-vol:/var/lib/postgresql/data' \
		-p '5432:5432' \
		'$(PROGRAM):$(LABEL)'

remove-image:
	docker image rm '$(PROGRAM):$(LABEL)' || true
