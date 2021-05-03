///
//  Generated code. Do not modify.
//  source: easyrent.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use loginFailedReasonDescriptor instead')
const LoginFailedReason$json = const {
  '1': 'LoginFailedReason',
  '2': const [
    const {'1': 'WRONG_PASSWORD', '2': 0},
    const {'1': 'INEXISTENT_USER', '2': 1},
  ],
};

/// Descriptor for `LoginFailedReason`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List loginFailedReasonDescriptor = $convert.base64Decode('ChFMb2dpbkZhaWxlZFJlYXNvbhISCg5XUk9OR19QQVNTV09SRBAAEhMKD0lORVhJU1RFTlRfVVNFUhAB');
@$core.Deprecated('Use registerFailedReasonDescriptor instead')
const RegisterFailedReason$json = const {
  '1': 'RegisterFailedReason',
  '2': const [
    const {'1': 'DUPLICATED_USER', '2': 0},
  ],
};

/// Descriptor for `RegisterFailedReason`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List registerFailedReasonDescriptor = $convert.base64Decode('ChRSZWdpc3RlckZhaWxlZFJlYXNvbhITCg9EVVBMSUNBVEVEX1VTRVIQAA==');
@$core.Deprecated('Use authRequestDescriptor instead')
const AuthRequest$json = const {
  '1': 'AuthRequest',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `AuthRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authRequestDescriptor = $convert.base64Decode('CgtBdXRoUmVxdWVzdBISCgRuYW1lGAEgASgJUgRuYW1lEhoKCHBhc3N3b3JkGAIgASgJUghwYXNzd29yZA==');
@$core.Deprecated('Use loginReplyDescriptor instead')
const LoginReply$json = const {
  '1': 'LoginReply',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'failed_reason', '3': 2, '4': 1, '5': 14, '6': '.easyrent.LoginFailedReason', '9': 0, '10': 'failedReason', '17': true},
  ],
  '8': const [
    const {'1': '_failed_reason'},
  ],
};

/// Descriptor for `LoginReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginReplyDescriptor = $convert.base64Decode('CgpMb2dpblJlcGx5EhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSRQoNZmFpbGVkX3JlYXNvbhgCIAEoDjIbLmVhc3lyZW50LkxvZ2luRmFpbGVkUmVhc29uSABSDGZhaWxlZFJlYXNvbogBAUIQCg5fZmFpbGVkX3JlYXNvbg==');
@$core.Deprecated('Use registerReplyDescriptor instead')
const RegisterReply$json = const {
  '1': 'RegisterReply',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'failed_reason', '3': 2, '4': 1, '5': 14, '6': '.easyrent.RegisterFailedReason', '9': 0, '10': 'failedReason', '17': true},
  ],
  '8': const [
    const {'1': '_failed_reason'},
  ],
};

/// Descriptor for `RegisterReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerReplyDescriptor = $convert.base64Decode('Cg1SZWdpc3RlclJlcGx5EhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSSAoNZmFpbGVkX3JlYXNvbhgCIAEoDjIeLmVhc3lyZW50LlJlZ2lzdGVyRmFpbGVkUmVhc29uSABSDGZhaWxlZFJlYXNvbogBAUIQCg5fZmFpbGVkX3JlYXNvbg==');
