import 'package:flutter/material.dart';
// import 'package:kudiaccess/screens/forgot_password.dart';
// import 'package:kudiaccess/utils/commons/custom_button.dart';
import 'package:kudiaccess/widgets/gradient_background.dart';

import 'dashboard.dart';
// import 'setup_page.dart';
// import 'sign_up.dart';

class SetupCompletePage extends StatefulWidget {
  const SetupCompletePage({super.key});
  @override
  State<SetupCompletePage> createState() => _SetupCompletePageState();
}

class _SetupCompletePageState extends State<SetupCompletePage> {
  final TextEditingController usernameOrPhoneNumberController =
      TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GradientBackground(
      mainContent: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const SizedBox(height: 66),
                Center(
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10),
                const Row(
                  children: [
                    Spacer(),
                    Text(
                      'Your Financial Assistant',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromRGBO(243, 156, 18, 3),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
                const SizedBox(height: 16),
                const Center(
                  child: Text(
                    'Your account is complete',
                  ),
                ),
                const SizedBox(height: 14),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DashboardPage()),
                      );
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Go to dashboard',
                          style: TextStyle(color: Colors.lightGreen),
                        ),
                        SizedBox(width: 8),
                        Icon(
                          Icons.arrow_forward,
                          color: Color.fromRGBO(243, 156, 18, 3),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
