///
//  Generated code. Do not modify.
//  source: protos/messenger.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'messenger.pb.dart' as $0;
export 'messenger.pb.dart';

class MessengerClient extends $grpc.Client {
  static final _$sendMessage = $grpc.ClientMethod<$0.Message, $0.Message>(
      '/Messenger/SendMessage',
      ($0.Message value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Message.fromBuffer(value));

  MessengerClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.Message> sendMessage($0.Message request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$sendMessage, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class MessengerServiceBase extends $grpc.Service {
  $core.String get $name => 'Messenger';

  MessengerServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Message, $0.Message>(
        'SendMessage',
        sendMessage_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Message.fromBuffer(value),
        ($0.Message value) => value.writeToBuffer()));
  }

  $async.Future<$0.Message> sendMessage_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Message> request) async {
    return sendMessage(call, await request);
  }

  $async.Future<$0.Message> sendMessage(
      $grpc.ServiceCall call, $0.Message request);
}
