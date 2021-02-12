///
//  Generated code. Do not modify.
//  source: chat/proto/chat.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'chat.pb.dart' as $0;
export 'chat.pb.dart';

class ChatServiceClient extends $grpc.Client {
  static final _$chat = $grpc.ClientMethod<$0.ChatRequest, $0.ChatResponse>(
      '/chat.ChatService/Chat',
      ($0.ChatRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ChatResponse.fromBuffer(value));

  ChatServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions options,
      $core.Iterable<$grpc.ClientInterceptor> interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseStream<$0.ChatResponse> chat(
      $async.Stream<$0.ChatRequest> request,
      {$grpc.CallOptions options}) {
    return $createStreamingCall(_$chat, request, options: options);
  }
}

abstract class ChatServiceBase extends $grpc.Service {
  $core.String get $name => 'chat.ChatService';

  ChatServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ChatRequest, $0.ChatResponse>(
        'Chat',
        chat,
        true,
        true,
        ($core.List<$core.int> value) => $0.ChatRequest.fromBuffer(value),
        ($0.ChatResponse value) => value.writeToBuffer()));
  }

  $async.Stream<$0.ChatResponse> chat(
      $grpc.ServiceCall call, $async.Stream<$0.ChatRequest> request);
}
