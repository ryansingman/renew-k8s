FROM golang:1.24.1-alpine AS builder

WORKDIR /app
COPY go.mod ./
RUN go mod download

COPY . .

RUN go build -o app main.go

FROM alpine:3

WORKDIR /app
COPY --from=builder /app/app .

EXPOSE 8080
CMD ["./app"]
