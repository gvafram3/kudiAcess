import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 10),
            _buildBalanceCard(),
            const SizedBox(height: 20),
            _buildExpensesHeader(),
            const SizedBox(height: 8),
            _buildExpensesList(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'In & Out',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(243, 156, 18, 3),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.search, color: Colors.blue),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildBalanceCard() {
    return Container(
      width: double.infinity,
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
    );
  }

  Widget _buildExpensesHeader() {
    return Row(
      children: [
        Text(
          'Expenses',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blue.shade700,
          ),
        ),
        const SizedBox(width: 18),
        const Text(
          'Earnings',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 18),
        Expanded(
          child: Row(
            children: [
              const Text(
                'Sort by',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_drop_down_rounded),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildExpensesList() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        children: [
          _buildExpenseItem(
            icon: Icons.cloud,
            title: 'Dropbox Plan',
            subtitle: 'Subscription',
            amount: '-₵144.00',
            date: '18 Sept 2019',
          ),
          const Divider(color: Colors.grey),
          _buildExpenseItem(
            icon: Icons.music_note,
            title: 'Spotify Subscr.',
            subtitle: 'Subscription',
            amount: '-₵24.00',
            date: '12 Sept 2019',
          ),
          const Divider(color: Colors.grey),
          _buildExpenseItem(
            icon: Icons.atm,
            title: 'ATM Withdrawal',
            subtitle: 'Cash Withdrawal',
            amount: '-₵32.00',
            date: '10 Sept 2019',
          ),
          const Divider(color: Colors.grey),
          _buildExpenseItem(
            icon: Icons.fastfood,
            title: 'KFC Restaurant',
            subtitle: 'Food & Drink',
            amount: '-₵14.00',
            date: '09 Sept 2019',
          ),
          const Divider(color: Colors.grey),
          _buildExpenseItem(
            icon: Icons.attach_money,
            title: 'Tax on Interest',
            subtitle: 'Tax & Bill',
            amount: '-₵1.00',
            date: '04 Sept 2019',
          ),
        ],
      ),
    );
  }

  Widget _buildExpenseItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required String amount,
    required String date,
  }) {
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(8),
        ),
        child: IconButton(
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          icon: Icon(icon, color: Colors.blue),
          onPressed: () {},
        ),
      ),
      title: Text(title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
      subtitle: Text(subtitle),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            amount,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            date,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
