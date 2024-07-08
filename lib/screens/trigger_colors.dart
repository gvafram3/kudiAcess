import 'package:flutter/material.dart';
// import 'package:kudiaccess/screens/sign_up.dart';
import 'package:kudiaccess/utils/commons/custom_button.dart';

import 'pick_colour.dart';

class ColorTriggerPage extends StatefulWidget {
  const ColorTriggerPage({super.key});

  @override
  State<ColorTriggerPage> createState() => _ColorTriggerPageState();
}

class _ColorTriggerPageState extends State<ColorTriggerPage> {
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  String dropdownvalue = 'Item 1';

  // final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 6,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text(
          "Enter your triggers colors here",
          style: TextStyle(color: Color.fromRGBO(243, 156, 18, 3)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Color 1",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(5),
                    errorStyle: const TextStyle(
                        color: Colors.redAccent, fontSize: 16.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Color 2",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(5),
                    errorStyle: const TextStyle(
                        color: Colors.redAccent, fontSize: 16.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Color 3",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(5),
                    errorStyle: const TextStyle(
                        color: Colors.redAccent, fontSize: 16.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
                maxLines: 1,
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: CustomButton(
                    onPressed: () {},
                    txt: "Save",
                    width: 150,
                    color: Colors.green),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: CustomButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PickColorScreen()));
          },
          txt: "Next",
          width: 100,
          color: Colors.grey),
    );
  }
}

// background: #F39C12;
