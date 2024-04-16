import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../models/expense.dart';
import '../services/expense_cubit.dart';
import '../utility/date-helper.dart';

class RecentActivityCard extends StatefulWidget {
  final DateTime date;

  const RecentActivityCard({super.key, required this.date});

  @override
  State<RecentActivityCard> createState() => _RecentActivityCardState();
}

class _RecentActivityCardState extends State<RecentActivityCard> {
  late DateTime _currentDate;
  @override
  void initState() {
    super.initState();
    _currentDate = widget.date;
  }

  @override
  void didUpdateWidget(covariant RecentActivityCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.date != oldWidget.date) {
      setState(() {
        _currentDate = widget.date;
      });
    }
  }

  List<Expense> filterExpenses(
      List<Expense> expenses, DateTime startDate, DateTime endDate) {
    return expenses.where((expense) {
      return expense.date.isAfter(startDate) && expense.date.isBefore(endDate);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpenseCubit, List<Expense>>(
        builder: (context, expenses) {
      DateTime startDate = DateHelper.startWeek(_currentDate);
      DateTime endDate = DateHelper.endWeek(_currentDate);
      var filteredExpenses = filterExpenses(expenses, startDate, endDate);

      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Container(
            width: 390,
            height: 385,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(211, 230, 227, 1.0),
                border: Border.all(color: Colors.black87, width: 3.0),
                borderRadius: BorderRadius.circular(25.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child:
                      Text("Recent Activities", style: TextStyle(fontSize: 24)),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredExpenses.length,
                    itemBuilder: (context, index) {
                      filteredExpenses.sort((a, b) => b.date.compareTo(a.date));
                      Expense expense = filteredExpenses[index];
                      String formattedDate =
                          DateFormat("MM/dd/yyy").format(expense.date);

                      if (DateHelper.isToday(expense.date)) {
                        formattedDate = "Today";
                      }

                      if (DateHelper.isYesterday(expense.date)) {
                        formattedDate = "Yesterday";
                      }

                      return ListTile(
                        leading: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Colors.black87, width: 2.0)),
                          child: Icon(Icons.payment),
                        ),
                        title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(expense.description,
                                  style: const TextStyle(
                                      height: 0.8,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                  '$formattedDate ${DateFormat.jm().format(expense.date)}',
                                  style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 12,
                                  ))
                            ]),
                        trailing: Text('\$${expense.amount}',
                            style: const TextStyle(
                                color: Color.fromARGB(255, 77, 148, 77),
                                fontSize: 18)),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
