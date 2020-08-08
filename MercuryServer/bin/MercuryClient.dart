// Copyright (c) 2018, the gRPC project authors. Please see the AUTHORS file
// for details. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

/// Dart implementation of the gRPC helloworld.Greeter client.
import 'package:grpc/grpc.dart';
import 'dart:io';
import 'package:MercuryServer/src/generated/messenger.pb.dart';
import 'package:MercuryServer/src/generated/messenger.pbgrpc.dart';

Future<void> main() async {
  final channel = ClientChannel(
    'localhost',
    port: 50051,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
  );
  final stub = MessengerClient(channel);

  print(
    "Enter a msg : ",
  );
  final msg = stdin.readLineSync();

  try {
    final response = await stub.sendMessage(Message()..msg = msg);
    print(response.msg);
  } catch (e) {
    print('Caught error: $e');
  }
  await channel.shutdown();
}
