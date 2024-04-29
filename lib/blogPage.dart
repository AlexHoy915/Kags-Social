// blogPage.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/addPostPage.dart';
import 'package:flutter_application_1/blogPostDetailsPage.dart';
import 'package:flutter_application_1/models/BlogPosts.dart';




  


class BlogPage extends StatefulWidget {
  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  
 void onAddPostPageReturn() {
    // Just calling setState will trigger the build method and refresh the list
    setState(() {});
  }
  void _addNewPost(BlogPost newPost) {
    setState(() {
      blogPosts.insert(0, newPost);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: ListView.builder(
        itemCount: blogPosts.length,
        itemBuilder: (BuildContext context, int index) {
          BlogPost post = blogPosts[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => BlogDetailsPage(post: post),
                ),
              );
            },
            child: Card(
              margin: EdgeInsets.all(8.0),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      post.author,
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Category: ${post.category}',
                      style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10.0),
                    Text(post.content),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddPostPage(),
            ),
          ).then((_) {
            // If the blogPosts is updated, setState will refresh the BlogPage
            setState(() {});
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.orange,
      ),
    );
  }
}