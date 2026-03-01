#Build Stage
FROM golang:1.23 AS builder
COPY go.mod main.go templates/
RUN CGO_ENABLED=0 go build -o myapp .

#Final Stage
FROM scratch
COPY --from=builder /go/myapp /myapp
COPY --from=builder /go/templates /templates
CMD ["/myapp"]