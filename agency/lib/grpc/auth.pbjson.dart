///
//  Generated code. Do not modify.
//  source: auth.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use authErrorDescriptor instead')
const AuthError$json = const {
  '1': 'AuthError',
  '2': const [
    const {'1': 'MISMATCHED_PASSWORD', '2': 0},
    const {'1': 'NONEXISTENT_USER', '2': 1},
    const {'1': 'DUPLICATED_NAME', '2': 2},
    const {'1': 'UNVERIFIED', '2': 3},
    const {'1': 'UNKNOWN', '2': 4},
  ],
};

/// Descriptor for `AuthError`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List authErrorDescriptor = $convert.base64Decode('CglBdXRoRXJyb3ISFwoTTUlTTUFUQ0hFRF9QQVNTV09SRBAAEhQKEE5PTkVYSVNURU5UX1VTRVIQARITCg9EVVBMSUNBVEVEX05BTUUQAhIOCgpVTlZFUklGSUVEEAMSCwoHVU5LTk9XThAE');
@$core.Deprecated('Use loginRequestDescriptor instead')
const LoginRequest$json = const {
  '1': 'LoginRequest',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `LoginRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginRequestDescriptor = $convert.base64Decode('CgxMb2dpblJlcXVlc3QSEgoEbmFtZRgBIAEoCVIEbmFtZRIaCghwYXNzd29yZBgCIAEoCVIIcGFzc3dvcmQ=');
@$core.Deprecated('Use registerRequestDescriptor instead')
const RegisterRequest$json = const {
  '1': 'RegisterRequest',
  '2': const [
    const {'1': 'corp', '3': 1, '4': 1, '5': 9, '10': 'corp'},
    const {'1': 'corp_id', '3': 2, '4': 1, '5': 9, '10': 'corpId'},
    const {'1': 'com_regd_addr', '3': 3, '4': 1, '5': 9, '10': 'comRegdAddr'},
    const {'1': 'contact', '3': 4, '4': 1, '5': 9, '10': 'contact'},
    const {'1': 'name', '3': 5, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'password', '3': 6, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `RegisterRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerRequestDescriptor = $convert.base64Decode('Cg9SZWdpc3RlclJlcXVlc3QSEgoEY29ycBgBIAEoCVIEY29ycBIXCgdjb3JwX2lkGAIgASgJUgZjb3JwSWQSIgoNY29tX3JlZ2RfYWRkchgDIAEoCVILY29tUmVnZEFkZHISGAoHY29udGFjdBgEIAEoCVIHY29udGFjdBISCgRuYW1lGAUgASgJUgRuYW1lEhoKCHBhc3N3b3JkGAYgASgJUghwYXNzd29yZA==');
@$core.Deprecated('Use loginReplyDescriptor instead')
const LoginReply$json = const {
  '1': 'LoginReply',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'error', '3': 2, '4': 1, '5': 14, '6': '.easyrent.agency.auth.AuthError', '9': 0, '10': 'error', '17': true},
  ],
  '8': const [
    const {'1': '_error'},
  ],
};

/// Descriptor for `LoginReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginReplyDescriptor = $convert.base64Decode('CgpMb2dpblJlcGx5EhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSOgoFZXJyb3IYAiABKA4yHy5lYXN5cmVudC5hZ2VuY3kuYXV0aC5BdXRoRXJyb3JIAFIFZXJyb3KIAQFCCAoGX2Vycm9y');
@$core.Deprecated('Use registerReplyDescriptor instead')
const RegisterReply$json = const {
  '1': 'RegisterReply',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'error', '3': 2, '4': 1, '5': 14, '6': '.easyrent.agency.auth.AuthError', '9': 0, '10': 'error', '17': true},
  ],
  '8': const [
    const {'1': '_error'},
  ],
};

/// Descriptor for `RegisterReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerReplyDescriptor = $convert.base64Decode('Cg1SZWdpc3RlclJlcGx5EhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSOgoFZXJyb3IYAiABKA4yHy5lYXN5cmVudC5hZ2VuY3kuYXV0aC5BdXRoRXJyb3JIAFIFZXJyb3KIAQFCCAoGX2Vycm9y');
