import 'package:flutter/material.dart';
import 'package:flutter_application_1/conversationPage.dart';

import 'models/ForumCatagory.dart';
import 'models/Message.dart';
import 'models/Person.dart';

class CommunityHubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: ListView(
        children: [
           Container(
            color: Colors.orange, 
            padding: EdgeInsets.symmetric(vertical: 8.0),
            width: double.infinity,
            child: Text(
              'Connect with Jeep enthusiasts, share your stories, and get help.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
         Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Blog Discussions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          DataTable(
            columns: const [
              DataColumn(label: Text('Category')),
              DataColumn(label: Text('Posts')),
            ],
            rows: forumCategories
                .map(
                  (category) => DataRow(
                    cells: [
                      DataCell(Text(category.name)),
                      DataCell(Text(category.postCount.toString())),
                    ],
                  ),
                )
                .toList(),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Meet The Experts',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ...experts.map((expert) => ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(expert.avatarUrl),
            ),
            title: Text(expert.name),
            subtitle: Text(expert.areaOfExpertise),
            trailing: IconButton(
              icon: Icon(Icons.message),
              onPressed: () {
                // Get or create a conversation with this expert
                final conversationWithExpert = getOrCreateConversationWithPerson(
                  Person(name: expert.name, avatarUrl: expert.avatarUrl),
                );
                // Navigate to the ConversationPage with the correct conversation
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConversationPage(conversation: conversationWithExpert),
                  ),
                );
              },
            ),
          )).toList(),
        ],
      ),
    );
  }
}
