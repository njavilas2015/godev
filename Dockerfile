FROM golang:1.23.4-alpine3.20

ENV GO111MODULE=on \
    CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64 \
    GOROOT=/usr/local/go \
    GOPATH=/go \
    PATH=$PATH:/usr/local/go/bin:/go/bin

RUN apk update --no-cache && apk add --no-cache bash git gcc musl-dev curl make wget \ 
    bash-completion openssh-client postgresql-client openssl

ENV SHELL=/bin/bash

RUN echo "source /usr/share/bash-completion/completions/git" >> /root/.bashrc
    
RUN wget https://github.com/golangci/golangci-lint/releases/download/v1.62.2/golangci-lint-1.62.2-linux-amd64.tar.gz && \
    tar -xzvf golangci-lint-1.62.2-linux-amd64.tar.gz && \
    mv golangci-lint-1.62.2-linux-amd64/golangci-lint /usr/local/bin

RUN go install github.com/air-verse/air@latest && \
    go install golang.org/x/tools/gopls@latest && \
    go install github.com/gin-contrib/cors@v1.7.3 && \
    go install github.com/go-playground/validator/v10@v10.23.0 && \
    go install github.com/gorilla/websocket@v1.5.3 && \
    go install gopkg.in/gomail.v2@v2.0.0-20160411212932-81ebce5c23df && \
    go install gorm.io/driver/postgres@v1.5.11 && \
    go install github.com/dgrijalva/jwt-go@v3.2.0+incompatible && \
    go install github.com/gin-gonic/gin@v1.10.0 && \
    go install github.com/joho/godotenv@v1.5.1 && \
    go install github.com/lib/pq@v1.10.9 && \
    go install github.com/meilisearch/meilisearch-go@v0.29.0 && \
    go install github.com/mssola/useragent@v1.0.0 && \
    go install github.com/nats-io/nats.go@v1.38.0 && \
    go install golang.org/x/crypto@v0.32.0 && \
    go install golang.org/x/sync@v0.10.0 && \
    go install gorm.io/gorm@v1.25.10