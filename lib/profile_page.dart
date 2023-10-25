import 'package:flutter/material.dart';
import 'dashboard_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = 'Badin firman gani';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('images/Badin.jpg'),
            ),
            const SizedBox(height: 20),
            Container(
              child: Column(
                children: [
                  // Item profil untuk mengatur nama
                  ListTile(
                    title: Text('Nama'),
                    subtitle: Text(name),
                    trailing: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        _editName(context);
                      },
                    ),
                  ),
                  // Item profil untuk Npm
                  ListTile(
                    title: Text('NPM'),
                    subtitle: Text('21670073'),
                  ),
                  // Item profil untuk email
                  ListTile(
                    title: Text('Email'),
                    subtitle: Text('Badinfirmangani@gmail.com'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Navigasi kembali ke halaman dashboard
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DashboardPage(),
                  ),
                );
              },
              child: const Text('Back to Dashboard'),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk mengedit nama
  void _editName(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Nama'),
          content: TextField(
            onChanged: (value) {
              setState(() {
                name = value;
              });
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Simpan'),
            ),
          ],
        );
      },
    );
  }
}
