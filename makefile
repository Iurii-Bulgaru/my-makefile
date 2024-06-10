# Makefile для збірки коду на різних платформах та архітектурах

BINARY_NAME=myapp
VERSION=1.0
IMAGE_TAG=$(BINARY_NAME):$(VERSION)

.PHONY: all linux arm macos windows clean

all: linux arm macos windows

linux:
	GOOS=linux GOARCH=amd64 go build -o $(BINARY_NAME)-linux main.go

arm:
	GOOS=linux GOARCH=arm64 go build -o $(BINARY_NAME)-arm main.go

macos:
	GOOS=darwin GOARCH=amd64 go build -o $(BINARY_NAME)-macos main.go

windows:
	GOOS=windows GOARCH=amd64 go build -o $(BINARY_NAME).exe main.go

clean:
	rm -f $(BINARY_NAME)-linux $(BINARY_NAME)-arm $(BINARY_NAME)-macos $(BINARY_NAME).exe
	docker rmi $(IMAGE_TAG)
