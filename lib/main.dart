import 'package:flutter/material.dart';
import 'package:flutter_application_1/addPostPage.dart';
import 'package:flutter_application_1/blogPage.dart';
import 'package:flutter_application_1/communityHubPage.dart';
import 'package:flutter_application_1/createAccountPage.dart';
import 'package:flutter_application_1/directMessagePage.dart';
import 'package:flutter_application_1/homePage.dart';
import 'package:flutter_application_1/launchPage.dart';
import 'package:flutter_application_1/signInPage.dart';
import 'package:flutter_application_1/signInSignUpPage.dart';
import 'package:flutter_application_1/supportPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jeep Social',
      home: LaunchPage(), 
      routes: {
        '/signInSignUp': (context) => SignInSignUpPage(),
        '/mainPage': (context) => MainPage(),
        '/signInPage': (context) => SignInPage(),
        '/createAccountPage': (context) => CreateAccountPage(),
        '/addPostPage': (context) => AddPostPage(),
      },
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static const List<String> _pageTitles = [
    'Home',
    'Community Hub',
    'Blog',
    'Support Page',
  ];

 final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    CommunityHubPage(),
    BlogPage(), 
    SupportPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
       return Scaffold(
      appBar: AppBar(
        centerTitle: true, 
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/logo.png'), 
        ),
        title: Text(
          _pageTitles[_selectedIndex],
          style: TextStyle(color: Colors.black), 
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person, color: Colors.orange), 
            onPressed: () {
              Navigator.pushNamed(context, '/signInSignUp');
            },
          ),
          IconButton(
            icon: Icon(Icons.message, color: Colors.orange), 
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DirectMessagePage(),
                ),
              );
            },
          ),
        ],
        iconTheme: IconThemeData(color: Colors.orange), 
        backgroundColor: Colors.white, 
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
  items: const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.group),
      label: 'Community',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.article),
      label: 'Blog',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.support_agent),
      label: 'Support',
    ),
  ],
  currentIndex: _selectedIndex,
  selectedItemColor: Colors.orange, 
  unselectedItemColor: Colors.orange, 
  onTap: _onItemTapped,
),

    );
  }
}
