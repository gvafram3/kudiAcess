import 'package:flutter/material.dart';
import 'package:kudiaccess/screens/logout.dart';
// import 'package:kudiaccess/screens/dashboard.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
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
                      'Settings',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromRGBO(243, 156, 18, 3),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 28),
                const Text('Account'),
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
                        icon: Icons.person_2_outlined,
                        title: 'Edit Profile',
                      ),
                      Divider(color: Colors.grey),
                      CustomListTile(
                        icon: Icons.security_rounded,
                        title: 'Security',
                      ),
                      Divider(color: Colors.grey),
                      CustomListTile(
                        icon: Icons.lock,
                        title: 'Privacy',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 28),
                const Text('Support & About'),
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
                        icon: Icons.help_outline_rounded,
                        title: 'Help & Support',
                      ),
                      Divider(color: Colors.grey),
                      CustomListTile(
                        icon: Icons.wallet,
                        title: 'Terms and Conditions',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 28),
                const Text('Actions'),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Column(
                    children: [
                      const CustomListTile(
                        icon: Icons.flag_outlined,
                        title: 'Report a problem',
                      ),
                      const Divider(color: Colors.grey),
                      CustomListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LogoutScreen()));
                        },
                        icon: Icons.logout,
                        title: 'Log out',
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
  final VoidCallback? onTap;

  const CustomListTile({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
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
          ),
          onPressed: () {},
        ),
      ),
      title: Text(
        title,
      ),
    );
  }
}
