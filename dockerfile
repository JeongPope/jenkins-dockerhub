FROM golang:1.17-alpine3.13

WORKDIR /tmp/jenkins
COPY . .

RUN go mod tidy
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -ldflags '-s -w' -o main .

ENTRYPOINT [ "/tmp/jenkins/main" ]