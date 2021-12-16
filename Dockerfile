FROM debian:unstable-slim AS sed

ADD https://raw.githubusercontent.com/Softcatala/adaptadorvariants/master/tools/src2valencia.sed src2valencia.sed
RUN sed -e 's/\\(/\(/g' -e 's/\\|/\|/g' -e  's/\\)/\)/g' -e 's/\\1/${1}/g' -e 's/\\2/${2}/g' -e 's/\\3/${3}/g' -e 's/\\4/${4}/g' -i  src2valencia.sed


FROM golang:1.17-alpine as builder
WORKDIR /src
RUN apk update && apk add --no-cache git && rm -rf /var/cache/apk/*
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go get -t -d -v ./...
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go test -v ./...
COPY --from=sed /src2valencia.sed /tests/src2valencia.sed
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go test -v ./...
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags "-s -w" -o adaptago main.go

FROM scratch
WORKDIR /
COPY --from=builder /src/adaptago .
COPY --from=builder /src/res/template.po /template.po
COPY --from=sed /src2valencia.sed /regexps.txt

EXPOSE 8080

CMD ["./adaptago", "-file", "/regexps.txt", "-po", "/template.po"]
