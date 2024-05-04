
# Dockerfile for testing code on different platforms

FROM quay.io/projectquay/golang:1.20

WORKDIR /app
COPY . .

RUN go build -o myapp
 
CMD ["./myapp"]
