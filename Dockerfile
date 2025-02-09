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

RUN go install golang.org/x/tools/gopls@latest

RUN go install github.com/air-verse/air@latest

WORKDIR /usr/src/app

COPY . .

RUN make install