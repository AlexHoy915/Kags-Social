import 'package:flutter/material.dart';
import 'package:flutter_application_1/conversationPage.dart';
import 'package:flutter_application_1/models/Person.dart';
import 'package:flutter_application_1/userSelectionPage.dart';

import 'models/Message.dart';


class DirectMessagePage extends StatefulWidget {
  @override
  _DirectMessagePageState createState() => _DirectMessagePageState();
}

class _DirectMessagePageState extends State<DirectMessagePage> {
void _startNewConversation() {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => UserSelectionPage(availablePeople: allPeople.where((person) => !hasConversation(person.name)).toList()),
  )).then((_) {
    // If you've added a conversation, refresh the state so that the new conversation appears in the list
    setState(() {});
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Direct Messages'),
        actions: [
          IconButton(
            icon: Icon(Icons.create),
            onPressed: _startNewConversation,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: conversations.length, 
        itemBuilder: (context, index) {
          final conversation = conversations[index];
          final lastMessageText = conversation.messages.isNotEmpty ? conversation.messages.last.text : 'No messages yet';
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(conversation.person.avatarUrl),
            ),
            title: Text(conversation.person.name),
            subtitle: Text(lastMessageText),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ConversationPage(conversation: conversation),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
