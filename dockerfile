# Dockerfile для запуску тестового набору на різних платформах та архітектурах

FROM --platform=$BUILDPLATFORM golang:1.20 as builder

ARG TARGETOS
ARG TARGETARCH

WORKDIR /app

COPY . .

RUN CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -o myapp main.go

FROM --platform=$TARGETPLATFORM scratch

WORKDIR /root/

COPY --from=builder /app/myapp .

CMD ["./myapp"]





