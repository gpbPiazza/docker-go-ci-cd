# BUILD
FROM golang:1.17-alpine AS build
WORKDIR /app
COPY go.mod ./
COPY go.sum ./
RUN go mod download
COPY *.go ./

RUN go build -o /docker-go-ci-cd

# DEPLOY

FROM gcr.io/distroless/base-debian10

WORKDIR /

COPY --from=build /docker-go-ci-cd /docker-go-ci-cd

EXPOSE 5050

USER nonroot:nonroot

ENTRYPOINT ["/docker-go-ci-cd"]