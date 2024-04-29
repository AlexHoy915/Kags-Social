import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/BlogPosts.dart'; 

// This function is globally accessible and will add a new blog post
void addNewBlogPost(BlogPost post) {

  blogPosts.insert(0, post);
}

class AddPostPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _categoryController = TextEditingController();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  AddPostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Post')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: _categoryController,
                decoration: InputDecoration(labelText: 'Category'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a category';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _contentController,
                decoration: InputDecoration(labelText: 'Content'),
                keyboardType: TextInputType.multiline,
                maxLines: null,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some content';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () => _addPost(context),
                child: Text('Submit Post'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.orange, // Text color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addPost(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final newPost = BlogPost(
        author: _titleController.text,
        category: _categoryController.text,
        content: _contentController.text, comments: [],
      );

      // Add the new post to the global list of blog posts
      addNewBlogPost(newPost);

      // Go back to the previous screen
      Navigator.pop(context);
    }
  }

  void dispose() {
    // Dispose controllers to avoid memory leaks
    _categoryController.dispose();
    _titleController.dispose();
    _contentController.dispose();
    dispose();
  }
}
