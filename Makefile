IMAGE=njavilas/godev

build:
	docker build -t $(IMAGE) .

push:
	docker push $(IMAGE)