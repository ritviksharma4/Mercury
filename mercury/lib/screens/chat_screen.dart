import 'package:flutter/material.dart';
import 'package:mercury/models/message_model.dart';
import 'package:mercury/models/user_model.dart';
import 'package:mercury/services/ChatServicer.dart';
import 'dart:io';

class ChatScreen extends StatefulWidget {
  final User user;
  ChatScreen({this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState(ChatServicer());
}

class _ChatScreenState extends State<ChatScreen> {
  String serverResponse;

  @override
  void initState() {
    serverResponse = "";
    super.initState();
  }

  final ChatServicer service;
  _ChatScreenState(this.service);

  TextEditingController controller = TextEditingController();
  _buildMessage(Message message, bool isMe) {
    final Container msg = Container(
      margin: isMe
          ? EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              left: 80.0,
            )
          : EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
            ),
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
        color: isMe ? Theme.of(context).accentColor : Color(0xFFFFEFEE),
        borderRadius: isMe
            ? BorderRadius.only(
                topLeft: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
              )
            : BorderRadius.only(
                topRight: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(message.sender.name,
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              )),
          SizedBox(height: 4.0),
          Text(
            message.text,
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 4.0),
          Text(
            message.time,
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
    if (isMe) {
      return msg;
    }
    return Row(
      children: <Widget>[
        msg,
      ],
    );
  }

  _buildMessageComposer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.mic),
            iconSize: 30.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              controller: controller,
              textCapitalization: TextCapitalization.sentences,
              onChanged: (value) {},
              decoration: InputDecoration.collapsed(
                hintText: 'Send a message...',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: () async {
              var msgFromUser = controller.text;
              var mins;
              if (new DateTime.now().minute < 10)
                mins = ('0' + (new DateTime.now().minute.toString()));
              else if (new DateTime.now().minute == 0)
                mins = '00';
              else
                mins = (new DateTime.now().minute.toString());
              if (msgFromUser != '') {
                messages.insert(
                    0,
                    Message(
                      sender: Ritvik,
                      time: (new DateTime.now().hour).toString() + ':' + mins,
                      text: msgFromUser,
                    ));
                service.main([""]);
                // print("Sending to Server.." + msgFromUser);
                // var serverResponse = await ChatServicer.sndMsg(msgFromUser);
                // print(serverResponse);
                controller.clear();
                messages.insert(
                    0,
                    Message(
                      sender: ChatBot,
                      time: (new DateTime.now().hour).toString() + ':' + mins,
                      // text: await ((ChatServicer().rcvMsg()).toString()),
                      text: "hey!",
                    ));
                setState(() {});
              }
              // var msgFromServer = await ChatServicer().rcvMsg();
              // print("Receiving from Server...");
              // print(msgFromServer);
              // print(msgFromServer.toString());
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          widget.user.name,
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  child: ListView.builder(
                    reverse: true,
                    padding: EdgeInsets.only(top: 15.0),
                    itemCount: messages.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Message message = messages[index];
                      final bool isMe = message.sender.id == Ritvik.id;
                      return _buildMessage(message, isMe);
                    },
                  ),
                ),
              ),
            ),
            _buildMessageComposer(),
          ],
        ),
      ),
    );
  }
}
