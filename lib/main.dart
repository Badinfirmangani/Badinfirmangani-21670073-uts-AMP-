import 'package:flutter/material.dart';
import 'login_page.dart';
import 'dashboard_page.dart';
import 'profile_page.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/login',
    routes: {
      '/login': (context) => LoginPage(),
      '/dashboard': (context) => DashboardPage(),
      '/profile': (context) => ProfilePage(),
    },
  ));
}
