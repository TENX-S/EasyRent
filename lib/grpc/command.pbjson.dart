///
//  Generated code. Do not modify.
//  source: command.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use fetchedRentPostDescriptor instead')
const FetchedRentPost$json = const {
  '1': 'FetchedRentPost',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'phone', '3': 2, '4': 1, '5': 9, '10': 'phone'},
    const {'1': 'room_addr', '3': 3, '4': 1, '5': 9, '10': 'roomAddr'},
    const {'1': 'room_area', '3': 4, '4': 1, '5': 5, '10': 'roomArea'},
    const {'1': 'room_type', '3': 5, '4': 1, '5': 9, '10': 'roomType'},
    const {'1': 'room_orientation', '3': 6, '4': 1, '5': 9, '10': 'roomOrientation'},
    const {'1': 'room_floor', '3': 7, '4': 1, '5': 5, '10': 'roomFloor'},
    const {'1': 'price', '3': 8, '4': 1, '5': 5, '10': 'price'},
  ],
};

/// Descriptor for `FetchedRentPost`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchedRentPostDescriptor = $convert.base64Decode('Cg9GZXRjaGVkUmVudFBvc3QSEgoEbmFtZRgBIAEoCVIEbmFtZRIUCgVwaG9uZRgCIAEoCVIFcGhvbmUSGwoJcm9vbV9hZGRyGAMgASgJUghyb29tQWRkchIbCglyb29tX2FyZWEYBCABKAVSCHJvb21BcmVhEhsKCXJvb21fdHlwZRgFIAEoCVIIcm9vbVR5cGUSKQoQcm9vbV9vcmllbnRhdGlvbhgGIAEoCVIPcm9vbU9yaWVudGF0aW9uEh0KCnJvb21fZmxvb3IYByABKAVSCXJvb21GbG9vchIUCgVwcmljZRgIIAEoBVIFcHJpY2U=');
@$core.Deprecated('Use fetchedHelpPostDescriptor instead')
const FetchedHelpPost$json = const {
  '1': 'FetchedHelpPost',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'phone', '3': 2, '4': 1, '5': 9, '10': 'phone'},
    const {'1': 'expected_addr', '3': 3, '4': 1, '5': 9, '10': 'expectedAddr'},
    const {'1': 'expected_price', '3': 4, '4': 1, '5': 5, '10': 'expectedPrice'},
    const {'1': 'demands', '3': 5, '4': 1, '5': 9, '10': 'demands'},
  ],
};

/// Descriptor for `FetchedHelpPost`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchedHelpPostDescriptor = $convert.base64Decode('Cg9GZXRjaGVkSGVscFBvc3QSEgoEbmFtZRgBIAEoCVIEbmFtZRIUCgVwaG9uZRgCIAEoCVIFcGhvbmUSIwoNZXhwZWN0ZWRfYWRkchgDIAEoCVIMZXhwZWN0ZWRBZGRyEiUKDmV4cGVjdGVkX3ByaWNlGAQgASgFUg1leHBlY3RlZFByaWNlEhgKB2RlbWFuZHMYBSABKAlSB2RlbWFuZHM=');
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
    const {'1': 'rent_post', '3': 1, '4': 3, '5': 11, '6': '.easyrent.command.FetchedRentPost', '10': 'rentPost'},
    const {'1': 'help_post', '3': 2, '4': 3, '5': 11, '6': '.easyrent.command.FetchedHelpPost', '10': 'helpPost'},
  ],
};

/// Descriptor for `RefreshReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List refreshReplyDescriptor = $convert.base64Decode('CgxSZWZyZXNoUmVwbHkSPgoJcmVudF9wb3N0GAEgAygLMiEuZWFzeXJlbnQuY29tbWFuZC5GZXRjaGVkUmVudFBvc3RSCHJlbnRQb3N0Ej4KCWhlbHBfcG9zdBgCIAMoCzIhLmVhc3lyZW50LmNvbW1hbmQuRmV0Y2hlZEhlbHBQb3N0UghoZWxwUG9zdA==');
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
