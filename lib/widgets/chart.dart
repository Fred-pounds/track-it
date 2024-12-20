import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transactions.dart';
import 'chart_bar.dart';

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
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    });
  }

  double get totalSpending {
    return groupedTransactionvalue.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransactionvalue.map((data) {
          return Flexible(
            fit: FlexFit.tight,
            child: ChartBar(
              label: data['day'].toString(),
              spendingAmount: double.parse(data['amount'].toString()),
              spendingPctOfTotal: totalSpending == 0.0 ? 0.0 :  (data['amount'] as double) / totalSpending,
            ),
          );
        }).toList()),
      ),
    );
  }
}
