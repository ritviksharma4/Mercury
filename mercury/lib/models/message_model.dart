import 'package:mercury/models/user_model.dart';

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
    time: '4:30 PM',
    text: 'Have a Good Day!',
  ),
  Message(
    sender: ChatBot,
    time: '4:30 PM',
    text:
        '*********ORDER DETAILS*********\n3 non veg pizzas\n3 veg tacos\n1 cold drink\nDominos has received your order!',
  ),
  Message(
    sender: Ritvik,
    time: '4:30 PM',
    text:
        'I want to eat 3 non veg pizzas 3 veg tacos and 1 cold drink from Dominos',
  ),
  Message(
    sender: ChatBot,
    time: '4:30 PM',
    text: 'Hey, Ritvik! What do you wanna have today?',
  ),
];

// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    sender: ChatBot,
    time: '4:30 PM',
    text: 'Have a Good Day!!',
  )
];
