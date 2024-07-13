import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class AddPaymentModal extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController amountController;
  final TextEditingController dateController;

  const AddPaymentModal({
    super.key,
    required this.nameController,
    required this.amountController,
    required this.dateController,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Add Payment',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.cancel_outlined,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: amountController,
              decoration: InputDecoration(
                hintText: 'Enter amount',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: dateController,
              decoration: InputDecoration(
                hintText: 'Date',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    if (pickedDate != null) {
                      dateController.text =
                          '${pickedDate.day}/${pickedDate.month}/${pickedDate.year}';
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(child: ImageUploadWidget()),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 34, vertical: 22),
                ),
                child: const Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageUploadWidget extends StatelessWidget {
  const ImageUploadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: Colors.grey[400]!,
      strokeWidth: 2.0,
      borderType: BorderType.RRect,
      radius: const Radius.circular(12),
      dashPattern: const [6, 3],
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: double.infinity,
          height: 120,
          alignment: Alignment.center,
          child: Icon(
            Icons.upload,
            size: 90,
            color: Colors.grey[400],
          ),
        ),
      ),
    );
  }
}
