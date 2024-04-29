import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/BlogPosts.dart';
import 'package:flutter_application_1/models/comments.dart'; 
import 'package:intl/intl.dart';


class BlogDetailsPage extends StatefulWidget {
  final BlogPost post;

  BlogDetailsPage({required this.post});

  @override
  _BlogDetailsPageState createState() => _BlogDetailsPageState();
}


class _BlogDetailsPageState extends State<BlogDetailsPage> {
  final TextEditingController _commentController = TextEditingController();

  void _postComment() {
    if (_commentController.text.isNotEmpty) {
      final comment = Comment(
        author: 'User', 
        content: _commentController.text,
        timestamp: DateTime.now(),
      );

      setState(() {
        widget.post.comments.add(comment);
      });

      _commentController.clear();
    }
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(widget.post.author), 
    ),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(widget.post.category, style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
            SizedBox(height: 8.0),
            Text(widget.post.content),
            SizedBox(height: 16.0),
            Text('Comments', style: Theme.of(context).textTheme.headline6),
            Divider(),
            ...widget.post.comments.map((comment) => ListTile(
                  title: Text(comment.author),
                  subtitle: Text(comment.content),
                  trailing: Text(DateFormat('yyyy-MM-dd – kk:mm').format(comment.timestamp)), 
                )).toList(),
            TextField(
              controller: _commentController,
              decoration: InputDecoration(hintText: 'Write a comment...'),
            ),
            TextButton(
              onPressed: _postComment,
              child: Text('Send'),
            ),
          ],
        ),
      ),
    ),
  );
}
    @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }
}
