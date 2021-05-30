var messages = require("./grpc/proto/post_pb");
var services = require("./grpc/proto/post_grpc_pb");

var grpc = require('@grpc/grpc-js');

var client = new services.postClient('1.116.216.141:8081', grpc.credentials.createInsecure());

export function fetchPost() {

}
