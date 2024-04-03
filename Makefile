.PHONY: build test shell clean

build:
	docker build -t daymetdl .

test:
	docker run --rm -v "${PWD}":/tmp daymetdl loyalty_degauss.csv

shell:
	docker run --rm -it --entrypoint=/bin/bash -v "${PWD}":/tmp daymetdl

clean:
	docker system prune -f