import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:kudiaccess/utils/commons/custom_button.dart';
import 'package:kudiaccess/widgets/gradient_background.dart';

import '../providers/color_providers.dart';
import 'add_mobile_money_info.dart';

class AddDebitCardInfoPage extends ConsumerStatefulWidget {
  const AddDebitCardInfoPage({super.key});
  @override
  ConsumerState<AddDebitCardInfoPage> createState() =>
      _AddDebitCardInfoPageState();
}

class _AddDebitCardInfoPageState extends ConsumerState<AddDebitCardInfoPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController cardholderNameController =
      TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  Future<void> saveCardDetails() async {
    if (_formKey.currentState!.validate()) {
      try {
        User? user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .collection('credit_details')
              .add({
            'cardholder_name': cardholderNameController.text,
            'card_number': cardNumberController.text,
            'expiry_date': expiryDateController.text,
            'cvv': cvvController.text,
          });

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Card details saved successfully')),
          );

          // Navigate to next page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddMobileMoneyInfoPage(),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('User not logged in')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save card details: $e')),
        );
      }
    }
  }

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
                        'Add Debit/Credit Card Information',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 16),
                      CustomTextField2(
                          controller: cardholderNameController,
                          hint: "Cardholder name"),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField2(
                          controller: cardNumberController,
                          hint: "Card No.: 123***5437"),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField2(
                          controller: expiryDateController, hint: "MM/YY"),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField2(controller: cvvController, hint: "CVV"),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      onPressed: saveCardDetails,
                      txt: "Save",
                      width: 120,
                      color: const Color.fromRGBO(243, 156, 18, 3),
                    ),
                  ],
                ),
                const SizedBox(height: 36),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const AddMobileMoneyInfoPage(),
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
                            builder: (context) =>
                                const AddMobileMoneyInfoPage(),
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
      ),
    );
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
