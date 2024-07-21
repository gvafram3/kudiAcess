import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';
import '../../widgets/chart.dart';
import '../notifications.dart';
import '../profile.dart';
import '../settings.dart';

class BudgetScreen extends StatelessWidget {
  const BudgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BuildHeader(),
              CustomLineChart(),
              SizedBox(height: 16),
              BudgetCard(),
              SizedBox(height: 16),
              Text('Your Budget',
                  style: TextStyle(color: Color.fromRGBO(243, 156, 18, 3))),
              SizedBox(height: 8),
              BudgetList(),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildHeader extends StatelessWidget {
  const BuildHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.chevron_left_rounded,
            color: Color.fromRGBO(243, 156, 18, 3),
          ),
        ),
        const SizedBox(width: 10),
        const Text(
          'Budget & Goals',
          style: TextStyle(
            fontSize: 18,
            color: Color.fromRGBO(243, 156, 18, 3),
          ),
        ),
        const Spacer(),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsScreen(),
                    ));
              },
            ),
            const SizedBox(width: 1),
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotificationsScreen(),
                    ));
              },
              icon: const Icon(Icons.notification_add),
            ),
            const SizedBox(width: 1),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const ProfileScreen()),
                  ),
                );
              },
              child: const CircleAvatar(
                backgroundColor: Colors.white54,
                child: Icon(
                  Icons.person_2_outlined,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class BudgetCard extends StatelessWidget {
  const BudgetCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Budget for October',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                '₦2,478',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Divider(thickness: 3, color: Colors.blue),
          SizedBox(height: 12)
        ],
      ),
    );
  }
}

class BudgetList extends StatelessWidget {
  const BudgetList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        BudgetListItem(),
        BudgetListItem(),
        BudgetListItem(),
      ],
    );
  }
}

class BudgetListItem extends StatelessWidget {
  const BudgetListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
          shape: BoxShape.rectangle),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: Colors.blue),
            width: 48,
            height: 48,
            child: const Icon(Icons.shopping_cart, color: Colors.white),
          ),
          const SizedBox(width: 16),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Shopping',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              Text('10 Jan 2022', style: TextStyle(color: Colors.grey)),
            ],
          ),
          const Spacer(),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('₦54,417.80',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              Text('In Cash', style: TextStyle(color: Colors.blue)),
            ],
          ),
        ],
      ),
    );
  }
}
