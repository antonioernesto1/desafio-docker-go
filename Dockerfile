FROM golang:1.23 AS builder

WORKDIR /app

COPY "src/desafio.go" .

RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-s -w" -a -installsuffix cgo -o main desafio.go

FROM scratch
COPY --from=builder /app/main /main
CMD ["/main"]