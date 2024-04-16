import 'dart:math';

import 'package:finalproject/models/expense.dart';
import 'package:bloc/bloc.dart';

class ExpenseCubit extends Cubit<List<Expense>> {
  ExpenseCubit() : super([]);

  void addExpense(Expense expense) {
    emit([...state, expense]);
  }

  void generateRandomData() {
    // Generate a random number of expenses (between 5 and 10 in this example)
    final random = Random();
    final numberOfExpenses = random.nextInt(50) + 100;

    // Generate random expense data
    List<Expense> expenses = [];
    for (int i = 0; i < numberOfExpenses; i++) {
      expenses.add(Expense(
        description: 'Expense ${i + 1}',
        amount: (random.nextDouble() * 100).roundToDouble(),
        date: DateTime.now().subtract(Duration(days: random.nextInt(30))),
      ));
    }

    // Update state with random expense data
    emit(expenses);
  }
}
