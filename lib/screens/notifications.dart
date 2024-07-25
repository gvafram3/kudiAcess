import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/color_providers.dart';
// import 'package:kudiaccess/screens/dashboard.dart';

class NotificationsScreen extends ConsumerWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorState = ref.watch(colorProvider);
    return Scaffold(
      backgroundColor: colorState.baseColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
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
                    // const SizedBox(width: 10),
                    const Text(
                      'Notifications',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromRGBO(243, 156, 18, 3),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 28),
                const Text('Today'),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: const Column(
                    children: [
                      CustomListTile(
                        icon: Icons.switch_left_rounded,
                        title: 'Transferred money to William',
                        subtitle: '08:58 PM',
                      ),
                      Divider(color: Colors.grey),
                      CustomListTile(
                        icon: Icons.wallet,
                        title: 'Received money ¢20 from Dito',
                        subtitle: '08:20 AM',
                      ),
                      Divider(color: Colors.grey),
                      CustomListTile(
                        icon: Icons.switch_left_rounded,
                        title: 'Transferred money to Ilham',
                        subtitle: '08:40 PM',
                      ),
                      Divider(color: Colors.grey),
                      CustomListTile(
                        icon: Icons.wallet,
                        title: 'Received money ¢400 from Jonas',
                        subtitle: '06:56 AM',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 28),
                const Text('Yesterday'),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: const Column(
                    children: [
                      CustomListTile(
                        icon: Icons.switch_left_rounded,
                        title: 'Withdrew money from the ATM',
                        subtitle: '02:45 PM',
                      ),
                      Divider(color: Colors.grey),
                      CustomListTile(
                        icon: Icons.wallet,
                        title: 'Received cashback ¢5 on interest',
                        subtitle: '08:20 AM',
                      ),
                      Divider(color: Colors.grey),
                      CustomListTile(
                        icon: Icons.switch_left_rounded,
                        title: 'Transferred money to James',
                        subtitle: '05:58 AM',
                      ),
                      Divider(color: Colors.grey),
                      CustomListTile(
                        icon: Icons.switch_left_rounded,
                        title: 'Transferred money to Visca',
                        subtitle: '05:56 AM',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const CustomListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(8),
        ),
        child: IconButton(
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          icon: Icon(
            icon,
            color: Colors.blue,
          ),
          onPressed: () {},
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
