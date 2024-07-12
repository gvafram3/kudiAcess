import 'package:flutter/material.dart';
import 'package:kudiaccess/screens/dashboard_tabs/budget.dart';
import 'package:kudiaccess/screens/dashboard_tabs/history.dart';
import 'package:kudiaccess/screens/dashboard_tabs/payment.dart';
import 'package:kudiaccess/screens/dashboard_tabs/resources.dart';

import 'dashboard_tabs/home.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  DashboardPageState createState() => DashboardPageState();
}

class DashboardPageState extends State<DashboardPage> {
  int currentIndex = 0;
  final List<Widget> _screens = [
    const HomeScreen(),
    const HistoryScreen(),
    const Payment(),
    const Budget(),
    const Resources(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: SafeArea(
        child: _screens[currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueGrey[900],
        selectedItemColor: const Color.fromRGBO(243, 156, 18, 3),
        unselectedItemColor: Colors.black,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment),
            label: 'Payment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mobile_friendly),
            label: 'Budget',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Resources',
          ),
        ],
      ),
    );
  }
}
