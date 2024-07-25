import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kudiaccess/screens/login.dart';
import 'package:kudiaccess/utils/commons/authmethods.dart';

import '../utils/commons/custom_button.dart';

class LogoutScreen extends ConsumerStatefulWidget {
  const LogoutScreen({super.key});

  @override
  ConsumerState<LogoutScreen> createState() => LogoutScreenState();
}

class LogoutScreenState extends ConsumerState<LogoutScreen> {
  void signOut() async {
    ref.read(authMethodProvider).signOut(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: SingleChildScrollView(
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
                  const SizedBox(width: 10),
                  const Text(
                    'Log out',
                    style: TextStyle(
                      color: Color.fromRGBO(243, 156, 18, 3),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 148),
              const Center(
                child: Text('Do you want to log out?'),
              ),
              const SizedBox(height: 48),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    txt: "Cancel",
                    width: 120,
                    color: const Color.fromRGBO(243, 156, 18, 3),
                  ),
                  const SizedBox(width: 16),
                  CustomButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    txt: "Confirm",
                    width: 120,
                    color: Colors.lightGreen,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String hint;

  const CustomTextField({
    super.key,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
