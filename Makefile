.PHONY: build test shell clean

build:
	docker build -t daymet_chicago .

test:
	docker run --rm -v "${PWD}/test":/tmp daymet_chicago loyalty_degauss.csv

shell:
	docker run --rm -it --entrypoint=/bin/bash -v "${PWD}":/tmp daymet_chicago

clean:
	docker system prune -f
