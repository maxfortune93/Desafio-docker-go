FROM golang:alpine AS multistage
WORKDIR /app
COPY go.mod ./
COPY main.go ./

RUN go build -o /full-go

FROM alpine
COPY --from=multistage /full-go /full-go

WORKDIR /

CMD ["/full-go"]