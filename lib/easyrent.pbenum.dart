///
//  Generated code. Do not modify.
//  source: easyrent.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class LoginFailedReason extends $pb.ProtobufEnum {
  static const LoginFailedReason WRONG_PASSWORD = LoginFailedReason._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WRONG_PASSWORD');
  static const LoginFailedReason INEXISTENT_USER = LoginFailedReason._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'INEXISTENT_USER');

  static const $core.List<LoginFailedReason> values = <LoginFailedReason> [
    WRONG_PASSWORD,
    INEXISTENT_USER,
  ];

  static final $core.Map<$core.int, LoginFailedReason> _byValue = $pb.ProtobufEnum.initByValue(values);
  static LoginFailedReason? valueOf($core.int value) => _byValue[value];

  const LoginFailedReason._($core.int v, $core.String n) : super(v, n);
}

class RegisterFailedReason extends $pb.ProtobufEnum {
  static const RegisterFailedReason DUPLICATED_USER = RegisterFailedReason._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DUPLICATED_USER');

  static const $core.List<RegisterFailedReason> values = <RegisterFailedReason> [
    DUPLICATED_USER,
  ];

  static final $core.Map<$core.int, RegisterFailedReason> _byValue = $pb.ProtobufEnum.initByValue(values);
  static RegisterFailedReason? valueOf($core.int value) => _byValue[value];

  const RegisterFailedReason._($core.int v, $core.String n) : super(v, n);
}

