FROM golang:1.5.1
MAINTAINER \
  William Riancho <william.riancho@nanocloud.com>

RUN go get -u github.com/constabulary/gb/...

RUN apt-get update && apt-get install libldap2-dev

COPY . /app
WORKDIR /app
RUN gb build

CMD ["./bin/ldap"]
