# BUILD
FROM golang:1.17-alpine AS build
WORKDIR /app
COPY go.* ./
RUN go mod download
COPY . . 
RUN go  build -o docker-go-ci-cd

# DEPLOY 
# # Use multi-stage builds
FROM alpine
WORKDIR /
COPY --from=build /app/docker-go-ci-cd /docker-go-ci-cd
EXPOSE 5050 
CMD ["./docker-go-ci-cd"]