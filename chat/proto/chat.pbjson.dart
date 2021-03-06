///
//  Generated code. Do not modify.
//  source: chat/proto/chat.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use chatDescriptor instead')
const Chat$json = const {
  '1': 'Chat',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `Chat`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatDescriptor = $convert.base64Decode('CgRDaGF0EhgKB21lc3NhZ2UYASABKAlSB21lc3NhZ2U=');
@$core.Deprecated('Use chatRequestDescriptor instead')
const ChatRequest$json = const {
  '1': 'ChatRequest',
  '2': const [
    const {'1': 'chat', '3': 1, '4': 1, '5': 11, '6': '.chat.Chat', '10': 'chat'},
  ],
};

/// Descriptor for `ChatRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatRequestDescriptor = $convert.base64Decode('CgtDaGF0UmVxdWVzdBIeCgRjaGF0GAEgASgLMgouY2hhdC5DaGF0UgRjaGF0');
@$core.Deprecated('Use chatResponseDescriptor instead')
const ChatResponse$json = const {
  '1': 'ChatResponse',
  '2': const [
    const {'1': 'chat', '3': 1, '4': 1, '5': 11, '6': '.chat.Chat', '10': 'chat'},
  ],
};

/// Descriptor for `ChatResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatResponseDescriptor = $convert.base64Decode('CgxDaGF0UmVzcG9uc2USHgoEY2hhdBgBIAEoCzIKLmNoYXQuQ2hhdFIEY2hhdA==');
