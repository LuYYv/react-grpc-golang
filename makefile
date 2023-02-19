

server:
	protoc --go_out=server/grpc --go_opt=paths=source_relative \
		--go-grpc_out=server/grpc --go-grpc_opt=paths=source_relative \
		proto/greet.proto

client:
	protoc \
    --js_out=import_style=commonjs:client/src/grpc \
    --grpc-web_out=import_style=typescript,mode=grpcwebtext:client/src/grpc \
		proto/greet.proto

clean:
	rm -rf server/grpc server/lyy
	mkdir server/grpc