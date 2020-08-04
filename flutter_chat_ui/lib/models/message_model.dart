import 'package:flutter_chat_ui/models/user_model.dart';

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
//	static makeMessage(User user, String time, String text){
//					return new Message({
//									this.sender,
//									this.time,
//									this.text,
//					});
//	}
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
    text: 'Nice to hear, See ya!',
  ),
  
	Message(
    sender: ChatBot,
    time: '4:30 PM',
    text: 'Nice to hear, See ya!',
  ),
  Message(
    sender: Ritvik,
    time: '4:30 PM',
    text: 'All good here too :)',
  ),
  Message(
    sender: ChatBot,
    time: '4:30 PM',
    text: 'Hey, its all good today and you?',
  ),
  Message(
    sender: Ritvik,
    time: '4:30 PM',
    text: 'Hey, how\'s it going? What did you do today?1',
  ),
  Message(
    sender: Ritvik,
    time: '4:30 PM',
    text: 'Hey, how\'s it going? What did you do today?2',
  ),
  Message(
    sender: ChatBot,
    time: '4:30 PM',
    text: 'Hey, let\'s talk!',
  ),
];

// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
//  Message(
//    sender: Ritvik,
//    time: '4:30 PM',
//    text: 'Hey, how\'s it going? What did you do today?',
//  ),
  Message(
    sender: ChatBot,
    time: '4:30 PM',
    text: 'Nice to hear, See ya!',
  )
];

