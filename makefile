

server:
	protoc --go_out=server/grpc --go_opt=paths=source_relative \
		--go-grpc_out=server/grpc --go-grpc_opt=paths=source_relative \
		proto/greet.proto

webapp:
	protoc \
    --js_out=import_style=commonjs:webapp/src/grpc \
    --grpc-web_out=import_style=typescript,mode=grpcwebtext:webapp/src/grpc \
		proto/greet.proto

clean:
	rm -rf server/grpc server/lyy
	mkdir server/grpc

proxy:
	grpcwebproxy \
    --backend_addr=172.25.158.208:50051 \
    --run_tls_server=false \
		--use_websockets \
		--allow_all_origins