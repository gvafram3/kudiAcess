import 'package:flutter/material.dart';
import 'package:kudiaccess/screens/otp_page.dart';
import 'package:kudiaccess/utils/commons/custom_button.dart';
import 'package:kudiaccess/widgets/custom_textfield.dart';
import 'package:kudiaccess/widgets/gradient_background.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});
  @override
  State<ForgotPasswordPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController usernameOrPhoneNumberController =
      TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            title: const Text(
              "Forgot Password",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.transparent),
        body: GradientBackground(
          mainContent: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 25),
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
                const SizedBox(height: 45),
                const Text(
                  'Enter your email address',
                  style: TextStyle(
                    color: Colors.lightGreen,
                    fontSize: 16,
                  ),
                ),
                const Text(
                  'Please enter the phone number you used when creating your account',
                ),
                const SizedBox(height: 24),
                Form(
                  key: _formKey,
                  child: CustomTextField(
                      controller: usernameOrPhoneNumberController,
                      prefix: const Icon(Icons.person),
                      hint: "Phone number"),
                ),
                const SizedBox(height: 18),
                CustomButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OTPPage(),
                      ),
                    );
                  },
                  txt: "Submit",
                  width: double.infinity,
                  color: const Color.fromRGBO(243, 156, 18, 3),
                ),
              ],
            ),
          ),
        ));
  }
}
