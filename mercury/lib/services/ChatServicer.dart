import 'package:flutter/material.dart';
import 'package:mercury/protos_generated/protos/msgExchange.pb.dart';
import 'package:mercury/protos_generated/protos/msgExchange.pbenum.dart';
import 'package:mercury/protos_generated/protos/msgExchange.pbgrpc.dart';
import 'package:mercury/protos_generated/protos/msgExchange.pbjson.dart';
import 'package:grpc/grpc.dart';

class ChatServicer {
  static MessageTransmissionClient client;

  ChatServicer() {
    client = MessageTransmissionClient(
      ClientChannel(
        "10.0.2.2",
        port: 50051,
        options: ChannelOptions(
          credentials: ChannelCredentials.insecure(),
        ),
      ),
    );
  }

  static Future<Message> sndMsg(String message) async {
    client.sendMessage(Message()..msg = message).toString();
  }

  Stream<Message> rcvMsg() async* {
    Message msg = Message();
    await for (var msg in client.sendMessage(msg)) {
      yield msg;
    }
  }
}
