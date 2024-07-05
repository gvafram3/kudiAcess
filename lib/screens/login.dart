import 'package:flutter/material.dart';
import 'package:kudiaccess/utils/commons/custom_button.dart';
import 'package:kudiaccess/widgets/custom_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController usernameOrPhoneNumberController =
      TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.cover,
                  // height: 35,
                  // width: 35,
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                'Your Financial Assistant',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(243, 156, 18, 3),
                ),
              ),
              const SizedBox(height: 45),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextField(
                        controller: usernameOrPhoneNumberController,
                        prefix: const Icon(Icons.person),
                        hint: "Username or phone number"),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                        isPass: true,
                        controller: passwordController,
                        prefix: const Icon(Icons.lock),
                        hint: "Password"),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 18.0),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text('Forgot Password?'),
                      ),
                    ),
                    CustomButton(
                      onPressed: () {},
                      txt: "Sign in",
                      width: double.infinity,
                      color: const Color.fromRGBO(243, 156, 18, 3),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already Have An Account?',
                        ),
                        TextButton(onPressed: () {}, child: const Text("Login"))
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
