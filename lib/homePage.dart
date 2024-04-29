import 'package:flutter/material.dart';
import 'package:flutter_application_1/blogPostDetailsPage.dart';
import 'package:flutter_application_1/models/BlogPosts.dart';
import 'package:flutter_application_1/models/Event.dart';
import 'package:intl/intl.dart';


class HomePage extends StatelessWidget {
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
              'Join the Adventure. Connect. Share Your Ride.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Image.asset('assets/jeep_banner.jpg'), 

          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Upcoming Events',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          DataTable(
            columns: const [
              DataColumn(label: Text('Event')),
              DataColumn(label: Text('Location')),
              DataColumn(label: Text('Date/Time')),
            ],
            rows: events
                .map(
                  (event) => DataRow(
                    cells: [
                      DataCell(Text(event.title)),
                      DataCell(Text(event.location)),
                      DataCell(Text(DateFormat('yyyy-MM-dd – kk:mm').format(event.dateTime))),
                    ],
                  ),
                )
                .toList(),
          ),

          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Latest Blog Posts',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          ...blogPosts.map((post) => ListTile(
                leading: Icon(Icons.drive_eta), 
                title: Text(post.author),
                subtitle: Text(post.content),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlogDetailsPage(post: post),
                      ),
                    );
                },
              )),
        ],
      ),
    );
  }
}