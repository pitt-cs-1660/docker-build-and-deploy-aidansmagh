#Build Stage
FROM golang:1.23
COPY go.mod main.go templates/
RUN CGO_ENABLED=0 go build -o <binary-name> .

#Final Stage
FROM scratch
COPY templates/
COPY --from=0 /go/myapp
CMD ["/myapp"]