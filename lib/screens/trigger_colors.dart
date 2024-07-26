import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'pick_colour.dart';
import 'package:kudiaccess/utils/commons/custom_button.dart';

class ColorTriggerPage extends StatefulWidget {
  const ColorTriggerPage({super.key});

  @override
  State<ColorTriggerPage> createState() => _ColorTriggerPageState();
}

class _ColorTriggerPageState extends State<ColorTriggerPage> {
  final TextEditingController _color1controller = TextEditingController();
  final TextEditingController _color2controller = TextEditingController();
  final TextEditingController _color3controller = TextEditingController();
  bool isSaved = false;
  bool allFieldsFilled = false;

  @override
  void initState() {
    super.initState();
    _loadColors();
    _color1controller.addListener(_checkFields);
    _color2controller.addListener(_checkFields);
    _color3controller.addListener(_checkFields);
  }

  _loadColors() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? colorsString = prefs.getString('colors');
    if (colorsString != null) {
      Map<String, dynamic> colorsMap = jsonDecode(colorsString);
      setState(() {
        _color1controller.text = colorsMap['color1'] ?? '';
        _color2controller.text = colorsMap['color2'] ?? '';
        _color3controller.text = colorsMap['color3'] ?? '';
      });
    }
  }

  _saveColors() async {
    if (_color1controller.text.trim().isNotEmpty &&
        _color2controller.text.trim().isNotEmpty &&
        _color3controller.text.trim().isNotEmpty) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      Map<String, String> colorsMap = {
        'color1': _color1controller.text,
        'color2': _color2controller.text,
        'color3': _color3controller.text,
      };
      String colorsString = jsonEncode(colorsMap);
      await prefs.setString('colors', colorsString);
      setState(() {
        isSaved = true;
      });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Please fill all field')));
    }
  }

  _checkFields() {
    setState(() {
      allFieldsFilled = _color1controller.text.isNotEmpty &&
          _color2controller.text.isNotEmpty &&
          _color3controller.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 6,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text(
          "Enter preferred colours here",
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
              const Text(
                "Colour 1",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: _color1controller,
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
                "Colour 2",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: _color2controller,
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
                "Colour 3",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: _color3controller,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(5),
                    errorStyle: const TextStyle(
                        color: Colors.redAccent, fontSize: 16.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
                maxLines: 1,
              ),
              const SizedBox(
                height: 80,
              ),
              Center(
                child: CustomButton(
                    onPressed: _saveColors,
                    txt: "Save",
                    width: 150,
                    color: allFieldsFilled ? Colors.green : Colors.grey),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: isSaved
          ? CustomButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PickColorScreen()));
              },
              txt: "Next",
              width: 100,
              color: Colors.grey)
          : null,
    );
  }
}
