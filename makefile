# Змінні для ім'я образу та його тега
IMAGE_NAME := my-makefile
IMAGE_TAG := v1.0

# Призначення для збирання коду для Linux
linux:
    GOOS=linux GOARCH=amd64 go build -o $(my-makefile)

# Призначення для збирання коду для ARM
arm:
    GOOS=linux GOARCH=arm go build -o $(my-makefile)

# Призначення для збирання коду для macOS
macos:
    GOOS=darwin GOARCH=amd64 go build -o $(my-makefile)

# Призначення для збирання коду для Windows
windows:
    GOOS=windows GOARCH=amd64 go build -o $(my-makefile).exe

# Призначення для видалення новоствореного образу
clean:
    docker rmi $(my-makefile):$(IMAGE_TAG)

build:
    docker build -t $(IMAGE_NAME):$(IMAGE_TAG) .


