///
//  Generated code. Do not modify.
//  source: post.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use submitRentRequestDescriptor instead')
const SubmitRentRequest$json = const {
  '1': 'SubmitRentRequest',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'phone', '3': 2, '4': 1, '5': 9, '10': 'phone'},
    const {'1': 'room_addr', '3': 3, '4': 1, '5': 9, '10': 'roomAddr'},
    const {'1': 'room_area', '3': 4, '4': 1, '5': 5, '10': 'roomArea'},
    const {'1': 'room_type', '3': 5, '4': 1, '5': 9, '10': 'roomType'},
    const {'1': 'room_orientation', '3': 6, '4': 1, '5': 9, '10': 'roomOrientation'},
    const {'1': 'room_floor', '3': 7, '4': 1, '5': 5, '10': 'roomFloor'},
    const {'1': 'price', '3': 8, '4': 1, '5': 5, '10': 'price'},
    const {'1': 'restriction', '3': 9, '4': 1, '5': 9, '10': 'restriction'},
    const {'1': 'create_by', '3': 10, '4': 1, '5': 9, '10': 'createBy'},
  ],
};

/// Descriptor for `SubmitRentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List submitRentRequestDescriptor = $convert.base64Decode('ChFTdWJtaXRSZW50UmVxdWVzdBISCgRuYW1lGAEgASgJUgRuYW1lEhQKBXBob25lGAIgASgJUgVwaG9uZRIbCglyb29tX2FkZHIYAyABKAlSCHJvb21BZGRyEhsKCXJvb21fYXJlYRgEIAEoBVIIcm9vbUFyZWESGwoJcm9vbV90eXBlGAUgASgJUghyb29tVHlwZRIpChByb29tX29yaWVudGF0aW9uGAYgASgJUg9yb29tT3JpZW50YXRpb24SHQoKcm9vbV9mbG9vchgHIAEoBVIJcm9vbUZsb29yEhQKBXByaWNlGAggASgFUgVwcmljZRIgCgtyZXN0cmljdGlvbhgJIAEoCVILcmVzdHJpY3Rpb24SGwoJY3JlYXRlX2J5GAogASgJUghjcmVhdGVCeQ==');
@$core.Deprecated('Use submitHelpRequestDescriptor instead')
const SubmitHelpRequest$json = const {
  '1': 'SubmitHelpRequest',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'phone', '3': 2, '4': 1, '5': 9, '10': 'phone'},
    const {'1': 'expected_addr', '3': 3, '4': 1, '5': 9, '10': 'expectedAddr'},
    const {'1': 'expected_price', '3': 4, '4': 1, '5': 5, '10': 'expectedPrice'},
    const {'1': 'demands', '3': 5, '4': 1, '5': 9, '10': 'demands'},
  ],
};

/// Descriptor for `SubmitHelpRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List submitHelpRequestDescriptor = $convert.base64Decode('ChFTdWJtaXRIZWxwUmVxdWVzdBISCgRuYW1lGAEgASgJUgRuYW1lEhQKBXBob25lGAIgASgJUgVwaG9uZRIjCg1leHBlY3RlZF9hZGRyGAMgASgJUgxleHBlY3RlZEFkZHISJQoOZXhwZWN0ZWRfcHJpY2UYBCABKAVSDWV4cGVjdGVkUHJpY2USGAoHZGVtYW5kcxgFIAEoCVIHZGVtYW5kcw==');
@$core.Deprecated('Use submitReplyDescriptor instead')
const SubmitReply$json = const {
  '1': 'SubmitReply',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `SubmitReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List submitReplyDescriptor = $convert.base64Decode('CgtTdWJtaXRSZXBseRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNz');
