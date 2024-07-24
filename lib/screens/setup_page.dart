import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kudiaccess/screens/add_debit_card_page.dart';
import 'package:kudiaccess/utils/commons/custom_button.dart';

import '../providers/color_providers.dart';

class SetupPage extends ConsumerWidget {
  const SetupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorState = ref.watch(colorProvider);

    return Scaffold(
      backgroundColor: colorState.baseColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.18),
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                textAlign: TextAlign.center,
                'Welcome to FinclusionX! \nLet\'s get you set up',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 25),
              const Text(
                'Brief overview of the steps:',
                style: TextStyle(
                  color: Color.fromRGBO(243, 156, 18, 3),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                // textAlign: TextAlign.,
                '• Add Debit/Credit Card \n\n• Add Mobile Money information \n\n• Set Up Budget',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  const Spacer(),
                  CustomButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const AddDebitCardInfoPage()));
                      },
                      txt: 'Next',
                      width: 100,
                      color: Colors.lightGreen),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
