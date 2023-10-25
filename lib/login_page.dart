// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'dashboard_page.dart';

class LoginPage extends StatelessWidget {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  void _navigateToDashboard(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DashboardPage(),
      ),
    );
  }

  void _handleLogin(BuildContext context) {
    if (usernameController.text == "badin" &&
        passwordController.text == "123") {
      // Jika autentikasi berhasil, navigasikan ke halaman dashboard
      _navigateToDashboard(context);
    } else {
      // Jika autentikasi gagal, tampilkan pesan kesalahan
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Authentication Failed"),
            content: Text("Invalid username or password."),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Welcome to BadinWeet'),
            SizedBox(height: 20),
            TextFormField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _handleLogin(context);
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
