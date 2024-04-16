import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../models/expense.dart';
import '../services/expense_cubit.dart';

class RecentActivityCard extends StatelessWidget {
  const RecentActivityCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpenseCubit, List<Expense>>(
        builder: (context, expenses) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Container(
            width: 390,
            height: 400,
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
                    itemCount: expenses.length,
                    itemBuilder: (context, index) {
                      expenses.sort((a, b) => b.date.compareTo(a.date));
                      Expense expense = expenses[index];
                      String formattedDate =
                          DateFormat("MM/dd/yyy").format(expense.date);
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
                              Text(formattedDate,
                                  style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 12,
                                  ))
                            ]),
                        trailing: Text('\$${expense.amount}',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 18)),
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
