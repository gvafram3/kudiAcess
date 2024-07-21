import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:kudiaccess/utils/commons/custom_button.dart';
import 'package:kudiaccess/widgets/gradient_background.dart';

import 'setup_complete.dart';

class SetupBudgetPage extends StatefulWidget {
  const SetupBudgetPage({super.key});
  @override
  State<SetupBudgetPage> createState() => _SetupBudgetPageState();
}

class _SetupBudgetPageState extends State<SetupBudgetPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController monthlyIncomeController = TextEditingController();
  final TextEditingController categoryNameController = TextEditingController();
  final TextEditingController categoryBudgetController =
      TextEditingController();

  Future<void> saveBudgetDetails() async {
    if (_formKey.currentState!.validate()) {
      try {
        User? user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .collection('budget')
              .add({
            'monthly_income': monthlyIncomeController.text,
            'categories': [
              {
                'name': categoryNameController.text,
                'budget': categoryBudgetController.text,
              }
            ],
          });

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Budget details saved successfully')),
          );

          // Navigate to next page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SetupCompletePage(),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('User not logged in')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save budget details: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        mainContent: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 56),
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
                        'Set Up Budget',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 16),
                      CustomTextField2(
                          controller: monthlyIncomeController,
                          hint: "Monthly income"),
                      const SizedBox(
                        height: 14,
                      ),
                      const Text(
                        'Expense Categories',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField2(
                              controller: categoryNameController,
                              hint: 'Category Name',
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: CustomTextField2(
                              controller: categoryBudgetController,
                              hint: 'Monthly Budget (GH¢0.00)',
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Add category logic if required
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.lightGreen,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        height: 45,
                        width: 180,
                        child: const Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add_box_outlined, color: Colors.white),
                            SizedBox(width: 6),
                            Text(
                              "Add Category",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        )),
                      ),
                    ),
                    CustomButton(
                      onPressed: saveBudgetDetails,
                      txt: "Save",
                      width: 120,
                      color: const Color.fromRGBO(243, 156, 18, 3),
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

class CustomTextField2 extends StatefulWidget {
  const CustomTextField2(
      {super.key,
      required this.controller,
      this.isPass = false,
      required this.hint});
  final TextEditingController controller;
  final bool isPass;
  final String hint;

  @override
  State<CustomTextField2> createState() => _CustomTextField2State();
}

class _CustomTextField2State extends State<CustomTextField2> {
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
