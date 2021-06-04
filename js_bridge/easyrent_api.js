var messages = require("./grpc/js_bridge/proto/post_pb");
var services = require("./grpc/js_bridge/proto/post_grpc_pb");

var grpc = require('@grpc/grpc-js');

var client = new services.JsBridgeClient('1.116.216.141:8081', grpc.credentials.createInsecure());

async function fetchPost() {
    var fetchRequest = messages.FetchRequest();
    var postPackage = await client.onFetch(fetchRequest, );
}

function handleFetchResp(err, response) {
    var p = response.getMessage();
}

async function passPost(uuid) {
    return client.onPass(messages.PassRequest(uuid))
}

function hello() {
    console.log("Hello");
}

module.exports = {
    fetchPost: fetchPost,
    passPost: passPost,
    hello: hello,
}
