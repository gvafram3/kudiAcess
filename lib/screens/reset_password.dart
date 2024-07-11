import 'package:flutter/material.dart';
import 'package:kudiaccess/screens/login.dart';
import 'package:kudiaccess/utils/commons/custom_button.dart';
import 'package:kudiaccess/widgets/custom_textfield.dart';
import 'package:kudiaccess/widgets/gradient_background.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});
  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void _showSuccessMessage() {
    const snackBar = SnackBar(
      content: Text(
        'Password reset successful! Please log in with your new password.',
        style: TextStyle(color: Color.fromRGBO(243, 156, 18, 3)),
      ),
      backgroundColor: Colors.white,
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 2),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      elevation: 10,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _onConfirmPressed() {
    _showSuccessMessage();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          title: const Text(
            "Reset Password",
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
              const SizedBox(height: 14),
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
              const SizedBox(height: 24),
              const Text(
                'Create new password',
                style: TextStyle(
                  color: Colors.lightGreen,
                  fontSize: 16,
                ),
              ),
              const Text(
                'Please enter your new password',
              ),
              const SizedBox(height: 24),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      isPass: true,
                      controller: passwordController,
                      prefix: const Icon(Icons.lock),
                      hint: "Password",
                    ),
                    const SizedBox(height: 12),
                    CustomTextField(
                      isPass: true,
                      controller: confirmPasswordController,
                      prefix: const Icon(Icons.lock),
                      hint: "Confirm password",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              CustomButton(
                onPressed: _onConfirmPressed,
                txt: "Confirm",
                width: double.infinity,
                color: const Color.fromRGBO(243, 156, 18, 3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
