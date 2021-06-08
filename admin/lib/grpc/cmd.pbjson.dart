///
//  Generated code. Do not modify.
//  source: cmd.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use loadAgentsRequestDescriptor instead')
const LoadAgentsRequest$json = const {
  '1': 'LoadAgentsRequest',
};

/// Descriptor for `LoadAgentsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loadAgentsRequestDescriptor = $convert.base64Decode('ChFMb2FkQWdlbnRzUmVxdWVzdA==');
@$core.Deprecated('Use loadRentPostsRequestDescriptor instead')
const LoadRentPostsRequest$json = const {
  '1': 'LoadRentPostsRequest',
};

/// Descriptor for `LoadRentPostsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loadRentPostsRequestDescriptor = $convert.base64Decode('ChRMb2FkUmVudFBvc3RzUmVxdWVzdA==');
@$core.Deprecated('Use loadHelpPostsRequestDescriptor instead')
const LoadHelpPostsRequest$json = const {
  '1': 'LoadHelpPostsRequest',
};

/// Descriptor for `LoadHelpPostsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loadHelpPostsRequestDescriptor = $convert.base64Decode('ChRMb2FkSGVscFBvc3RzUmVxdWVzdA==');
@$core.Deprecated('Use passAgentRequestDescriptor instead')
const passAgentRequest$json = const {
  '1': 'passAgentRequest',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `passAgentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List passAgentRequestDescriptor = $convert.base64Decode('ChBwYXNzQWdlbnRSZXF1ZXN0EhIKBG5hbWUYASABKAlSBG5hbWU=');
@$core.Deprecated('Use passPostRequestDescriptor instead')
const passPostRequest$json = const {
  '1': 'passPostRequest',
  '2': const [
    const {'1': 'uuid', '3': 2, '4': 1, '5': 9, '10': 'uuid'},
  ],
};

/// Descriptor for `passPostRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List passPostRequestDescriptor = $convert.base64Decode('Cg9wYXNzUG9zdFJlcXVlc3QSEgoEdXVpZBgCIAEoCVIEdXVpZA==');
@$core.Deprecated('Use passReplyDescriptor instead')
const passReply$json = const {
  '1': 'passReply',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `passReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List passReplyDescriptor = $convert.base64Decode('CglwYXNzUmVwbHkSGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2Vzcw==');
@$core.Deprecated('Use unverifiedAgentDescriptor instead')
const UnverifiedAgent$json = const {
  '1': 'UnverifiedAgent',
  '2': const [
    const {'1': 'corp', '3': 1, '4': 1, '5': 9, '10': 'corp'},
    const {'1': 'corp_id', '3': 2, '4': 1, '5': 9, '10': 'corpId'},
    const {'1': 'com_regd_addr', '3': 3, '4': 1, '5': 9, '10': 'comRegdAddr'},
    const {'1': 'contact', '3': 4, '4': 1, '5': 9, '10': 'contact'},
    const {'1': 'name', '3': 5, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `UnverifiedAgent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List unverifiedAgentDescriptor = $convert.base64Decode('Cg9VbnZlcmlmaWVkQWdlbnQSEgoEY29ycBgBIAEoCVIEY29ycBIXCgdjb3JwX2lkGAIgASgJUgZjb3JwSWQSIgoNY29tX3JlZ2RfYWRkchgDIAEoCVILY29tUmVnZEFkZHISGAoHY29udGFjdBgEIAEoCVIHY29udGFjdBISCgRuYW1lGAUgASgJUgRuYW1l');
@$core.Deprecated('Use unverifiedRentPostDescriptor instead')
const UnverifiedRentPost$json = const {
  '1': 'UnverifiedRentPost',
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
    const {'1': 'uuid', '3': 11, '4': 1, '5': 9, '10': 'uuid'},
    const {'1': 'release_time', '3': 12, '4': 1, '5': 9, '10': 'releaseTime'},
    const {'1': 'pictures', '3': 13, '4': 3, '5': 12, '10': 'pictures'},
  ],
};

/// Descriptor for `UnverifiedRentPost`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List unverifiedRentPostDescriptor = $convert.base64Decode('ChJVbnZlcmlmaWVkUmVudFBvc3QSEgoEbmFtZRgBIAEoCVIEbmFtZRIUCgVwaG9uZRgCIAEoCVIFcGhvbmUSGwoJcm9vbV9hZGRyGAMgASgJUghyb29tQWRkchIbCglyb29tX2FyZWEYBCABKAVSCHJvb21BcmVhEhsKCXJvb21fdHlwZRgFIAEoCVIIcm9vbVR5cGUSKQoQcm9vbV9vcmllbnRhdGlvbhgGIAEoCVIPcm9vbU9yaWVudGF0aW9uEh0KCnJvb21fZmxvb3IYByABKAVSCXJvb21GbG9vchIgCgtkZXNjcmlwdGlvbhgIIAEoCVILZGVzY3JpcHRpb24SFAoFcHJpY2UYCSABKAVSBXByaWNlEiAKC3Jlc3RyaWN0aW9uGAogASgJUgtyZXN0cmljdGlvbhISCgR1dWlkGAsgASgJUgR1dWlkEiEKDHJlbGVhc2VfdGltZRgMIAEoCVILcmVsZWFzZVRpbWUSGgoIcGljdHVyZXMYDSADKAxSCHBpY3R1cmVz');
@$core.Deprecated('Use unverifiedHelpPostDescriptor instead')
const UnverifiedHelpPost$json = const {
  '1': 'UnverifiedHelpPost',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'phone', '3': 2, '4': 1, '5': 9, '10': 'phone'},
    const {'1': 'expected_addr', '3': 3, '4': 1, '5': 9, '10': 'expectedAddr'},
    const {'1': 'expected_price', '3': 4, '4': 1, '5': 5, '10': 'expectedPrice'},
    const {'1': 'demands', '3': 5, '4': 1, '5': 9, '10': 'demands'},
    const {'1': 'uuid', '3': 6, '4': 1, '5': 9, '10': 'uuid'},
    const {'1': 'release_time', '3': 7, '4': 1, '5': 9, '10': 'releaseTime'},
  ],
};

/// Descriptor for `UnverifiedHelpPost`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List unverifiedHelpPostDescriptor = $convert.base64Decode('ChJVbnZlcmlmaWVkSGVscFBvc3QSEgoEbmFtZRgBIAEoCVIEbmFtZRIUCgVwaG9uZRgCIAEoCVIFcGhvbmUSIwoNZXhwZWN0ZWRfYWRkchgDIAEoCVIMZXhwZWN0ZWRBZGRyEiUKDmV4cGVjdGVkX3ByaWNlGAQgASgFUg1leHBlY3RlZFByaWNlEhgKB2RlbWFuZHMYBSABKAlSB2RlbWFuZHMSEgoEdXVpZBgGIAEoCVIEdXVpZBIhCgxyZWxlYXNlX3RpbWUYByABKAlSC3JlbGVhc2VUaW1l');
@$core.Deprecated('Use rentPostsDescriptor instead')
const RentPosts$json = const {
  '1': 'RentPosts',
  '2': const [
    const {'1': 'rent_posts', '3': 1, '4': 3, '5': 11, '6': '.easyrent.admin.command.UnverifiedRentPost', '10': 'rentPosts'},
  ],
};

/// Descriptor for `RentPosts`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rentPostsDescriptor = $convert.base64Decode('CglSZW50UG9zdHMSSQoKcmVudF9wb3N0cxgBIAMoCzIqLmVhc3lyZW50LmFkbWluLmNvbW1hbmQuVW52ZXJpZmllZFJlbnRQb3N0UglyZW50UG9zdHM=');
@$core.Deprecated('Use helpPostsDescriptor instead')
const HelpPosts$json = const {
  '1': 'HelpPosts',
  '2': const [
    const {'1': 'help_posts', '3': 1, '4': 3, '5': 11, '6': '.easyrent.admin.command.UnverifiedHelpPost', '10': 'helpPosts'},
  ],
};

/// Descriptor for `HelpPosts`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List helpPostsDescriptor = $convert.base64Decode('CglIZWxwUG9zdHMSSQoKaGVscF9wb3N0cxgBIAMoCzIqLmVhc3lyZW50LmFkbWluLmNvbW1hbmQuVW52ZXJpZmllZEhlbHBQb3N0UgloZWxwUG9zdHM=');
@$core.Deprecated('Use agentsDescriptor instead')
const Agents$json = const {
  '1': 'Agents',
  '2': const [
    const {'1': 'agent', '3': 1, '4': 3, '5': 11, '6': '.easyrent.admin.command.UnverifiedAgent', '10': 'agent'},
  ],
};

/// Descriptor for `Agents`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List agentsDescriptor = $convert.base64Decode('CgZBZ2VudHMSPQoFYWdlbnQYASADKAsyJy5lYXN5cmVudC5hZG1pbi5jb21tYW5kLlVudmVyaWZpZWRBZ2VudFIFYWdlbnQ=');
