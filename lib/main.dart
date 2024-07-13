import 'package:flutter/material.dart';
import 'package:kudiaccess/screens/dashboard.dart';
import 'package:kudiaccess/screens/dashboard_tabs/payment.dart';
import 'package:kudiaccess/screens/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'kudiAccess',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DashboardPage(),
    );
  }
}
