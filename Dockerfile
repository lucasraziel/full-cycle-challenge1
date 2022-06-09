FROM golang AS builder

WORKDIR /app

COPY go.mod .

COPY hello.go .

RUN go build

CMD ["echo", "builded"]

FROM scratch

WORKDIR /app

COPY --from=builder /app/hello .

CMD [ "/app/hello" ]