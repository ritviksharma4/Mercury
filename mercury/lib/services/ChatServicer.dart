import 'package:flutter/material.dart';
import 'package:mercury/protos_generated/protos/messenger.pb.dart';
import 'package:mercury/protos_generated/protos/messenger.pbenum.dart';
import 'package:mercury/protos_generated/protos/messenger.pbgrpc.dart';
import 'package:mercury/protos_generated/protos/messenger.pbjson.dart';
import 'package:grpc/grpc.dart';

class ChatServicer {
  Future<String> main(List<String> args) async {
    final channel = ClientChannel(
      '10.0.2.2',
      port: 50051,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final stub = MessengerClient(channel);

    final msg = args.isNotEmpty ? args[0] : 'world';

    try {
      final response = await stub.sendMessage(Message()..msg = msg);
      return response.msg;
    } catch (e) {
      print('Caught error: $e');
    }
    await channel.shutdown();
  }
}


