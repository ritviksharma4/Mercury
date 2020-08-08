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

// For command line add dependency : process_run: ^0.10.11+1

/// Dart implementation of the gRPC helloworld.Greeter server.
import 'package:grpc/grpc.dart';
import 'dart:io';
import 'package:MercuryServer/src/generated/messenger.pb.dart';
import 'package:MercuryServer/src/generated/messenger.pbgrpc.dart';
import 'package:process_run/shell.dart';

class MessengerServicer extends MessengerServiceBase {
  @override
  Future<Message> sendMessage(call, Message request) async {
    var userMsg = new File('ClientMsg.txt').toString();
    var write = request.msg;
    File(userMsg).writeAsString(write);

    var shell = Shell();
    await shell.run('python albert_crf.py');

    // String orderDetails = "placeholder";
    final orderDetails = await new File('OrderDetails.txt').readAsString();
    print(orderDetails);
    return Message()..msg = orderDetails;
  }
}

Future<void> main() async {
  var server = Server([MessengerServicer()]);
  server.serve(port: 50051);
  print('MercuryServer listening on port 50051...');
}
