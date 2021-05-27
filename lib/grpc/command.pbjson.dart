///
//  Generated code. Do not modify.
//  source: command.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use passedRentPostDescriptor instead')
const PassedRentPost$json = const {
  '1': 'PassedRentPost',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'phone', '3': 2, '4': 1, '5': 9, '10': 'phone'},
    const {'1': 'room_addr', '3': 3, '4': 1, '5': 9, '10': 'roomAddr'},
    const {'1': 'room_area', '3': 4, '4': 1, '5': 5, '10': 'roomArea'},
    const {'1': 'room_type', '3': 5, '4': 1, '5': 9, '10': 'roomType'},
    const {'1': 'room_orientation', '3': 6, '4': 1, '5': 9, '10': 'roomOrientation'},
    const {'1': 'room_floor', '3': 7, '4': 1, '5': 5, '10': 'roomFloor'},
    const {'1': 'description', '3': 8, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'price', '3': 9, '4': 1, '5': 5, '10': 'price'},
    const {'1': 'restriction', '3': 10, '4': 1, '5': 9, '10': 'restriction'},
    const {'1': 'release_time', '3': 11, '4': 1, '5': 9, '10': 'releaseTime'},
  ],
};

/// Descriptor for `PassedRentPost`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List passedRentPostDescriptor = $convert.base64Decode('Cg5QYXNzZWRSZW50UG9zdBISCgRuYW1lGAEgASgJUgRuYW1lEhQKBXBob25lGAIgASgJUgVwaG9uZRIbCglyb29tX2FkZHIYAyABKAlSCHJvb21BZGRyEhsKCXJvb21fYXJlYRgEIAEoBVIIcm9vbUFyZWESGwoJcm9vbV90eXBlGAUgASgJUghyb29tVHlwZRIpChByb29tX29yaWVudGF0aW9uGAYgASgJUg9yb29tT3JpZW50YXRpb24SHQoKcm9vbV9mbG9vchgHIAEoBVIJcm9vbUZsb29yEiAKC2Rlc2NyaXB0aW9uGAggASgJUgtkZXNjcmlwdGlvbhIUCgVwcmljZRgJIAEoBVIFcHJpY2USIAoLcmVzdHJpY3Rpb24YCiABKAlSC3Jlc3RyaWN0aW9uEiEKDHJlbGVhc2VfdGltZRgLIAEoCVILcmVsZWFzZVRpbWU=');
@$core.Deprecated('Use passedHelpPostDescriptor instead')
const PassedHelpPost$json = const {
  '1': 'PassedHelpPost',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'phone', '3': 2, '4': 1, '5': 9, '10': 'phone'},
    const {'1': 'expected_addr', '3': 3, '4': 1, '5': 9, '10': 'expectedAddr'},
    const {'1': 'expected_price', '3': 4, '4': 1, '5': 5, '10': 'expectedPrice'},
    const {'1': 'demands', '3': 5, '4': 1, '5': 9, '10': 'demands'},
    const {'1': 'release_time', '3': 8, '4': 1, '5': 9, '10': 'releaseTime'},
  ],
};

/// Descriptor for `PassedHelpPost`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List passedHelpPostDescriptor = $convert.base64Decode('Cg5QYXNzZWRIZWxwUG9zdBISCgRuYW1lGAEgASgJUgRuYW1lEhQKBXBob25lGAIgASgJUgVwaG9uZRIjCg1leHBlY3RlZF9hZGRyGAMgASgJUgxleHBlY3RlZEFkZHISJQoOZXhwZWN0ZWRfcHJpY2UYBCABKAVSDWV4cGVjdGVkUHJpY2USGAoHZGVtYW5kcxgFIAEoCVIHZGVtYW5kcxIhCgxyZWxlYXNlX3RpbWUYCCABKAlSC3JlbGVhc2VUaW1l');
@$core.Deprecated('Use refreshRequestDescriptor instead')
const RefreshRequest$json = const {
  '1': 'RefreshRequest',
};

/// Descriptor for `RefreshRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List refreshRequestDescriptor = $convert.base64Decode('Cg5SZWZyZXNoUmVxdWVzdA==');
@$core.Deprecated('Use refreshReplyDescriptor instead')
const RefreshReply$json = const {
  '1': 'RefreshReply',
  '2': const [
    const {'1': 'rent_post', '3': 1, '4': 3, '5': 11, '6': '.easyrent.command.PassedRentPost', '10': 'rentPost'},
    const {'1': 'help_post', '3': 2, '4': 3, '5': 11, '6': '.easyrent.command.PassedHelpPost', '10': 'helpPost'},
  ],
};

/// Descriptor for `RefreshReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List refreshReplyDescriptor = $convert.base64Decode('CgxSZWZyZXNoUmVwbHkSPQoJcmVudF9wb3N0GAEgAygLMiAuZWFzeXJlbnQuY29tbWFuZC5QYXNzZWRSZW50UG9zdFIIcmVudFBvc3QSPQoJaGVscF9wb3N0GAIgAygLMiAuZWFzeXJlbnQuY29tbWFuZC5QYXNzZWRIZWxwUG9zdFIIaGVscFBvc3Q=');
@$core.Deprecated('Use logoutRequestDescriptor instead')
const LogoutRequest$json = const {
  '1': 'LogoutRequest',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `LogoutRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List logoutRequestDescriptor = $convert.base64Decode('Cg1Mb2dvdXRSZXF1ZXN0EhIKBG5hbWUYASABKAlSBG5hbWU=');
@$core.Deprecated('Use logoutReplyDescriptor instead')
const LogoutReply$json = const {
  '1': 'LogoutReply',
};

/// Descriptor for `LogoutReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List logoutReplyDescriptor = $convert.base64Decode('CgtMb2dvdXRSZXBseQ==');
