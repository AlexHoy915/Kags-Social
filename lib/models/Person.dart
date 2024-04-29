import 'Message.dart';

class Person {
  final String name;
  final String avatarUrl; 

  Person({required this.name, required this.avatarUrl});
}

// Fake list of people for direct messages
List<Person> people = [
  Person(name: 'John Doe', avatarUrl: 'assets/john.png'),
  Person(name: 'Jane Smith', avatarUrl: 'assets/jane.jpg'),
];

List<Person> allPeople = [
  Person(name: 'Alice Johnson', avatarUrl: 'assets/alice.jpg'),
  Person(name: 'Bob Brown', avatarUrl: 'assets/bob.jpg'),
];
bool hasConversation(String personName) {
  return conversations.any((conv) => conv.person.name == personName);
}