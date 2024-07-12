import 'package:flutter/material.dart';
import 'package:kudiaccess/screens/medical_history.dart';
import 'package:kudiaccess/utils/commons/custom_button.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(const Duration(seconds: 5), () {
  //     Navigator.push(context,
  //         MaterialPageRoute(builder: (context) => const MedicalHistory()));
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage("assets/images/logo.png")),
            SizedBox(
              height: 20,
            ),
            Image(image: AssetImage("assets/images/pay.png")),
            SizedBox(
              height: 20,
            ),
            Text(
              "Make payments and track your transactions",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightGreen),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: CustomButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MedicalHistory()));
            },
            txt: "Get Started",
            width: double.infinity,
            color: Colors.lightGreen),
      ),
    );
  }
}
