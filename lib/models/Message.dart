import 'package:flutter_application_1/models/Person.dart';

class Message {
  final String senderName;
  final String text;
  final DateTime timestamp;

  Message({
    required this.senderName,
    required this.text,
    required this.timestamp,
  });
}

class Conversation {
  final Person person;
  final List<Message> messages;

  Conversation({
    required this.person,
    required this.messages,
  });
}
List<Conversation> conversations = [
  Conversation(
    person: people[0],
    messages: [
      Message(
        senderName: 'User',
        text: 'Hey, how’s the Jeep running?',
        timestamp: DateTime.now().subtract(Duration(minutes: 5)),
      ),
      Message(
        senderName: people[0].name,
        text: 'Runs like a dream! Just came back from a trail ride.',
        timestamp: DateTime.now().subtract(Duration(minutes: 1)),
      ),
    ],
  ),
  Conversation(
    person: people[1],
    messages: [
      Message(
        senderName: 'User',
        text: 'Hey, how’s the new Jeep?',
        timestamp: DateTime.now().subtract(Duration(minutes: 5)),
      ),
      Message(
        senderName: people[1].name,
        text: 'its really nice, ill have to take you for a spin sometime',
        timestamp: DateTime.now().subtract(Duration(minutes: 1)),
      ),
    ],
  ),
];
Conversation getOrCreateConversationWithPerson(Person person) {
  final existingConversation =  conversations.firstWhere(
    (conv) => conv.person.name == person.name,
    orElse: () => Conversation(person: person, messages: []),
  );
  if (! conversations.contains(existingConversation)) {
     conversations.add(existingConversation);
  }
  return existingConversation;
}

