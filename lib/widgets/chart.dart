import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transactions.dart';

class Chart extends StatelessWidget {
  final List<Transaction> transaction;
  const Chart({super.key, required this.transaction});

  List<Map<String, Object>> get groupedTransactionvalue {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
     var totalSum = 0.0;

      for (int i = 0; i < transaction.length; i++) {
        if (transaction[i].date.day == weekDay.day &&
            transaction[i].date.month == weekDay.month &&
            transaction[i].date.year == weekDay.year) {
          totalSum += transaction[i].amount;
        }
      }
      return {'day': DateFormat.E(weekDay), 'amount': totalSum};
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(),
    );
  }
}
