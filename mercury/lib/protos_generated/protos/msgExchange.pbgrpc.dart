///
//  Generated code. Do not modify.
//  source: protos/msgExchange.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'msgExchange.pb.dart' as $0;
export 'msgExchange.pb.dart';

class MessageTransmissionClient extends $grpc.Client {
  static final _$sendMessage = $grpc.ClientMethod<$0.Message, $0.Message>(
      '/MessageTransmission/sendMessage',
      ($0.Message value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Message.fromBuffer(value));

  MessageTransmissionClient($grpc.ClientChannel channel,
      {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.Message> sendMessage($0.Message request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$sendMessage, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class MessageTransmissionServiceBase extends $grpc.Service {
  $core.String get $name => 'MessageTransmission';

  MessageTransmissionServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Message, $0.Message>(
        'sendMessage',
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
