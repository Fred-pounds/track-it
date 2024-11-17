import 'package:flutter/material.dart';

import '../models/transactions.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      amount: 16.53,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHeaderSect(),
          _buildTransactionList(),
        ],
      ),
    );
  }

  Widget _buildHeaderSect() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: const Text(
        'Your Transactions',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildTransactionList() {
    return Column(
        children: transactions.map((tx) {
      return Card(
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.purple,
                  width: 2,
                ),
              ),
              padding: const EdgeInsets.all(10),
              child: Text(tx.amount.toString()),
            ),
            Column(
              children: [
                Text(tx.title),
                Text(tx.date.toString()),
              ],
            )
          ],
        ),
      );
    }).toList());
  }
}
