# syntax=docker/dockerfile:1

##
## STEP 1 - BUILD
##
ARG GOLANG_VERSION
FROM golang:${GOLANG_VERSION}-alpine AS build
WORKDIR /app
COPY . .

RUN go mod download
RUN go build -o /go_example cmd/simple-service/main.go 


##
## STEP 2 - DEPLOY
##
FROM scratch
WORKDIR /
COPY --from=build /go_example /go_example
COPY --from=build /etc/passwd /etc/passwd

EXPOSE 8000
ENTRYPOINT ["/go_example"]
