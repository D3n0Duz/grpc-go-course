package main

import (
	"fmt"
	"io"
	"log"
	"net"

	"google.golang.org/grpc/credentials"
	"google.golang.org/grpc/reflection"

	"github.com/D3n0Duz/grpc-go-course/chat/proto"

	"google.golang.org/grpc"
)

type server struct{}

func (*server) Chat(stream proto.ChatService_ChatServer) error {
	fmt.Printf("Chat function was invoked with a streaming request\n")

	for {
		req, err := stream.Recv()
		if err == io.EOF {
			return nil
		}
		if err != nil {
			log.Fatalf("Error while reading client stream: %v", err)
			return err
		}
		message := req.GetChat().GetMessage()

		sendErr := stream.Send(&proto.ChatResponse{
			Chat: &proto.Chat{
				Message: message,
			},
		})
		if sendErr != nil {
			log.Fatalf("Error while sending data to client: %v", sendErr)
			return sendErr
		}
	}
}

func main() {
	fmt.Println("Server is starting ...")

	lis, err := net.Listen("tcp", "127.0.0.1:50051")
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
	fmt.Println(&lis)
	proto.RegisterChatServiceServer(s, &server{})

	reflection.Register(s)

	if err := s.Serve(lis); err != nil {
		log.Fatalf("failed to serve: %v", err)
	} else {
		fmt.Println("Server started!")
	}
}
