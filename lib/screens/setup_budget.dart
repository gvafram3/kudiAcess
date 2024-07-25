import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:kudiaccess/utils/commons/custom_button.dart';
import 'package:kudiaccess/widgets/gradient_background.dart';

import '../providers/color_providers.dart';
import 'setup_complete.dart';

class SetupBudgetPage extends ConsumerStatefulWidget {
  const SetupBudgetPage({super.key});
  @override
  ConsumerState<SetupBudgetPage> createState() => _SetupBudgetPageState();
}

class _SetupBudgetPageState extends ConsumerState<SetupBudgetPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController monthlyIncomeController = TextEditingController();

  // Lists to manage controllers for dynamically added categories
  final List<TextEditingController> categoryNameControllers = [
    TextEditingController()
  ];
  final List<TextEditingController> categoryBudgetControllers = [
    TextEditingController()
  ];

  Future<void> saveBudgetDetails() async {
    if (_formKey.currentState!.validate()) {
      try {
        User? user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          // Prepare categories data
          List<Map<String, String>> categories = [];
          for (int i = 0; i < categoryNameControllers.length; i++) {
            categories.add({
              'name': categoryNameControllers[i].text,
              'budget': categoryBudgetControllers[i].text,
            });
          }

          // Save to Firestore
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .collection('budget')
              .add({
            'monthly_income': monthlyIncomeController.text,
            'categories': categories,
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

  void _addCategory() {
    bool allFieldsFilled = true;
    for (int i = 0; i < categoryNameControllers.length; i++) {
      if (categoryNameControllers[i].text.isEmpty ||
          categoryBudgetControllers[i].text.isEmpty) {
        allFieldsFilled = false;
        break;
      }
    }

    if (allFieldsFilled) {
      setState(() {
        categoryNameControllers.add(TextEditingController());
        categoryBudgetControllers.add(TextEditingController());
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please fill all existing categories first')),
      );
    }
  }

  void _removeCategory(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Category'),
          content: const Text('Are you sure you want to delete this category?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                setState(() {
                  categoryNameControllers.removeAt(index);
                  categoryBudgetControllers.removeAt(index);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
            physics: const BouncingScrollPhysics(),
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
                      const SizedBox(height: 14),
                      const Text(
                        'Expense Categories',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14),
                      ),
                      const SizedBox(height: 14),
                      // Dynamically list category fields
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: categoryNameControllers.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                Expanded(
                                  child: CustomTextField2(
                                    controller: categoryNameControllers[index],
                                    hint: 'Category Name',
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: CustomTextField2(
                                    controller:
                                        categoryBudgetControllers[index],
                                    hint: 'Monthly Budget (GH¢0.00)',
                                  ),
                                ),
                                const SizedBox(width: 10),
                                // Delete category icon
                                IconButton(
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red),
                                  onPressed: () {
                                    _removeCategory(index);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: _addCategory,
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
        if (widget.hint.toLowerCase().contains('income') ||
            widget.hint.toLowerCase().contains('budget')) {
          if (double.tryParse(value) == null) {
            return 'Please enter a valid number';
          }
        }
        return null;
      },
    );
  }
}
