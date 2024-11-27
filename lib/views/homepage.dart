import 'package:flutter/material.dart';
import 'package:track_it/widgets/new_transactions.dart';
import '../models/transactions.dart';
import '../widgets/transactions_list.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<Transaction> transactions = [
    // Transaction(
    //   id: 't1',
    //   title: 'New Shoes',
    //   amount: 69.99,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'Weekly Groceries',
    //   amount: 16.53,
    //   date: DateTime.now(),
    // ),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
    );

    setState(() {
      transactions.add(newTx);
    });
  }

  void _startAddNewTx(context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: NewTransactions(addTx: _addNewTransaction),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          'Track It',
          style: Theme.of(context).textTheme.titleLarge,
                  ),
        actions: [
          IconButton(
            onPressed: () {
              _startAddNewTx(context);
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeaderSect(),
            TransactionsList(
              transactions: transactions,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _startAddNewTx(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildHeaderSect() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.all(10),
          child:  Text(
            'Your Transactions',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ],
    );
  }
}
