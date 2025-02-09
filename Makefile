IMAGE=njavilas/godev

build:
	docker build -t $(IMAGE) .

push:
	docker push $(IMAGE)

install:
	@echo "Limpiando y actualizando las dependencias..."
	go mod tidy