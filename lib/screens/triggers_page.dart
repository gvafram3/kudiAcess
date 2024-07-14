import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kudiaccess/screens/trigger_colors.dart';
import 'package:kudiaccess/utils/commons/custom_button.dart';
import 'dart:convert';

class TriggerPage extends StatefulWidget {
  const TriggerPage({super.key});

  @override
  State<TriggerPage> createState() => _TriggerPageState();
}

class _TriggerPageState extends State<TriggerPage> {
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  String dropdownvalue = 'Item 1';

  final TextEditingController _trigger1controller = TextEditingController();
  final TextEditingController _trigger2controller = TextEditingController();
  final TextEditingController _trigger3controller = TextEditingController();
  bool isSaved = false;
  @override
  void initState() {
    super.initState();
    _loadTriggers();
  }

  _loadTriggers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? triggersString = prefs.getString('triggers');
    if (triggersString != null) {
      Map<String, dynamic> triggersMap = jsonDecode(triggersString);
      setState(() {
        _trigger1controller.text = triggersMap['trigger1'] ?? '';
        _trigger2controller.text = triggersMap['trigger2'] ?? '';
        _trigger3controller.text = triggersMap['trigger3'] ?? '';
      });
    }
  }

  _saveTriggers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, String> triggersMap = {
      'trigger1': _trigger1controller.text,
      'trigger2': _trigger2controller.text,
      'trigger3': _trigger3controller.text,
    };
    String triggersString = jsonEncode(triggersMap);
    await prefs.setString('triggers', triggersString);
    setState(() {
      isSaved = true;
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
          "Enter your triggers here",
          style: TextStyle(color: Color.fromRGBO(243, 156, 18, 3)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Trigger 1",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: _trigger1controller,
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
                  "Trigger 2",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: _trigger2controller,
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
                  "Trigger 3",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: _trigger3controller,
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
                      onPressed: _saveTriggers,
                      txt: "Save",
                      width: 150,
                      color: Colors.green),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: isSaved
          ? CustomButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ColorTriggerPage()));
              },
              txt: "Next",
              width: 100,
              color: Colors.grey)
          : null,
    );
  }
}
