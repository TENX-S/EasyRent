# npm install -g grpc-tools
grpc_tools_node_protoc --js_out=import_style=commonjs,binary:js/grpc --grpc_out=grpc_js:js/grpc proto/post.proto
