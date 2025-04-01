FROM golang:1.24.1-alpine AS builder

WORKDIR /app
COPY go.mod ./
RUN go mod download

COPY . .

RUN go build -o app cmd/server/main.go

FROM alpine:3 as runner

WORKDIR /app
COPY --from=builder /app/app .

FROM runner as local

COPY .env .

EXPOSE 8080
CMD ["./app"]

FROM runner as prod

EXPOSE 8080
CMD ["./app"]