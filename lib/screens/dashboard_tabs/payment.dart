import 'package:flutter/material.dart';

import '../../widgets/add_payment_modal.dart';
import '../../widgets/delete_payment.dart';
import '../../widgets/edit_payment_modal.dart';
import '../notifications.dart';
import '../profile.dart';
import '../settings.dart';

class PaymentsScreen extends StatefulWidget {
  const PaymentsScreen({super.key});

  @override
  State<PaymentsScreen> createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _selectBillsValues = [
    'Select a bill',
    'Option 1',
    'Option 2',
    'Option 3'
  ];
  final List<String> _paymentMethodValues = [
    'Select payment',
    'Option 1',
    'Option 2',
    'Option 3'
  ];
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = _selectBillsValues.first; // Set default value
    _controller.text = _selectedValue!;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: 20),
            _buildUpcomingBillCard(),
            const SizedBox(height: 20),
            const Text(
              'Bill Payment',
              style: TextStyle(color: Colors.blue, fontSize: 14),
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BillPaymentItem(
                    icon: Icons.lightbulb_outlined, title: 'Electricity\nBill'),
                BillPaymentItem(icon: Icons.wifi, title: 'Internet\nRecharge'),
                BillPaymentItem(
                    icon: Icons.live_tv_rounded, title: 'Cable\nBill'),
                BillPaymentItem(
                    icon: Icons.phonelink_ring_sharp,
                    title: 'Mobile\nRecharge'),
                BillPaymentItem(
                    icon: Icons.speaker_phone_rounded, title: 'OTT\nBill'),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Pay a bill',
              style: TextStyle(color: Colors.blue, fontSize: 14),
            ),
            const SizedBox(height: 10),
            CustomDropdownTextField(
              dropdownValues: _selectBillsValues,
              hintText: 'Select a bill',
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter amount',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 20),
            CustomDropdownTextField(
              dropdownValues: _paymentMethodValues,
              hintText: 'Select payment',
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Background color
                    foregroundColor: Colors.white, // Text color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(12), // Custom border radius
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 28, vertical: 18), // Custom padding
                  ),
                  child: const Text(
                    'Confirm',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Scheduled Payment',
              style: TextStyle(color: Colors.blue, fontSize: 14),
            ),
            const SizedBox(height: 10),
            _buildScheduledPayments(),
          ],
        ),
      ),
    );
  }

  Row _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(width: 10),
        const Text(
          'Payments',
          style: TextStyle(
            fontSize: 18,
            color: Color.fromRGBO(243, 156, 18, 3),
          ),
        ),
        const Spacer(),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsScreen(),
                    ));
              },
            ),
            const SizedBox(width: 1),
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotificationsScreen(),
                    ));
              },
              icon: const Icon(Icons.notification_add),
            ),
            const SizedBox(width: 1),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const ProfileScreen()),
                  ),
                );
              },
              child: const CircleAvatar(
                backgroundColor: Colors.white54,
                child: Icon(
                  Icons.person_2_outlined,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Container _buildUpcomingBillCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Upcoming Bill',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blue,
                ),
              ),
              Text(
                'Electricity',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 4),
              Text(
                '₵820.00',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: IconButton(
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              icon: const Icon(
                Icons.add,
                color: Colors.blue,
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) {
                    return AddPaymentModal(
                      nameController: TextEditingController(),
                      amountController: TextEditingController(),
                      dateController: TextEditingController(),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Container _buildScheduledPayments() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: const BoxDecoration(
        color: Colors.white54,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: const Column(
        children: [
          PaymentItemRow(
            imagePath: 'assets/images/netflix.png',
            title: 'Netflix',
            date: '21 Sept',
            amount: '¢19.00',
          ),
          SizedBox(height: 20),
          PaymentItemRow(
            imagePath: 'assets/images/shopping.png',
            title: 'Shopping',
            date: '20 Sept',
            amount: '¢65.99',
          ),
          SizedBox(height: 20),
          PaymentItemRow(
            imagePath: 'assets/images/starbucks.png',
            title: 'Starbucks',
            date: '20 Sept',
            amount: '¢19.99',
          ),
        ],
      ),
    );
  }
}

class CustomDropdownTextField extends StatefulWidget {
  final List<String> dropdownValues;
  final String hintText;

  const CustomDropdownTextField({
    super.key,
    required this.dropdownValues,
    required this.hintText,
  });

  @override
  State<CustomDropdownTextField> createState() =>
      _CustomDropdownTextFieldState();
}

class _CustomDropdownTextFieldState extends State<CustomDropdownTextField> {
  late TextEditingController _controller;
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _selectedValue = widget.dropdownValues.first;
    _controller.text = _selectedValue!;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      controller: _controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        suffixIcon: PopupMenuButton<String>(
          icon: const Icon(Icons.arrow_drop_down),
          onSelected: (String newValue) {
            setState(() {
              _selectedValue = newValue;
              _controller.text = newValue;
            });
          },
          itemBuilder: (BuildContext context) {
            return widget.dropdownValues
                .map<PopupMenuItem<String>>((String value) {
              return PopupMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList();
          },
        ),
      ),
    );
  }
}

class BillPaymentItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const BillPaymentItem({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.blue.shade100,
            borderRadius: BorderRadius.circular(8),
          ),
          child: IconButton(
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            icon: Icon(icon),
            onPressed: () {},
          ),
        ),
        Text(
          title,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class PaymentItemRow extends StatelessWidget {
  final String imagePath;
  final String title;
  final String date;
  final String amount;

  const PaymentItemRow({
    super.key,
    required this.imagePath,
    required this.title,
    required this.date,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            color: Colors.blue.shade100,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Image.asset(imagePath, fit: BoxFit.cover),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Text(date),
          ],
        ),
        const Spacer(),
        Text(amount),
        const SizedBox(width: 6),
        IconButton(
          icon: const Icon(Icons.edit_square, color: Colors.orange),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return EditPaymentModal(
                  nameController: TextEditingController(text: title),
                  amountController: TextEditingController(text: amount),
                  dateController: TextEditingController(text: date),
                );
              },
            );
          },
        ),
        // const SizedBox(width: 6),
        IconButton(
          icon: const Icon(Icons.delete_forever_outlined, color: Colors.red),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return DeletePaymentModal();
              },
            );
          },
        ),
      ],
    );
  }
}
