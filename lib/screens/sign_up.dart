import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kudiaccess/providers/color_providers.dart';
import 'package:kudiaccess/utils/commons/authmethods.dart';
import 'package:kudiaccess/utils/commons/commons.dart';
import 'package:kudiaccess/utils/commons/custom_button.dart';
import 'package:kudiaccess/widgets/custom_textfield.dart';
import 'login.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool isLoading = false;

  void _signUp() async {
    if (_formKey.currentState!.validate()) {
      // Implement your sign-up logic here
      final name = usernameController.text.trim();
      final email = emailController.text.trim();
      final password = passwordController.text.trim();
      final confirmPassword = confirmPasswordController.text.trim();
      final phone = phoneNumberController.text.trim();
      if (password != confirmPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Passwords do not match')),
        );
        return;
      }

      try {
        setState(() {
          isLoading = true;
        });
        final res = await ref.read(authMethodProvider).signUpUser(
              context: context,
              email: email,
              password: password,
              username: name,
              phoneNumber: phone,
            );

        // Mock sign-up logic (replace with your authentication logic)
        if (res) {
          showSnackBar(context, "Succesful Sign Up");
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoginPage()));
          emailController.text = '';
          passwordController.text = '';
          usernameController.text = '';
          confirmPasswordController.text = '';
        }
        setState(() {
          isLoading = false;
        });
      } catch (err) {
        setState(() {
          isLoading = false;
        });
        // ignore: use_build_context_synchronously
        showSnackBar(context, err.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Access the color state using ref.watch
    final colorState = ref.watch(colorProvider);

    return Scaffold(
      backgroundColor: colorState.baseColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Create an account",
                    style: TextStyle(
                      color: Color.fromRGBO(243, 156, 18, 3),
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextField(
                          controller: emailController,
                          prefix: const Icon(Icons.email),
                          hint: "Email",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          controller: usernameController,
                          prefix: const Icon(Icons.person),
                          hint: "Username",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          controller: phoneNumberController,
                          prefix: const Icon(Icons.phone),
                          hint: "Phone Number",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          isPass: true,
                          controller: passwordController,
                          prefix: const Icon(Icons.lock),
                          hint: "Password",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          isPass: true,
                          controller: confirmPasswordController,
                          prefix: const Icon(Icons.lock),
                          hint: "Confirm Password",
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        CustomButton(
                          onPressed: _signUp,
                          txt: "Sign Up",
                          width: double.infinity,
                          color: colorState.generatedColors.isNotEmpty
                              ? colorState.generatedColors[0]
                              : Colors.grey, // Use a generated color
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Already Have An Account?',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginPage(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Sign in',
                                style: TextStyle(color: Colors.lightGreen),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
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
                      color: Colors.green.withOpacity(0.4),
                      child: const Center(child: CircularProgressIndicator()),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
