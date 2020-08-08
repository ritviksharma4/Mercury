import 'package:mercury/models/user_model.dart';

String startTime;

class Message {
  final User sender;
  final String
      time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;

  Message({
    this.sender,
    this.time,
    this.text,
  });
}

// YOU - current user
final User Ritvik = User(
  id: 0,
  name: 'Ritvik',
  imageUrl: 'assets/images/user.jpg',
);

// USERS
final User ChatBot = User(
  id: 1,
  name: 'ChatBot',
  imageUrl: 'assets/images/chatbot.jpg',
);

// FAVORITE CONTACTS
List<User> favorites = [ChatBot];

List<Message> messages = [
  Message(
    sender: ChatBot,
    time: "4:30 PM",
    text: 'Hey, Ritvik! What do you wanna have today?',
  ),
];

// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    sender: ChatBot,
    time: "4:30 PM",
    text: 'Hey, Ritvik! What do you wanna have today?',
  ),
];
