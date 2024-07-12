import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text(
                    'In & Out',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(243, 156, 18, 3),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.search, color: Colors.blue),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Active Total Balance',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '₵8,420.00',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
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
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Divider(height: 3),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: IconButton(
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          icon: const Icon(
                            Icons.arrow_upward_rounded,
                            color: Colors.blue,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Up by 4% from last month',
                        style: TextStyle(
                          color: Color.fromRGBO(243, 156, 18, 3),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  'Expenses',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade700,
                  ),
                ),
                const SizedBox(width: 58),
                const Text(
                  'Expenses',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 58),
                const Text(
                  'Expenses',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        icon: const Icon(
                          Icons.cloud,
                          color: Colors.blue,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    title: const Text('Dropbox Plan'),
                    subtitle: const Text('Subscription'),
                    trailing: const Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '-₵144.00',
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                        Text('18 Sept 2019'),
                      ],
                    ),
                  ),
                  const Divider(color: Colors.grey),
                  ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        icon: const Icon(
                          Icons.music_note,
                          color: Colors.blue,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    title: const Text('Spotify Subscr.'),
                    subtitle: const Text('Subscription'),
                    trailing: const Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '-₵24.00',
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                        Text('12 Sept 2019'),
                      ],
                    ),
                  ),
                  const Divider(color: Colors.grey),
                  ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        icon: const Icon(
                          Icons.atm,
                          color: Colors.blue,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    title: const Text('ATM Withdrawal'),
                    subtitle: const Text('Cash Withdrawal'),
                    trailing: const Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '-₵32.00',
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                        Text('10 Sept 2019'),
                      ],
                    ),
                  ),
                  const Divider(color: Colors.grey),
                  ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        icon: const Icon(
                          Icons.fastfood,
                          color: Colors.blue,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    title: const Text('KFC Restaurant'),
                    subtitle: const Text('Food & Drink'),
                    trailing: const Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '-₵14.00',
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                        Text('09 Sept 2019'),
                      ],
                    ),
                  ),
                  const Divider(color: Colors.grey),
                  ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                        highlightColor: Colors.transparent,
                        icon: const Icon(
                          Icons.attach_money,
                          color: Colors.blue,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    title: const Text('Tax on Interest'),
                    subtitle: const Text('Tax & Bill'),
                    trailing: const Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '-₵1.00',
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                        Text('04 Sept 2019'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
