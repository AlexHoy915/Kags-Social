import 'package:flutter/material.dart';
import 'package:flutter_application_1/conversationPage.dart';

import 'models/Person.dart';
import 'models/Message.dart'; 



class UserSelectionPage extends StatefulWidget {
  final List<Person> availablePeople;

  UserSelectionPage({required this.availablePeople});

  @override
  _UserSelectionPageState createState() => _UserSelectionPageState();
}

class _UserSelectionPageState extends State<UserSelectionPage> {
  void _startConversationWithPerson(Person person) {
    if (!hasConversation(person.name)) {
      final newConversation = Conversation(person: person, messages: []);
      setState(() {
        conversations.add(newConversation);
        widget.availablePeople.removeWhere((p) => p.name == person.name);
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ConversationPage(conversation: newConversation),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Start New Conversation')),
      body: ListView.builder(
        itemCount: widget.availablePeople.length,
        itemBuilder: (context, index) {
          final person = widget.availablePeople[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(person.avatarUrl), 
            ),
            title: Text(person.name),
            onTap: () => _startConversationWithPerson(person),
          );
        },
      ),
    );
  }
}
