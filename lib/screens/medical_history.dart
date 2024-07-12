import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:kudiaccess/screens/triggers_page.dart';
import 'package:kudiaccess/utils/commons/custom_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MedicalHistory extends StatefulWidget {
  const MedicalHistory({super.key});

  @override
  State<MedicalHistory> createState() => _MedicalHistoryState();
}

class _MedicalHistoryState extends State<MedicalHistory> {
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  String dropdownvalue = 'Item 1';

  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  OverlayEntry? _overlayEntry;
  bool _isDropdownOpened = false;
  String? _selectedItem;
  final List<String> _items = ['Item 1', 'Item 2', 'Item 3'];
  final TextEditingController otherCondtionController = TextEditingController();
  final TextEditingController _medicalConditionController =
      TextEditingController();
  final TextEditingController _medicationsController = TextEditingController();
  final TextEditingController _allergiesController = TextEditingController();
  final TextEditingController _physicianNameController =
      TextEditingController();
  String? _uploadedFilePath;

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    _medicalConditionController.dispose();
    _medicationsController.dispose();
    _allergiesController.dispose();
    _physicianNameController.dispose();
    super.dispose();
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _uploadedFilePath = result.files.single.path;
      });
    }
  }

  Future<void> _saveData() async {
    if (_allergiesController.text.isNotEmpty &&
        _medicalConditionController.text.isNotEmpty &&
        _physicianNameController.text.isNotEmpty) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(
          'medicalCondition', _medicalConditionController.text);
      await prefs.setString('medications', _medicationsController.text);
      await prefs.setString('allergies', _allergiesController.text);
      await prefs.setString('physicianName', _physicianNameController.text);
      if (_uploadedFilePath != null) {
        await prefs.setString('uploadedFilePath', _uploadedFilePath!);
      }

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Data saved successfully')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Data saved successfully')));
    }
  }

  Future<void> _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _medicalConditionController.text =
          prefs.getString('medicalCondition') ?? '';
      _medicationsController.text = prefs.getString('medications') ?? '';
      _allergiesController.text = prefs.getString('allergies') ?? '';
      _physicianNameController.text = prefs.getString('physicianName') ?? '';
      _uploadedFilePath = prefs.getString('uploadedFilePath');
    });
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _toggleDropdown() {
    if (_isDropdownOpened) {
      _overlayEntry?.remove();
      _overlayEntry = null;
      setState(() {
        _isDropdownOpened = false;
      });
    } else {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context).insert(_overlayEntry!);
      setState(() {
        _isDropdownOpened = true;
      });
    }
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: offset.dy + size.height + 5.0,
        width: size.width,
        child: Material(
          elevation: 4.0,
          child: ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            children: _items.map((item) {
              return ListTile(
                title: Text(item),
                onTap: () {
                  _controller.text = item;
                  _toggleDropdown();
                },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  final _currencies = [
    "Autism Spectrum Disorder",
    "Sensory",
    "Processing Disorder",
    "ADHD",
    "Other",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 6,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text(
          "Medical status setup",
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
                const Text(
                  "Medical Conditions",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50,
                  child: FormField<String>(
                    builder: (FormFieldState<String> state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(5),
                            errorStyle: const TextStyle(
                                color: Colors.redAccent, fontSize: 16.0),
                            hintText: 'Please select medical condition',
                            hintStyle: const TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                        isEmpty: _selectedItem == '',
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: _selectedItem,
                            isDense: true,
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedItem = newValue;
                                state.didChange(newValue);
                              });
                            },
                            items: _currencies.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                if (_selectedItem == "Other") ...[
                  const Text("Enter medical condition"),
                  const SizedBox(
                    height: 5,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        hintText: "Other",
                        contentPadding: const EdgeInsets.all(5),
                        errorStyle: const TextStyle(
                            color: Colors.redAccent, fontSize: 16.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                    maxLines: 1,
                  ),
                ],
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Medications",
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
                  maxLines: 3,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Allergies",
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
                  maxLines: 3,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Physician",
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
                  height: 15,
                ),
                const Text(
                  "Add file attachment",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(
                  height: 4,
                ),
                Center(
                  child: DottedBorder(
                    strokeWidth: 2,
                    color: Colors.grey,
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(10),
                    dashPattern: const [5, 5],
                    child: SizedBox(
                      height: 70,
                      width: double.infinity,
                      child: IconButton(
                        onPressed: () {
                          _pickFile();
                        },
                        icon: _uploadedFilePath == null
                            ? const Icon(
                                Icons.upload,
                                size: 40,
                              )
                            : Column(
                                children: [
                                  const Icon(Icons.upload),
                                  Text(_uploadedFilePath!.split("/").last),
                                ],
                              ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: CustomButton(
                      onPressed: () {
                        _saveData();
                      },
                      txt: "Save",
                      width: 150,
                      color: Colors.green),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: CustomButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const TriggerPage()));
          },
          txt: "Next",
          width: 100,
          color: Colors.grey),
    );
  }
}

// background: #F39C12;
