import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kudiaccess/utils/commons/custom_button.dart';
import 'package:kudiaccess/widgets/custom_textfield.dart';
import 'package:kudiaccess/widgets/gradient_background.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isLoading = false;

  void _resetPassword() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      try {
        await _auth.sendPasswordResetEmail(email: emailController.text.trim());
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Password reset email sent')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          "Forgot Password",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: GradientBackground(
          mainContent: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                  'Please enter the email you used when creating your account',
                ),
                const SizedBox(height: 24),
                Form(
                  key: _formKey,
                  child: CustomTextField(
                    controller: emailController,
                    prefix: const Icon(Icons.person),
                    hint: "Email",
                  ),
                ),
                const SizedBox(height: 18),
                _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : CustomButton(
                        onPressed: _resetPassword,
                        txt: "Submit",
                        width: double.infinity,
                        color: const Color.fromRGBO(243, 156, 18, 3),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
