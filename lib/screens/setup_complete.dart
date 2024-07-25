import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:kudiaccess/screens/setup_page.dart';
// import 'package:kudiaccess/screens/forgot_password.dart';
// import 'package:kudiaccess/utils/commons/custom_button.dart';
import 'package:kudiaccess/widgets/gradient_background.dart';

import '../providers/color_providers.dart';
import 'dashboard.dart';

// import 'sign_up.dart';

class SetupCompletePage extends ConsumerStatefulWidget {
  const SetupCompletePage({super.key});
  @override
  ConsumerState<SetupCompletePage> createState() => _SetupCompletePageState();
}

class _SetupCompletePageState extends ConsumerState<SetupCompletePage> {
  // final _formKey = GlobalKey<FormState>();

  final TextEditingController usernameOrPhoneNumberController =
      TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final colorState = ref.watch(colorProvider);

    return Scaffold(
        backgroundColor: colorState.baseColor,
        body: GradientBackground(
          mainContent: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 200),
                    Center(
                      child: Image.asset(
                        'assets/images/logo.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Center(
                      child: Row(
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
                    ),
                    const SizedBox(height: 50),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DashboardPage(),
                          ),
                        );
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Go to dashboard ",
                            style: TextStyle(color: Colors.lightGreen),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Color.fromRGBO(243, 156, 18, 3),
                          ),
                        ],
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
