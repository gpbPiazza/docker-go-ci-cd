# BUILD
FROM golang:1.17-alpine AS build
WORKDIR /app
COPY go.* ./
RUN go mod download
COPY . .
RUN go build -o /docker-go-ci-cd
EXPOSE 5050
CMD ["/docker-go-ci-cd"]

# DEPLOY Não to entendendo porque isso ta errado pedir ajuda pro tácio
# FROM gcr.io/distroless/base-debian10
# WORKDIR /
# COPY --from=build /docker-go-ci-cd /docker-go-ci-cd
# EXPOSE 5050
# USER nonroot:nonroot
# ENTRYPOINT ["/docker-go-ci-cd"]