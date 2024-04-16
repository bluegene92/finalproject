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
    final numberOfExpenses = random.nextInt(10) + 30;

    List<String> weeklyExpenses = [
      "Groceries",
      "Rent",
      "Utilities",
      "Transportation",
      "Dining out",
      "Entertainment",
      "Clothing",
      "Healthcare",
      "Insurance",
      "Education",
      "Personal care",
      "Home maintenance",
      "Subscriptions",
      "Charity donations",
      "Pet expenses",
      "Miscellaneous"
    ];

    // Generate random expense data
    List<Expense> expenses = [];
    for (int i = 0; i < numberOfExpenses; i++) {
      int expenseIndex = random.nextInt(weeklyExpenses.length);
      String expenseDescription = weeklyExpenses[expenseIndex];
      expenses.add(Expense(
        description: expenseDescription,
        amount: (random.nextDouble() * 100).roundToDouble(),
        date: DateTime.now().subtract(Duration(
            days: random.nextInt(60),
            hours: random.nextInt(24),
            minutes: random.nextInt(60))),
      ));
    }

    // Update state with random expense data
    emit(expenses);
  }
}
