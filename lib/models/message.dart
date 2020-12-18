import 'package:bookopedia/models/chat_user.dart';

class Message {
  final User1 sender;
  final String time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  final bool unread;

  Message({
    this.sender,
    this.time,
    this.text,
    this.unread,
  });
}

// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    sender: test1,
    time: '5:30 PM',
    text: 'Hey dude!.',
    unread: true,
  ),
  Message(
    sender: test2,
    time: '4:30 PM',
    text: 'Hi, How u doing?',
    unread: true,
  ),

];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messages = [
  Message(
    sender: test1,
    time: '5:30 PM',
    text: 'Hey dude!',
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '4:30 PM',
    text: 'Hey, watsup?',
    unread: true,
  ),
  Message(
    sender: test1,
    time: '3:45 PM',
    text: 'Not much',
    unread: true,
  ),
  Message(
    sender: test1,
    time: '3:15 PM',
    text: 'Just sick of doing projects & assignments',
    unread: true,
  ),
];
