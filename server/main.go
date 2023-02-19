package main

import (
	"context"
	"log"
	"net"

	pb "lyy/test/grpc/proto"

	"lyy/test/utils"

	"google.golang.org/grpc"
)

const (
	port = ":50051"
)

type server struct {
	pb.UnimplementedGreeterServer
}

func (s *server) mustEmbedUnimplementedGreeterServer() {
	panic("not implemented")
}

func (s *server) SayHello(ctx context.Context, in *pb.HelloRequest) (*pb.HelloReply, error) {
	log.Printf("Received: %v", in.Name)
	return &pb.HelloReply{Message: "Hello " + in.Name}, nil
}

func main() {
	lis, err := net.Listen("tcp", port)
	if err != nil {
		log.Fatalf("failed to listen: %v", err)
	}
	s := grpc.NewServer()
	ip, err := utils.GetlocalIP()
	if err != nil {
		log.Fatalf("failed to get ip: %v", err)
	}
	pb.RegisterGreeterServer(s, &server{})
	log.Printf("running in %s%s", ip, port)
	if err := s.Serve(lis); err != nil {
		log.Fatalf("failed to serve: %v", err)
	}
}
