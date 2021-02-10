#!/bin/bash

brew install protobuf 
go get -u google.golang.org/grpc
go get -u github.com/golang/protobuf/protoc-gen-go
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOROOT:$GOPATH:$GOBIN

protoc greet/greetpb/greet.proto --go_out=plugins=grpc:.
protoc calculator/calculatorpb/calculator.proto --go_out=plugins=grpc:.
protoc blog/blogpb/blog.proto --go_out=plugins=grpc:.

protoc authorization/proto/authorization.proto --go_out=plugins=grpc:.
protoc chat/proto/chat.proto --go_out=plugins=grpc:.
