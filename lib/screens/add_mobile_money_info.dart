import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:kudiaccess/screens/forgot_password.dart';
import 'package:kudiaccess/utils/commons/custom_button.dart';
import 'package:kudiaccess/widgets/gradient_background.dart';

import '../providers/color_providers.dart';
import 'setup_budget.dart';
// import 'setup_page.dart';
// import 'sign_up.dart';

class AddMobileMoneyInfoPage extends ConsumerStatefulWidget {
  const AddMobileMoneyInfoPage({super.key});
  @override
  ConsumerState<AddMobileMoneyInfoPage> createState() =>
      _AddMobileMoneyInfoPageState();
}

class _AddMobileMoneyInfoPageState
    extends ConsumerState<AddMobileMoneyInfoPage> {
  final _formKey = GlobalKey<FormState>();

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
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
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Add Mobile Money Information',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(height: 16),
                        CustomTextField2(
                            controller: usernameOrPhoneNumberController,
                            hint: "Mobile Money Provider"),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField2(
                            controller: passwordController,
                            hint: "Phone Number"),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField2(
                            controller: passwordController,
                            hint: "Account Name"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Click here to add new card details',
                        style: TextStyle(color: Colors.lightGreen),
                      ),
                      CustomButton(
                        onPressed: () {},
                        txt: "Save",
                        width: 120,
                        color: const Color.fromRGBO(243, 156, 18, 3),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SetupBudgetPage(),
                            ),
                          );
                        },
                        txt: "Skip",
                        width: 120,
                        color: const Color.fromRGBO(243, 156, 18, 3),
                      ),
                      CustomButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SetupBudgetPage(),
                            ),
                          );
                        },
                        txt: "Next",
                        width: 120,
                        color: Colors.lightGreen,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class CustomTextField2 extends ConsumerStatefulWidget {
  const CustomTextField2(
      {super.key,
      required this.controller,
      this.isPass = false,
      required this.hint});
  final TextEditingController controller;
  final bool isPass;
  final String hint;

  @override
  ConsumerState<CustomTextField2> createState() => _CustomTextField2State();
}

class _CustomTextField2State extends ConsumerState<CustomTextField2> {
  bool isHidden = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        filled: true,
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.lightGreen)),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.lightGreen)),
        hintText: widget.hint,
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter ${widget.hint}';
        }

        return null;
      },
    );
  }
}
