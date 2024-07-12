import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.75);
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> cardList = [
      BalanceCard(
        color: Colors.blue,
        balance: '₵6,420.00',
        type: 'Debit',
      ),
      BalanceCard(
        color: Colors.red,
        balance: '₵4,420.00',
        type: 'Credit',
      ),
      BalanceCard(
        color: Colors.green,
        balance: '₵8,200.00',
        type: 'Savings',
      ),
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome',
                      style: TextStyle(fontSize: 18, color: Colors.lightGreen),
                    ),
                    Text(
                      'Elizabeth Nunito',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.settings),
                      onPressed: () {},
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.notification_add),
                    ),
                    const CircleAvatar(
                      backgroundColor: Colors.black,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Horizontal scrollable list of Balance Cards
            SizedBox(
              height: 180,
              child: PageView.builder(
                controller: _pageController,
                itemCount: cardList.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return AnimatedBuilder(
                    animation: _pageController,
                    builder: (context, child) {
                      double value = 1.0;
                      if (_pageController.position.haveDimensions) {
                        value = _pageController.page! - index;
                        value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
                      }
                      return Center(
                        child: SizedBox(
                          height: Curves.easeOut.transform(value) * 180,
                          width: Curves.easeOut.transform(value) * 300,
                          child: child,
                        ),
                      );
                    },
                    child: cardList[index],
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            // Dots indicator
            Center(
              child: DotsIndicator(
                dotsCount: cardList.length,
                // position: , // Convert to double here
                decorator: DotsDecorator(
                  activeColor: Colors.blue,
                  size: const Size.square(9.0),
                  activeSize: const Size(18.0, 9.0),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Budget Section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Budget for October'),
                  SizedBox(height: 10),
                  Text(
                    '₵2,478',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text('Cash Available'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Create Saving Goal Section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey),
              ),
              child: Row(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Create a Saving goal',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Lorem ipsum dolor sit amet,\nconsectetur adipiscing.',
                      ),
                    ],
                  ),
                  const Spacer(),
                  Switch(
                    value: true,
                    onChanged: (value) {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Recent Transactions Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Recent Transactions',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('See all'),
                ),
              ],
            ),
            // Transaction List
            const Column(
              children: [
                ListTile(
                  leading: Icon(Icons.cloud),
                  title: Text('Dropbox Plan'),
                  subtitle: Text('Subscription'),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '-₵144.00',
                        style: TextStyle(color: Colors.red),
                      ),
                      Text('18 June 2024'),
                    ],
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.work),
                  title: Text('Freelance Work'),
                  subtitle: Text('Income'),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '+₵421.00',
                        style: TextStyle(color: Colors.green),
                      ),
                      Text('18 June 2024'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BalanceCard extends StatelessWidget {
  final Color color;
  final String balance;
  final String type;

  BalanceCard({
    required this.color,
    required this.balance,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Balance',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 10),
          Text(
            balance,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            type,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
