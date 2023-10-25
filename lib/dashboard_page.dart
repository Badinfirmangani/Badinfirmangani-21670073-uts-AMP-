import 'package:flutter/material.dart';
import 'profile_page.dart';

class User {
  final String username;
  final String displayName;

  User({
    required this.username,
    required this.displayName,
  });
}

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  User currentUser = User(
    username: 'badin_desu',
    displayName: 'badin_desu',
  );

  void _navigateToProfile(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ProfilePage(),
      ),
    );
  }

  void _changeUser() {
    // Fungsi ini akan memungkinkan Anda mengganti pengguna
    setState(() {
      currentUser = User(
        username: 'badin desu',
        displayName: 'badin_desu',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              _navigateToProfile(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(currentUser.displayName),
              subtitle: Text('@${currentUser.username}'),
            ),

            // List of Tweets (Vertical)
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text('Tweet $index'),
                    subtitle: Text('Posted by @${currentUser.username} '),
                  ),
                );
              },
            ),

            // List of Trends (Horizontal)
            Container(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        Icon(Icons.trending_up, color: Colors.blue),
                        Text('Trending Topic'),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
