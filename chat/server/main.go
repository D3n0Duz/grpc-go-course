package main

import (
	"fmt"
	"log"
	"net"

	"google.golang.org/grpc/credentials"

	"github.com/D3n0Duz/grpc-go-course/chat/proto"

	"google.golang.org/grpc"
)

type server struct{}

func (*server) Chat(proto.ChatService_ChatClient) error {

}

func main() {
	fmt.Println("Server is starting ...")

	lis, err := net.Listen("tcp", "0.0.0.0:50051")
	if err != nil {
		log.Fatalf("Failed to listen: %v", err)
	}

	opts := []grpc.ServerOption{}
	tls := false
	if tls {
		certFile := "ssl/server.crt"
		keyFile := "ssl/server.pem"
		creds, sslErr := credentials.NewServerTLSFromFile(certFile, keyFile)
		if sslErr != nil {
			log.Fatalf("Failed loading certificates: %v", sslErr)
			return
		}
		opts = append(opts, grpc.Creds(creds))
	}

	s := grpc.NewServer(opts...)
	greetpb.RegisterGreetServiceServer(s, &server{})

	if err := s.Serve(lis); err != nil {
		log.Fatalf("failed to serve: %v", err)
	} else {
		fmt.Println("Server started!")
	}
}
