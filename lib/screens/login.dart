// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kudiaccess/providers/color_providers.dart';
import 'package:kudiaccess/screens/forgot_password.dart';
import 'package:kudiaccess/utils/commons/commons.dart';
import 'package:kudiaccess/utils/commons/custom_button.dart';
import 'package:kudiaccess/widgets/custom_textfield.dart';
import 'package:kudiaccess/widgets/gradient_background.dart';

import '../utils/commons/authmethods.dart';
import 'setup_page.dart';
import 'sign_up.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  void _login() async {
    if (_formKey.currentState!.validate()) {
      // Implement your login logic here
      final email = emailController.text;
      final password = passwordController.text;

      // Mock login logic (replace with your authentication logic)
      try {
        setState(() {
          isLoading = true;
        });
        final res = await ref.read(authMethodProvider).signInUser(
              context: context,
              email: email,
              password: password,
            );
        if (res) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SetupPage()));

          showSnackBar(context, "Login Successfull");
        }
        setState(() {
          isLoading = false;
        });
      } catch (err) {
        setState(() {
          isLoading = false;
        });
        showSnackBar(context, err.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Access the provider using a Consumer
    return Consumer(
      builder: (context, ref, child) {
        final colorState = ref.watch(colorProvider);

        return Scaffold(
          backgroundColor: colorState.baseColor,
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              GradientBackground(
                mainContent: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 68),
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
                        Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomTextField(
                                controller: emailController,
                                prefix: const Icon(Icons.mail),
                                hint: "email",
                              ),
                              const SizedBox(height: 20),
                              CustomTextField(
                                isPass: true,
                                controller: passwordController,
                                prefix: const Icon(Icons.lock),
                                hint: "Password",
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ForgotPasswordPage()));
                              },
                              child: const Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  color: Colors.lightGreen,
                                ),
                              ),
                            ),
                          ],
                        ),
                        CustomButton(
                          onPressed: _login,
                          txt: "Sign in",
                          width: double.infinity,
                          color: colorState.generatedColors.isNotEmpty
                              ? colorState.generatedColors[2]
                              : Colors.grey,
                        ),
                        const SizedBox(height: 18),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don\'t have an account yet? ',
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignUpPage(),
                                  ),
                                );
                              },
                              child: const Text(
                                "Sign up",
                                style: TextStyle(
                                  color: Colors.lightGreen,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (isLoading)
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.transparent,
                  child: Center(
                    child: Container(
                      height: 60,
                      width: 60,
                      color: Colors.green,
                      child: const Center(child: CircularProgressIndicator()),
                    ),
                  ),
                )
            ],
          ),
        );
      },
    );
  }
}
