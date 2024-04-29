import 'package:flutter/material.dart';

import 'models/FAQs.dart';

class SupportPage extends StatefulWidget {
  @override
  _SupportPageState createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  String? selectedQuestion;
  String? selectedAnswer;

  void handleSubmit() {
    // Navigate to the HomePage after the form is submitted
     Navigator.pushReplacementNamed(context, '/mainPage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
            color: Colors.orange, 
            padding: EdgeInsets.symmetric(vertical: 8.0),
            width: double.infinity,
            child: Text(
              'Need Help? We\'re Here for You',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),

            ListTile(
              title: DropdownButton<String>(
                isExpanded: true,
                value: selectedQuestion,
                hint: Text('Select a Question'),
                items: faqs.map((faq) {
                  return DropdownMenuItem<String>(
                    value: faq['question'],
                    child: Text(faq['question']!),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedQuestion = value;
                    selectedAnswer = faqs.firstWhere(
                      (faq) => faq['question'] == value,
                      orElse: () => {'answer': 'Not available'},
                    )['answer'];
                  });
                },
              ),
            ),
            if (selectedAnswer != null) Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(selectedAnswer!),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Contact Form',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Ask your question here',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: handleSubmit,
                child: Text('Submit'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, 
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
