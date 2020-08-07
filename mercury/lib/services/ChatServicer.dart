import 'package:flutter/material.dart';
import 'package:mercury/protos_generated/protos/msgExchange.pb.dart';
import 'package:mercury/protos_generated/protos/msgExchange.pbenum.dart';
import 'package:mercury/protos_generated/protos/msgExchange.pbgrpc.dart';
import 'package:mercury/protos_generated/protos/msgExchange.pbjson.dart';
import 'package:grpc/grpc.dart';
import 'package:mercury/protos_generated/protos/helloworld.pb.dart';
import 'package:mercury/protos_generated/protos/helloworld.pbenum.dart';
import 'package:mercury/protos_generated/protos/helloworld.pbgrpc.dart';
import 'package:mercury/protos_generated/protos/helloworld.pbjson.dart';

class ChatServicer {
  Future<void> main(List<String> args) async {
    final channel = ClientChannel(
      'localhost',
      port: 50051,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final stub = GreeterClient(channel);

    final name = args.isNotEmpty ? args[0] : 'world';

    try {
      final response = await stub.sayHello(HelloRequest()..name = name);
      print('Greeter client received: ${response.message}');
    } catch (e) {
      print('Caught error: $e');
    }
    await channel.shutdown();
  }
}

// class ChatServicer {
//   static MessageTransmissionClient client;

//   ChatServicer() {
//     client = MessageTransmissionClient(
//       ClientChannel(
//         "10.0.2.2",
//         port: 50051,
//         options: ChannelOptions(
//           credentials: ChannelCredentials.insecure(),
//         ),
//       ),
//     );
//   }

//   static Future<Message> sndMsg(String message) async {
//     client.sendMessage(Message()..msg = message).toString();
//   }

//   Future<Message> rcvMsg() async {
//     Message msg = Message();
//     var msg = await client.sendMessage(msg) {
//     return msg;
//     };
//   }
// }
