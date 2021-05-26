// GENERATED CODE -- DO NOT EDIT!

'use strict';
var grpc = require('@grpc/grpc-js');
var proto_post_pb = require('../proto/post_pb.js');

function serialize_easyrent_post_SubmitReply(arg) {
  if (!(arg instanceof proto_post_pb.SubmitReply)) {
    throw new Error('Expected argument of type easyrent.post.SubmitReply');
  }
  return Buffer.from(arg.serializeBinary());
}

function deserialize_easyrent_post_SubmitReply(buffer_arg) {
  return proto_post_pb.SubmitReply.deserializeBinary(new Uint8Array(buffer_arg));
}

function serialize_easyrent_post_SubmitRequest(arg) {
  if (!(arg instanceof proto_post_pb.SubmitRequest)) {
    throw new Error('Expected argument of type easyrent.post.SubmitRequest');
  }
  return Buffer.from(arg.serializeBinary());
}

function deserialize_easyrent_post_SubmitRequest(buffer_arg) {
  return proto_post_pb.SubmitRequest.deserializeBinary(new Uint8Array(buffer_arg));
}


var postService = exports.postService = {
  onSubmit: {
    path: '/easyrent.post.post/OnSubmit',
    requestStream: false,
    responseStream: false,
    requestType: proto_post_pb.SubmitRequest,
    responseType: proto_post_pb.SubmitReply,
    requestSerialize: serialize_easyrent_post_SubmitRequest,
    requestDeserialize: deserialize_easyrent_post_SubmitRequest,
    responseSerialize: serialize_easyrent_post_SubmitReply,
    responseDeserialize: deserialize_easyrent_post_SubmitReply,
  },
};

exports.postClient = grpc.makeGenericClientConstructor(postService);
